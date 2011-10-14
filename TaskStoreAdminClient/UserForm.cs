using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace TaskStoreAdminClient
{
    public partial class UserForm : Form
    {
        TaskStoreEntities TaskStore = new TaskStoreEntities();
        List<User> users;
        User user;
        int index;

        public UserForm()
        {
            InitializeComponent();
        }

        private void GetUsers()
        {
            users = TaskStore.Users.
                Include("ListTypes.Fields").
                Include("Tags").
                Include("TaskLists.Tasks.TaskTags").
                Include("TaskLists").
                ToList();
            UserGrid.DataSource = users;
        }


        private void UserGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            index = e.RowIndex;
            user = users[index];
        }

        private void UserForm_Load(object sender, EventArgs e)
        {
            GetUsers();
        }

        private void TaskLists_Click(object sender, EventArgs e)
        {
            TaskListForm tlform = new TaskListForm();
            tlform.tasklists = users[index].TaskLists.ToList();
            tlform.TaskStore = TaskStore;
            tlform.Show();
        }

        public delegate void WebServiceCallbackDelegate(Object obj);
        private void WebServiceCallback(object obj)
        {
            if (obj != null)
                MessageBox.Show("operation succeeded");
            else
                MessageBox.Show("operation failed");
        }

        private void Delete_Click(object sender, EventArgs e)
        {
            if (user == null)
                return;

            TaskStoreClientEntities.User u = new TaskStoreClientEntities.User()
            {
                Name = user.Name,
                Password = user.Password,
                ID = user.ID,
            };

            TaskStoreClientEntities.WebServiceHelper.DeleteUser(u, new WebServiceCallbackDelegate(WebServiceCallback), null);

            return;

            User dbUser = TaskStore.Users.
                Include("ListTypes.Fields").
                Include("Tags").
                Include("TaskLists.Tasks.TaskTags").
                Single(us => us.ID == user.ID);
            TaskStore.Users.DeleteObject(dbUser);
            int rows = TaskStore.SaveChanges();
            if (rows < 1)
                MessageBox.Show("delete failed");
            else
                MessageBox.Show("delete successful");
        }
    }
}
