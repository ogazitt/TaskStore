using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AE.Net.Mail;
using System.Threading;
using AE.Net.Mail.Imap;
using System.Text.RegularExpressions;
using TaskStoreServerEntities;

namespace ImapTest
{
    class Program
    {
        static TaskStore TaskStore
        {
            get
            {
                // use a cached context (to promote serving values out of EF cache) 
                return TaskStore.Current;
            }
        }

        static Guid toDoListType;
        static Guid ToDoListType
        {
            get
            {
                if (toDoListType == Guid.Empty)
                    toDoListType = TaskStore.ListTypes.Single(lt => lt.Name == "To Do List" && lt.UserID == null).ID;
                return toDoListType;
            }
        }

        static void Main(string[] args)
        {

#if IDLE
            // idle support means we can use an event-based programming model to get informed when 
            var mre = new System.Threading.ManualResetEvent(false);
            using (var imap = GetGmailImap()) {
                Console.WriteLine("connected");
                imap.SelectMailbox("inbox");

                // a new message comes in
                imap.NewMessage += Imap_NewMessage;
                while (!mre.WaitOne(5000)) //low for the sake of testing; typical timeout is 30 minutes
                    imap.Noop();
            }
#else
            // no idle support means we need to poll the mailbox
            while (true)
            {
                using (var imap = GetGmailImap())
                {
                    Console.WriteLine("connected");
                    imap.SelectMailbox("inbox");

                    int count = imap.GetMessageCount();
                    Console.WriteLine("got " + count.ToString() + " messages");

                    if (count > 0)
                    {
                        MailMessage[] messages = imap.GetMessages(0, count, false);
                        foreach (var m in messages)
                        {
                            ProcessMessage(m);
                            imap.MoveMessage(m.Uid, " processed");
                            Console.WriteLine("processed message " + m.Subject);
                        }
                    }

                    // sleep 10 seconds
                    Thread.Sleep(10000);
                }
            }
#endif
        }

        static ImapClient GetGmailImap()
        {
            return new ImapClient("imap.gmail.com", "taskstorenew", "qwe022..", ImapClient.AuthMethods.Login, 993, true);
        }

        static Guid? GetList(User u, string body)
        {
            TaskList tasklist = null;

            // a hash indicates a list name to add the new task to
            int index = body.IndexOf("#list:");
            if (index >= 0)
            {
                string listName = body.Substring(index + 1);
                int i = listName.IndexOf('\n');
                if (i > 0)
                {
                    listName = listName.Substring(0, i);
                    listName = listName.Trim();
                    tasklist = TaskStore.TaskLists.FirstOrDefault(tl => tl.UserID == u.ID && tl.Name == listName);
                    if (tasklist != null)
                        return tasklist.ID;
                }
            }

            tasklist = TaskStore.TaskLists.FirstOrDefault(tl => tl.UserID == u.ID && tl.ListTypeID == ToDoListType);
            if (tasklist != null)
                return tasklist.ID;
            else
                return null;
        }

        static string GetSubject(string subject)
        {
            bool found = true;
            string processedSubject = subject.Trim();

            while (found == true)
            {
                found = false;

                string[] stripArray = { "RE:", "Re:", "re:", "FW:", "Fwd:", "Fw:" };
                foreach (var str in stripArray)
                {
                    if (processedSubject.StartsWith(str, true, null))
                    {
                        processedSubject = processedSubject.Substring(str.Length);
                        processedSubject = processedSubject.Trim();
                        found = true;
                        break;
                    }
                }
            }
            return processedSubject;
        }

        static bool IsAlphaNum(char c)
        {
            if (c >= 'A' && c <= 'Z' ||
                c >= 'a' && c <= 'z' ||
                c >= '0' && c <= '9')
                return true;
            else
                return false;
        }
        static void Imap_NewMessage(object sender, MessageEventArgs e)
        {
            var imap = (sender as ImapClient);
            var msg = imap.GetMessage(e.MessageCount - 1);
            Console.WriteLine(msg.Subject);
        }

        static void ParseFields(Task task, string body)
        {
            string text = body;
            if (text == null || text == "")
                return;

            Match m;

            // parse the text for a phone number
            m = Regex.Match(text, @"(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?", RegexOptions.IgnoreCase);
            if (m != null && m.Value != null && m.Value != "")
                task.Phone = m.Value;

            // parse the text for an email address
            m = Regex.Match(text, @"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)\b", RegexOptions.IgnoreCase);
            if (m != null && m.Value != null && m.Value != "")
                task.Email = m.Value;

            // parse the text for a website
            m = Regex.Match(text, @"((http|https)(:\/\/))?([a-zA-Z0-9]+[.]{1}){2}[a-zA-z0-9]+(\/{1}[a-zA-Z0-9]+)*\/?", RegexOptions.IgnoreCase);
            if (m != null && m.Value != null && m.Value != "")
                task.Website = m.Value;

            // parse the text for a date
            m = Regex.Match(text, @"(0?[1-9]|1[012])([- /.])(0?[1-9]|[12][0-9]|3[01])\2(20|19)?\d\d", RegexOptions.IgnoreCase);
            if (m != null && m.Value != null && m.Value != "")
            {
                // convert to datetime, then back to string.  this is to canonicalize all dates into yyyy/MM/dd.
                task.DueDate = ((DateTime) Convert.ToDateTime(m.Value)).ToString("yyyy/MM/dd");
            }
        }

        static void ProcessMessage(MailMessage m)
        {
            string from = m.From.Address;
            if (from == null || from == "")
                return;
            string taskName = GetSubject(m.Subject);
            string body = m.Body;
            if (body == null || body == "")
                body = m.BodyHtml;
            
            var users = TaskStore.Users.Where(u => u.Email == from).ToList();
            foreach (var u in users)
            {
                Guid? list = GetList(u, body);
                if (list != null)
                {
                    DateTime now = DateTime.Now;
                    Task t = new Task()
                    {
                        ID = Guid.NewGuid(),
                        Name = taskName,
                        TaskListID = (Guid) list,
                        Created = now,
                        LastModified = now,
                    };
                    
                    // extract structured fields such as due date, e-mail, website, phone number
                    ParseFields(t, body);

                    var task = TaskStore.Tasks.Add(t);
                    int rows = TaskStore.SaveChanges();

                    if (rows > 0)
                    {
                        Console.WriteLine("added " + t.Name);
                    }
                }
            }
        }
    }
}
