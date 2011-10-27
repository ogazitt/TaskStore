using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Reflection;

namespace TaskStoreAdminClient
{
    public partial class TaskListForm : Form
    {
        public TaskList tasklist;
        public Task task;
        public List<TaskList> tasklists;
        public List<Task> tasks;
        int tasklistindex;
        int taskindex;
        public TaskStoreEntities TaskStore;

        public TaskListForm()
        {
            InitializeComponent();
        }

        private void TaskListForm_Load(object sender, EventArgs e)
        {
            TaskListGrid.DataSource = tasklists;
        }

        private void TaskListGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            tasklistindex = e.RowIndex;
            if (tasklistindex < 0)
                return;
            tasklist = tasklists[tasklistindex];
            tasks = tasklist.Tasks.ToList();
            TaskGrid.DataSource = tasks;
        }

        private void TaskGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (tasklist == null)
                return;
            taskindex = e.RowIndex;
            task = tasks[taskindex];
        }

        private void Save_Click(object sender, EventArgs e)
        {
            if (tasklist == null)
                return;
            TaskList dbTaskList = TaskStore.TaskLists.Single(tl => tl.ID == tasklist.ID);

            for (int i = 0; i < TaskListGrid.Columns.Count; i++)
            {
                var val = TaskListGrid[i, tasklistindex].Value;
                var propname = TaskListGrid.Columns[i].DataPropertyName;

                PropertyInfo pi = typeof(TaskList).GetProperty(propname);
                pi.SetValue(dbTaskList, val, null);
            }
            int rows = TaskStore.SaveChanges();
            if (rows < 1)
                MessageBox.Show("update failed");
            else
                MessageBox.Show("update successful");
        }

        private void TaskSave_Click(object sender, EventArgs e)
        {
            if (task == null)
                return;
            Task dbTask = TaskStore.Tasks.Single(t => t.ID == task.ID);

            for (int i = 0; i < TaskGrid.Columns.Count; i++)
            {
                var val = TaskGrid[i, taskindex].Value;
                var propname = TaskListGrid.Columns[i].DataPropertyName;

                PropertyInfo pi = typeof(Task).GetProperty(propname);
                pi.SetValue(dbTask, val, null);
            }
            int rows = TaskStore.SaveChanges();
            if (rows < 1)
                MessageBox.Show("update failed");
            else
                MessageBox.Show("update successful");
        }
    }
}
