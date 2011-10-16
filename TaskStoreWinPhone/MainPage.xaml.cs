using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;
using System.Reflection;
using System.Windows.Data;
using Microsoft.Phone.Shell;
using System.IO.IsolatedStorage;
using TaskStoreClientEntities;
using TaskStoreWinPhoneUtilities;
using System.Xml.Linq;
using System.Windows.Resources;
using System.IO;
using Microsoft.Phone.Tasks;
using System.Text;
using System.ComponentModel;
using System.Threading;
using System.Windows.Navigation;

namespace TaskStoreWinPhone
{
    public partial class MainPage : PhoneApplicationPage, INotifyPropertyChanged
    {
        private bool initialSync = false;
        private bool isDebugTabEnabled = false;
        private bool debugPanelAdded = false;
        private bool addedTasksPropertyChangedHandler = false;
        private StackPanel DebugPanel = null;
        private bool disableListBoxSelectionChanged = true;

        // Constructor
        public MainPage()
        {
            InitializeComponent();

            // enable the debug tab if this is a debug build
#if DEBUG
            isDebugTabEnabled = true;
#endif

            // Set the data context of the page to the main view model
            DataContext = App.ViewModel;

            // set the data context of the search header to this page
            SearchHeader.DataContext = this;

            this.Loaded += new RoutedEventHandler(MainPage_Loaded);
        }

        // property that controls the sort order for the ListBoxes
        public CollectionViewSource TasksViewSource { get; set; }

        private string searchTerm;
        /// <summary>
        /// Search Term to filter task collection on
        /// </summary>
        /// <returns></returns>
        public string SearchTerm
        {
            get
            {
                return searchTerm == null ? null : String.Format("search results on {0}", searchTerm);
            }
            set
            {
                if (value != searchTerm)
                {
                    searchTerm = value;
                    NotifyPropertyChanged("SearchTerm");
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void NotifyPropertyChanged(String propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (null != handler)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
                // do the below instead to avoid Invalid cross-thread access exception
                //Deployment.Current.Dispatcher.BeginInvoke(() => { handler(this, new PropertyChangedEventArgs(propertyName)); });
            }
        }

        #region Event handlers

        private void AboutMenuItem_Click(object sender, EventArgs e)
        {
            // Navigate to the about page
            NavigationService.Navigate(new Uri("/AboutPage.xaml", UriKind.Relative));
        }

        // Event handlers for Debug tab
        private void Debug_DeleteButton_Click(object sender, EventArgs e)
        {
            // clear the record queue
            RequestQueue.RequestRecord record = RequestQueue.DequeueRequestRecord();
            while (record != null)
            {
                record = RequestQueue.DequeueRequestRecord();
            }

            // re-render the debug tab
            RenderDebugTab();
        }

        private void Debug_AddButton_Click(object sender, EventArgs e)
        {
            Task task;

            // create some debug records

            // create a to-do style task
            TaskList taskList = App.ViewModel.TaskLists.Single(tl => tl.ListTypeID == ListType.ToDo);
            taskList.Tasks.Add(task = new Task() { TaskListID = taskList.ID, Name = "Check out TaskStore", Description = "Play with it", Due = DateTime.Today, PriorityID = 1 });
            
            // enqueue the Web Request Record
            RequestQueue.EnqueueRequestRecord(
                new RequestQueue.RequestRecord()
                {
                    ReqType = RequestQueue.RequestRecord.RequestType.Insert,
                    Body = task,
                    ID = task.ID
                });

            // create a shopping list
            taskList = App.ViewModel.TaskLists.Single(tl => tl.ListTypeID == ListType.Shopping);
            string[] names = { "Milk", "OJ", "Cereal", "Coffee", "Bread" };
            foreach (var name in names)
            {
                taskList.Tasks.Add(task = new Task() { TaskListID = taskList.ID, Name = name });

                // enqueue the Web Request Record
                RequestQueue.EnqueueRequestRecord(
                    new RequestQueue.RequestRecord()
                    {
                        ReqType = RequestQueue.RequestRecord.RequestType.Insert,
                        Body = task,
                        ID = task.ID
                    });
            }

            if (1 == 2)
            {
                for (int j = 0; j < 10000; j++)
                    taskList.Tasks.Add(new Task() { TaskListID = taskList.ID, Name = "j" + j.ToString() });

                // save the changes to local storage
                var datetimelist = new List<DateTime>();
                for (int i = 0; i < 3; i++)
                {
                    StorageHelper.WriteTaskLists(App.ViewModel.TaskLists);
                    datetimelist.Add(DateTime.Now);
                }
            }
            // trigger a databinding refresh for tasks
            App.ViewModel.NotifyPropertyChanged("Tasks");

            // re-render the debug tab
            RenderDebugTab();
        }

        private void EmailMenuItem_Click(object sender, EventArgs e)
        {
            // create email body
            StringBuilder sb = new StringBuilder("TaskStore Data:\n\n");
            foreach (TaskList tl in App.ViewModel.TaskLists)
            {
                sb.AppendLine(tl.Name);

                ListType listType;
                // get listType for this list
                try
                {
                    listType = App.ViewModel.ListTypes.Single(lt => lt.ID == tl.ListTypeID);
                }
                catch (Exception)
                {
                    // if can't find the list type, use the first
                    listType = App.ViewModel.ListTypes[0];
                }

                foreach (Task task in tl.Tasks)
                {
                    sb.AppendLine("    " + task.Name);
                    foreach (Field f in listType.Fields.OrderBy(f => f.SortOrder))
                    {
                        FieldType fieldType;
                        // get the field type for this field
                        try
                        {
                            fieldType = App.ViewModel.Constants.FieldTypes.Single(ft => ft.FieldTypeID == f.FieldTypeID);
                        }
                        catch (Exception)
                        {
                            continue;
                        }

                        // already printed out the task name
                        if (fieldType.DisplayName == "Name")
                            continue;

                        PropertyInfo pi;
                        // make sure the property exists on the local type
                        try
                        {
                            pi = task.GetType().GetProperty(fieldType.Name);
                            if (pi == null)
                                continue;  // see comment below
                        }
                        catch (Exception)
                        {
                            // we can't do anything with this property since we don't have it on the local type
                            // this indicates that the phone software isn't caught up with the service version
                            // but that's ok - we can keep going
                            continue;
                        }

                        // skip the uninteresting fields
                        if (pi.CanWrite == false ||
                            pi.PropertyType == typeof(Guid) ||
                            pi.PropertyType == typeof(Guid?) || 
                            pi.Name == "TaskTags" ||
                            pi.Name == "Created" ||
                            pi.Name == "LastModified")
                            continue;

                        // get the value of the property
                        var val = pi.GetValue(task, null);
                        if (val != null)
                        {
                            switch (pi.Name)
                            {
                                case "Due":
                                    sb.AppendFormat("        {0}: {1}\n", pi.Name, ((DateTime)val).ToString("d"));
                                    break;
                                case "PriorityID":
                                    sb.AppendFormat("        {0}: {1}\n", "Priority", Task.PriorityNames[(int)val]);
                                    break;
                                default:
                                    sb.AppendFormat("        {0}: {1}\n", pi.Name, val.ToString());
                                    break;
                            }
                        }
                    }
                }
            }

            EmailComposeTask emailComposeTask = new EmailComposeTask();
            emailComposeTask.Subject = "TaskStore Data";
            emailComposeTask.Body = sb.ToString();
            emailComposeTask.Show();
        }

        private void EraseMenuItem_Click(object sender, EventArgs e)
        {
            // confirm the delete and return if the user cancels
            MessageBoxResult result = MessageBox.Show(
                "are you sure you want to erase all data on the phone?  unless you paired the phone to an account, your data will be not be retrievable.",
                "confirm erasing all data",
                MessageBoxButton.OKCancel);
            if (result == MessageBoxResult.Cancel)
                return;

            StorageHelper.WriteConstants(null);
            StorageHelper.WriteDefaultTaskListID(null);
            StorageHelper.WriteListTypes(null);
            StorageHelper.WriteTags(null);
            StorageHelper.WriteTaskLists(null);
            StorageHelper.WriteUserCredentials(null);
            RequestQueue.DeleteQueue();
        }

        // Handle selection changed on ListBox
        private void ListsListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // If selected index is -1 (no selection) do nothing
            if (ListsListBox.SelectedIndex == -1)
                return;

            TaskList tasklist = App.ViewModel.TaskLists[ListsListBox.SelectedIndex];
            // Navigate to the new page
            NavigationService.Navigate(new Uri("/TaskListPage.xaml?type=TaskList&ID=" + tasklist.ID.ToString(), UriKind.Relative));

            // Reset selected index to -1 (no selection)
            ListsListBox.SelectedIndex = -1;
        }

        // Event handlers for Lists tab
        private void Lists_AddButton_Click(object sender, EventArgs e)
        {
            // Navigate to the ListEditor page
            NavigationService.Navigate(
                new Uri("/TaskListEditor.xaml?ID=new",
                UriKind.Relative));
        }

        private void MainPage_Loaded(object sender, RoutedEventArgs e)
        {
            // if this is a DEBUG build, add a debug tab
            if (isDebugTabEnabled && debugPanelAdded == false)
            {
                var debugPivot = new PivotItem() { Header = "debug" };
                DebugPanel = new StackPanel() { Name = "DebugPanel", Margin = new Thickness(0,0,0,17), Width = 432 };
                debugPivot.Content = DebugPanel;
                MainPivot.Items.Add(debugPivot);
                debugPanelAdded = true;
            }
          
            // if data isn't loaded from storage yet, load the app data
            if (!App.ViewModel.IsDataLoaded)
            {
                // Load app data from local storage (user creds, about tab data, constants, list types, tasklists, etc)
                App.ViewModel.LoadData();
            }

            // if haven't synced with web service yet, try now
            if (initialSync == false)
            {
                // attempt to sync with the Service
                App.ViewModel.SyncWithService();

                initialSync = true;
            }

            TasksViewSource = new CollectionViewSource();
            using (TasksViewSource.DeferRefresh())
            {
                // set up the view source
                TasksViewSource.SortDescriptions.Add(new SortDescription("DueSort", ListSortDirection.Ascending));
                TasksViewSource.SortDescriptions.Add(new SortDescription("PriorityIDSort", ListSortDirection.Descending));
                TasksViewSource.SortDescriptions.Add(new SortDescription("Name", ListSortDirection.Ascending));
                TasksViewSource.Filter += new FilterEventHandler(Tasks_Search_Filter);

                // set the source for the Tasks ViewSource
                TasksViewSource.Source = App.ViewModel.Tasks;

                if (!addedTasksPropertyChangedHandler)
                {
                    App.ViewModel.PropertyChanged += new PropertyChangedEventHandler((s, args) =>
                    {
                        // if the Tasks property was signaled, trigger a rebind
                        if (args.PropertyName == "Tasks")
                        {
                            TasksViewSource.Source = App.ViewModel.Tasks;
                            TasksListBox.ItemsSource = TasksViewSource.View;
                        }
                    });
                    addedTasksPropertyChangedHandler = true;
                }
            }

            // workaround for the CollectionViewSource wrapper 
            // setting SelectionMode to Multiple removes the issue where the SelectionChanged event handler gets
            // invoked every time the list is changed (which triggers a re-sort).  The SelectionMode gets reset back
            // to Single when the SelectionChanged events handler gets called (for a valid reason - i.e. user action)
            TasksListBox.SelectionMode = SelectionMode.Multiple;

            // set the datacontext on a couple of elements
            TasksListBox.DataContext = this;
            SearchHeader.DataContext = this;

            // enable the tasks listbox
            disableListBoxSelectionChanged = false;
        }

        // When page is navigated to, switch to the specified tab
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            string tabString = "";
            // check for the optional "Tab" parameter
            if (NavigationContext.QueryString.TryGetValue("Tab", out tabString) == false)
            {
                return;
            }

            switch (tabString)
            {
                case "Tasks":
                    MainPivot.SelectedIndex = 0;  // switch to tasks tab
                    break;
                case "Lists":
                    MainPivot.SelectedIndex = 1;  // switch to lists tab
                    break;
                case "Tags":
                    MainPivot.SelectedIndex = 2;  // switch to tags tab
                    break;
                default:
                    break;
            }
        }

        private void Pivot_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // get a reference to the add button (always first) and remove any eventhandlers
            var AddButton = (ApplicationBarIconButton)ApplicationBar.Buttons[0];

            try
            {
                AddButton.Click -= new EventHandler(Tasks_AddButton_Click);
                AddButton.Click -= new EventHandler(Lists_AddButton_Click);
                AddButton.Click -= new EventHandler(Tags_AddButton_Click);
                AddButton.Click -= new EventHandler(Debug_AddButton_Click);

                // remove the last button (in case it was added)
                ApplicationBar.Buttons.RemoveAt(3);
            }
            catch (Exception)
            {
            }

            // do tab-specific processing (e.g. adding the right Add button handler)
            switch (MainPivot.SelectedIndex)
            {
                case 0: // tasks
                    AddButton.Click += new EventHandler(Tasks_AddButton_Click);
                    var searchButton = new ApplicationBarIconButton() 
                    { 
                        Text = "filter", 
                        IconUri = new Uri("/Images/appbar.feature.search.rest.png", UriKind.Relative) 
                    };
                    searchButton.Click += new EventHandler(Tasks_SearchButton_Click);                    
                    ApplicationBar.Buttons.Add(searchButton);
                    break;
                case 1: // lists
                    AddButton.Click += new EventHandler(Lists_AddButton_Click);
                    break;
                case 2: // tags
                    AddButton.Click += new EventHandler(Tags_AddButton_Click);
                    break;
                case 3: // debug
                    AddButton.Click += new EventHandler(Debug_AddButton_Click);
                    // add the "delete" button
                    var deleteButton = new ApplicationBarIconButton()
                    {
                        Text = "delete queue",
                        IconUri = new Uri("/Images/appbar.delete.rest.png", UriKind.Relative)
                    };
                    deleteButton.Click += new EventHandler(Debug_DeleteButton_Click);
                    ApplicationBar.Buttons.Add(deleteButton);
                    RenderDebugTab();
                    break;
            }
        }

        private void RefreshButton_Click(object sender, EventArgs e)
        {
            App.ViewModel.SyncWithService();
        }

        // Event handlers for search popup
        private void SearchPopup_SearchButton_Click(object sender, EventArgs e)
        {
            SearchTerm = SearchTextBox.Text;
            
            // trigger a databinding refresh for tasks
            App.ViewModel.NotifyPropertyChanged("Tasks");

            // close the popup
            SearchPopup.IsOpen = false;
        }

        private void SearchPopup_ClearButton_Click(object sender, EventArgs e)
        {
            SearchTerm = null;

            // trigger a databinding refresh for tasks
            App.ViewModel.NotifyPropertyChanged("Tasks");

            // close the popup
            SearchPopup.IsOpen = false;
        }

        private void SettingsButton_Click(object sender, EventArgs e)
        {
            // Navigate to the settings page
            NavigationService.Navigate(new Uri("/SettingsPage.xaml", UriKind.Relative));
        }

        // Event handlers for tags tab
        private void Tag_HyperlinkButton_Click(object sender, RoutedEventArgs e)
        {
            HyperlinkButton button = (HyperlinkButton)e.OriginalSource;
            Guid tagID = (Guid)button.Tag;

            // Navigate to the new page
            NavigationService.Navigate(new Uri("/TaskListPage.xaml?type=Tag&ID=" + tagID.ToString(), UriKind.Relative));
        }

        private void Tags_AddButton_Click(object sender, EventArgs e)
        {
            // Navigate to the ListEditor page
            NavigationService.Navigate(
                new Uri("/TagEditor.xaml?ID=new",
                UriKind.Relative));
        }

        private void TagsListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // If selected index is -1 (no selection) do nothing
            if (TagsListBox.SelectedIndex == -1)
                return;

            Tag tag = App.ViewModel.Tags[TagsListBox.SelectedIndex];
            // Navigate to the new page
            NavigationService.Navigate(new Uri("/TaskListPage.xaml?type=Tag&ID=" + tag.ID.ToString(), UriKind.Relative));

            // Reset selected index to -1 (no selection)
            TagsListBox.SelectedIndex = -1;
        }

        // Event handlers for tasks tab
        private void Tasks_AddButton_Click(object sender, EventArgs e)
        {
            // Navigate to the ListEditor page
            NavigationService.Navigate(
                new Uri("/TaskPage.xaml?ID=new",
                UriKind.Relative));
        }

        /// <summary>
        /// Handle click event on Complete checkbox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Tasks_CompleteCheckbox_Click(object sender, RoutedEventArgs e)
        {
            CheckBox cb = (CheckBox)e.OriginalSource;
            Guid taskID = (Guid)cb.Tag;

            // get the task that was just updated, and ensure the Complete flag is in the correct state
            Task task = App.ViewModel.Tasks.Single<Task>(t => t.ID == taskID);

            // create a copy of that task
            Task taskCopy = new Task(task);

            // toggle the Complete flag on the task copy to reflect the original state 
            taskCopy.Complete = !taskCopy.Complete;

            // enqueue the Web Request Record
            RequestQueue.EnqueueRequestRecord(
                new RequestQueue.RequestRecord()
                {
                    ReqType = RequestQueue.RequestRecord.RequestType.Update,
                    Body = new List<Task>() { taskCopy, task },
                    BodyTypeName = "Task",
                    ID = taskCopy.ID
                });

            // save the changes to local storage
            StorageHelper.WriteTaskLists(App.ViewModel.TaskLists);

            // trigger a databinding refresh for tasks
            App.ViewModel.NotifyPropertyChanged("Tasks");

            // trigger a sync with the Service 
            App.ViewModel.SyncWithService();
        }

        private void Tasks_SearchButton_Click(object sender, EventArgs e)
        {
            SearchPopup.IsOpen = true;
            SearchTextBox.Focus();
        }

        private void Tasks_Search_Filter(object sender, FilterEventArgs e)
        {
            // retrieve the task
            Task task = e.Item as Task;
            if (task == null)
            {
                e.Accepted = false;
                return;
            }

            // if the task is completed, don't list it
            if (task.Complete)
            {
                e.Accepted = false;
                return;
            }

            // get the tasklist - if it's a template, this item doesn't qualify as a match
            TaskList taskList = App.ViewModel.TaskLists.Single(tl => tl.ID == task.TaskListID);
            if (taskList.Template == true)
            {
                e.Accepted = false;
                return;
            }

            // if there is no search term present, this item automatically qualifies as a match
            if (searchTerm == null)
            {
                e.Accepted = true;
                return;
            }

            // search for the term in every non-null string field
            foreach (var pi in task.GetType().GetProperties())
            {
                if (pi.PropertyType.Name == "String" && pi.CanWrite)
                {
                    string stringVal = (string)pi.GetValue(task, null);
                    // perform case-insensitive comparison
                    if (stringVal != null && stringVal.IndexOf(searchTerm, StringComparison.CurrentCultureIgnoreCase) >= 0)
                    {
                        e.Accepted = true;
                        return;
                    }
                }
            }

            // no matches - return false
            e.Accepted = false;
        }

        private void TasksListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // if listbox is disabled (because we've navigated off this page), return without handling this event.
            // this condition can happen when we've already navigated off this page, and an async network operation
            // creates a new Tasks collection, which is databound to this ListBox.  Since we have a ViewSourceCollection as 
            // the databinding source, and a sort is applied, the Selection will be changed automatically and trigger this
            // event even though we're not on the page anymore.
            if (disableListBoxSelectionChanged == true)
                return;

            // If selected index is -1 (no selection) do nothing
            if (TasksListBox.SelectedIndex == -1)
                return;

            // reset the selection mode to single (it's now safe to do so)
            TasksListBox.SelectionMode = SelectionMode.Single;

            // find the task that corresponds to this selection
            Task t = (Task)TasksListBox.SelectedItem;

            if (t == null)
                return;

            // Navigate to the new page
            NavigationService.Navigate(
                new Uri(String.Format("/TaskPage.xaml?ID={0}&taskListID={1}", t.ID, t.TaskListID),
                UriKind.Relative));

            // we need to disable the selection changed event so that we don't get cascading calls to Navigate which will
            // cause a navigation exception
            disableListBoxSelectionChanged = true;

            // Reset selected index to -1 (no selection)
            TasksListBox.SelectedIndex = -1;
        }

        #endregion 

        #region Helpers

        private void RenderDebugTab()
        {
            // don't render anything unless the debug panel is enabled
            if (isDebugTabEnabled == false)
                return;
                        
            // remove all children and then add some debug spew
            DebugPanel.Children.Clear();
            DebugPanel.Children.Add(new TextBlock() { Text = String.Format("URL: {0}", WebServiceHelper.BaseUrl) });
            DebugPanel.Children.Add(new TextBlock() { Text = String.Format("Connected: {0}", App.ViewModel.LastNetworkOperationStatus) });
            List<RequestQueue.RequestRecord> requests = RequestQueue.GetAllRequestRecords();
            if (requests != null)
            {
                foreach (var req in requests)
                {
                    string typename;
                    string reqtype;
                    string id;
                    string name;
                    RetrieveRequestInfo(req, out typename, out reqtype, out id, out name);
                    DebugPanel.Children.Add(new TextBlock() { Text = String.Format("{0} {1} {2} (id {3})", reqtype, typename, name, id) });
                }
            }
        }
        
        private static void RetrieveRequestInfo(RequestQueue.RequestRecord req, out string typename, out string reqtype, out string id, out string name)
        {
            typename = req.BodyTypeName;
            reqtype = "";
            id = "";
            name = "";
            switch (req.ReqType)
            {
                case RequestQueue.RequestRecord.RequestType.Delete:
                    reqtype = "Delete";
                    id = ((TaskStoreEntity)req.Body).ID.ToString();
                    name = ((TaskStoreEntity)req.Body).Name;
                    break;
                case RequestQueue.RequestRecord.RequestType.Insert:
                    reqtype = "Insert";
                    id = ((TaskStoreEntity)req.Body).ID.ToString();
                    name = ((TaskStoreEntity)req.Body).Name;
                    break;
                case RequestQueue.RequestRecord.RequestType.Update:
                    reqtype = "Update";
                    switch (req.BodyTypeName)
                    {
                        case "Tag":
                            name = ((List<Tag>)req.Body)[0].Name;
                            id = ((List<Tag>)req.Body)[0].ID.ToString();
                            break;
                        case "Task":
                            name = ((List<Task>)req.Body)[0].Name;
                            id = ((List<Task>)req.Body)[0].ID.ToString();
                            break;
                        case "TaskList":
                            name = ((List<TaskList>)req.Body)[0].Name;
                            id = ((List<TaskList>)req.Body)[0].ID.ToString();
                            break;
                        default:
                            name = "(unrecognized entity)";
                            break;
                    }
                    break;
                default:
                    reqtype = "Unrecognized";
                    break;
            }
        }

        #endregion
    }
}