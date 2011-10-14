using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO;
using System.IO.IsolatedStorage;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using TaskStoreClientEntities;
using System.Text;
using System.Threading;

namespace TaskStoreWinPhoneUtilities
{
    public class StorageHelper
    {
        static private Dictionary<string, object> fileLocks = new Dictionary<string, object>()
        {
            { "Constants", new object() },
            { "ListTypes", new object() },
            { "Tags",      new object() },
            { "TaskStore", new object() },
        };
        
        // alias for Application Settings
        static private IsolatedStorageSettings AppSettings = IsolatedStorageSettings.ApplicationSettings;

        /// <summary>
        /// Read the contents of the Constants XML file from isolated storage
        /// </summary>
        /// <returns>retrieved constants</returns>
        public static Constants ReadConstants()
        {
            // use the app's isolated storage to retrieve the tasks
            using (IsolatedStorageFile file = IsolatedStorageFile.GetUserStoreForApplication())
            {
                // use a DCS to de/serialize the xml file
                DataContractSerializer dc = new DataContractSerializer(typeof(Constants), "Constants", "");

                try
                {
                    // if the file opens, read the contents and replace the generated data
                    using (IsolatedStorageFileStream stream = new IsolatedStorageFileStream("Constants.xml", FileMode.Open, file))
                    {
                        return (Constants)dc.ReadObject(stream);
                    }
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Write the Constants XML to isolated storage
        /// </summary>
        public static void WriteConstants(Constants constants)
        {
            // use the app's isolated storage to write the tasks
            using (IsolatedStorageFile file = IsolatedStorageFile.GetUserStoreForApplication())
            {
                try
                {
                    if (constants == null)
                    {
                        file.DeleteFile("Constants.xml");
                        return;
                    }

                    DataContractSerializer dc = new DataContractSerializer(constants.GetType(), "Constants", "");

                    using (IsolatedStorageFileStream stream = file.CreateFile("Constants.xml"))
                    {
                        dc.WriteObject(stream, constants);
                    }
                }
                catch (Exception)
                {
                }
            }
        }

        /// <summary>
        /// Get the Default TaskList ID from isolated storage
        /// </summary>
        /// <returns>TaskList ID if saved, otherwise null</returns>
        public static Guid ReadDefaultTaskListID()
        {
            try
            {
                Guid guid = new Guid((string)AppSettings["DefaultTaskListID"]);
                return guid;
            }
            catch (Exception)
            {
                return Guid.Empty;
            }
        }

        /// <summary>
        /// Write Default TaskList ID to isolated storage
        /// </summary>
        /// <param name="user">TaskList ID to write</param>
        public static void WriteDefaultTaskListID(Guid? defaultTaskListID)
        {
            try
            {
                if (defaultTaskListID == null)
                    AppSettings["DefaultTaskListID"] = null;
                else
                    AppSettings["DefaultTaskListID"] = (string)defaultTaskListID.ToString();
                AppSettings.Save();
            }
            catch (Exception)
            {
            }
        }

        /// <summary>
        /// Read the contents of the ListTypes XML file from isolated storage
        /// </summary>
        /// <returns>retrieved list of ListTypes</returns>
        public static ObservableCollection<ListType> ReadListTypes()
        {
            return InternalReadFile<ListType>("ListTypes");
        }

        /// <summary>
        /// Write the ListTypes XML to isolated storage
        /// </summary>
        public static void WriteListTypes(ObservableCollection<ListType> listTypes)
        {
            // do the write on the background thread
            //ThreadPool.QueueUserWorkItem(delegate { InternalWriteFile<ListType>(listTypes, "ListTypes"); });
            InternalWriteFile<ListType>(listTypes, "ListTypes"); 
        }

        /// <summary>
        /// Read the contents of the Tags XML file from isolated storage
        /// </summary>
        /// <returns>retrieved list of Tags</returns>
        public static ObservableCollection<Tag> ReadTags()
        {
            return InternalReadFile<Tag>("Tags");
        }

        /// <summary>
        /// Write the Tags XML to isolated storage
        /// </summary>
        public static void WriteTags(ObservableCollection<Tag> tags)
        {
            // do the write on the background thread
            //ThreadPool.QueueUserWorkItem(delegate { InternalWriteFile<Tag>(tags, "Tags"); });
            InternalWriteFile<Tag>(tags, "Tags");
        }

        /// <summary>
        /// Read the contents of the TaskStore XML file from isolated storage
        /// </summary>
        /// <returns>retrieved list of TaskLists</returns>
        public static ObservableCollection<TaskList> ReadTaskLists()
        {
            return InternalReadFile<TaskList>("TaskStore");
        }

        /// <summary>
        /// Write the TaskStore XML to isolated storage
        /// </summary>
        public static void WriteTaskLists(ObservableCollection<TaskList> taskLists)
        {
            // do the write on the background thread
            //ThreadPool.QueueUserWorkItem(delegate { InternalWriteFile<TaskList>(taskLists, "TaskStore"); });
            InternalWriteFile<TaskList>(taskLists, "TaskStore"); 
        }

        /// <summary>
        /// Get the User from isolated storage
        /// </summary>
        /// <returns>User structure if saved, otherwise null</returns>
        public static User ReadUserCredentials()
        {
            try
            {
                User user = new User()
                {
                    Name = (string)AppSettings["Username"],
                    Password = (string)AppSettings["Password"],
                    Email = (string)AppSettings["Email"]
                };
                if (user.Name == null || user.Name == "")
                    return null;
                return user;
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Write User credentials to isolated storage
        /// </summary>
        /// <param name="user">User credentials to write</param>
        public static void WriteUserCredentials(User user)
        {
            try
            {
                if (user == null)
                {
                    AppSettings["Username"] = null;
                    AppSettings["Password"] = null;
                    AppSettings["Email"] = null; 
                    AppSettings.Save();
                }
                else
                {
                    AppSettings["Username"] = user.Name;
                    AppSettings["Password"] = user.Password;
                    AppSettings["Email"] = user.Email;
                    AppSettings.Save();
                }
            }
            catch (Exception)
            {
            }
        }

        #region Helpers

        /// <summary>
        /// Generic ReadFile method
        /// </summary>
        /// <typeparam name="T">Type of the returned collection items</typeparam>
        /// <param name="elementName">Name of the element (as well as the prefix of the filename)</param>
        /// <returns>ObservableCollection of the type passed in</returns>
        private static ObservableCollection<T> InternalReadFile<T>(string elementName)
        {
            ObservableCollection<T> list = new ObservableCollection<T>();
            // use the app's isolated storage to retrieve the tasks
            using (IsolatedStorageFile file = IsolatedStorageFile.GetUserStoreForApplication())
            {
                // use a DCS to de/serialize the xml file
                DataContractSerializer dc = new DataContractSerializer(list.GetType(), elementName, "");
                IsolatedStorageFileStream stream = null;

                // try to open the file
                try
                {
                    using (stream = new IsolatedStorageFileStream(elementName + ".xml", FileMode.Open, file))
                    {
                        // if the file opens, read the contents and replace the generated data
                        try
                        {
                            DateTime one = DateTime.Now;
                            list = (ObservableCollection<T>)dc.ReadObject(stream);
                            if (1 == 2)
                            {
                                DateTime two = DateTime.Now;
                                stream.Position = 0;
                                string s = new StreamReader(stream).ReadToEnd();
                                DateTime three = DateTime.Now;
                                TimeSpan o = two - one;
                                TimeSpan t = three - two;
                            }
                        }
                        catch (Exception ex)
                        {
                            stream.Position = 0;
                            string s = new StreamReader(stream).ReadToEnd();
                            return null;
                        }
                    }
                }
                catch (Exception)
                {
                    return null;
                }

                return list;
            }
        }

        /// <summary>
        /// Generic WriteFile method
        /// </summary>
        /// <typeparam name="T">Type of the items in the list passed in</typeparam>
        /// <param name="list">List to serialize</param>
        /// <param name="elementName">Name of the element (as well as the prefix of the filename)</param>
        private static void InternalWriteFile<T>(ObservableCollection<T> list, string elementName)
        {
            // This method is only thread-safe IF the list parameter that is passed in is locked as well.
            // this is because the DCS below will enumerate through the list and if the list is modified while
            // this enumeration is taking place, DCS will throw.
            lock (fileLocks[elementName])
            {
                // use the app's isolated storage to write the tasks
                using (IsolatedStorageFile file = IsolatedStorageFile.GetUserStoreForApplication())
                {
                    try
                    {
                        if (list == null)
                        {
                            file.DeleteFile(elementName + ".xml");
                            return;
                        }

                        DataContractSerializer dc = new DataContractSerializer(list.GetType(), elementName, "");
                        using (IsolatedStorageFileStream stream = file.CreateFile(elementName + ".xml"))
                        {
                            dc.WriteObject(stream, list);
                        }
                    }
                    catch (Exception ex)
                    {
#if DEBUG
                        MessageBox.Show("InternalWriteFile failed: " + ex.Message);
#endif
                    }
                }
            }
        }

        #endregion
    }
}
