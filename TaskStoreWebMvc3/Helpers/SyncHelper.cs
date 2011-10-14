using System;
using System.Net;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Collections;
using TaskStoreWeb.Models;
using TaskStoreServerEntities;

namespace TaskStoreWeb.Helpers
{
    public class SyncHelper
    {
        /// <summary>
        /// Resolve the tasklists passed by the client against the Service's list
        /// </summary>
        /// <param name="taskstore">Database context</param>
        /// <param name="id">UserID for the user</param>
        /// <param name="clientTaskLists">Client tasklists</param>
        public static void ResolveTaskLists(TaskStore taskstore, int id, List<TaskList> clientTaskLists)
        {
#if KILL

            // if the client has no data, nothing to process
            if (clientTaskLists == null)
                return;

            // sort the client tasklists by TaskListID
            clientTaskLists = clientTaskLists.OrderBy(tl => tl.TaskListID).ToList();
            IEnumerator clientTaskListEnumerator = clientTaskLists.GetEnumerator();
            TaskList clientTaskList = clientTaskListEnumerator.Current as TaskList;

            // process any new inserts
            bool inserted = false;
            while (clientTaskList.TaskListID == 0)
            {
                // process insert
                taskstore.TaskLists.Add(clientTaskList);
                inserted = true;
                // move to the next client tasklist
                if (clientTaskListEnumerator.MoveNext() == false)
                {
                    clientTaskList = null;
                    break;
                }
                clientTaskList = clientTaskListEnumerator.Current as TaskList;
            }
            if (inserted)
                taskstore.SaveChanges();

            // process the rest of the entities passed in by the client
            var serverTaskLists = taskstore.TaskLists.Include("User").Include("Tasks").Where(tl => tl.UserID == id).OrderBy(tl => tl.TaskListID).ToList();
            while (true)
            {
                // if no more client entities, terminate processing
                if (clientTaskList == null)
                    return;

                try 
	            {	        
		            TaskList tasklist = taskstore.TaskLists.Single(tl => tl.TaskListID == clientTaskList.TaskListID);
                    if (tasklist.
	            }
	            catch (Exception)
	            {
		            // tasklist not found: either a botched addition or a deletion that has already expired
		            throw;
	            }
                   taskstore.TaskLists.Where(tl => tl.TaskListID == clientTaskList.TaskListID);


            }

            IEnumerator serverTaskListEnumerator = serverTaskLists.GetEnumerator();
            TaskList serverTaskList = serverTaskListEnumerator.Current as TaskList;

            while (clientTaskList != null && serverTaskList != null)
            {
                // process new inserts
                if (clientTaskList.TaskListID == 0)
                {
                    clientTaskListEnumerator.MoveNext();
                    clientTaskList = clientTaskListEnumerator.Current as TaskList;
            TaskList serverTaskList = serverTaskListEnumerator.Current as TaskList;
                }

                // something still left to copy/resolve
                if (clientTaskList != null)
                {
                    // if server tasklist also not null, resolve; else, copy client 
                    if (serverTaskList != null)
                    {
                        if 
                    }
                    else
                    {
                        // only client exists
                    }
                }
                else
                {
                }
            }
            // create a new collection and copy the remote tasklists into it as a starting point
            List<TaskList> newTaskLists = new List<TaskList>();
            foreach (TaskList tl in serverTaskLists)
                newTaskLists.Add(new TaskList(tl));

            // merge any of the local tasklists as approriate
            foreach (TaskList localTaskList in clientTaskLists)
            {
                bool foundTaskList = false;
                foreach (TaskList remoteTaskList in newTaskLists)
                {
                    if (localTaskList.TaskListID == remoteTaskList.TaskListID)
                    {
                        ResolveTasks(localTaskList, remoteTaskList);
                        foundTaskList = true;
                        break;
                    }
                }
                // if didn't find the local task list in the remote data set, copy it over
                if (foundTaskList == false)
                {
                    newTaskLists.Add(localTaskList);
                }
            }

            return newTaskLists;
#endif
        }


        /// <summary>
        /// Resolve Task conflicts between a local and remote TaskList
        /// </summary>
        /// <param name="localTaskList">Local task list</param>
        /// <param name="remoteTaskList">Task list retrieved from the data service</param>
        private static void ResolveTasks(TaskList localTaskList, TaskList remoteTaskList)
        {
            foreach (Task localTask in localTaskList.Tasks)
            {
                bool foundTask = false;
                foreach (Task remoteTask in remoteTaskList.Tasks)
                {
                    if (localTask.ID == remoteTask.ID)
                    {
                        foundTask = true;
                        break;
                    }
                }
                if (foundTask == false)
                {
                    remoteTaskList.Tasks.Add(localTask);
                }
            }
        }
    }
}
