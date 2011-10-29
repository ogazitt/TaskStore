﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>TaskStore on Windows Phone 7</title>
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/WP7.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=320" />
    <meta name="viewport" content="user-scalable=no" />
</head>
<body>
    <div class="page">
        <div id="header">
            <%--<h1><img alt="" src="../../Images/taskstore-logo2.png" width="30" height="30"/>&nbsp;taskstore</h1>--%>
            <div id="logo">
                <img id="taskstoreimg" src="/Images/taskstore-logo2.png" alt="" height="80" width="80"/>
            </div>

            <div id="title">
                <h1>taskstore</h1>
            </div>

            <div id="endofheader">
            </div>
        </div>
        <div id="main">
            <h2>Welcome to TaskStore!</h2>
            <p>
                TaskStore is a new kind of task organizer.  While other tasklist applications merely help you track your to-do list, 
                TaskStore helps you complete your tasks by making valuable suggestions.
            </p>
            <p>
                TaskStore is a fully-functional "offline" application - meaning that it works great whether or not you have created 
                an account, and whether or not your phone happens to be connected to the Web.
            </p>
            <p>
                However, to get the most out of TaskStore, you will want to create a free account.  Here are some of the benefits:
            </p>
            <ul>
                    <li>All of your data will automatically be backed up in the Cloud</li>
                    <li>You can access your data from any device - your computer, a web browser, or your mobile device</li>
                    <li>You will enjoy TaskStore's unique capability of suggesting ways to complete your task</li>
            </ul>
            <p>
                To create your free account, go to the <i>Settings</i> page at any time by tapping the <i>settings</i> button.  
                Don't worry, unless you tell us otherwise, any data you've already created will automatically be sent to the Cloud for safekeeping.
            </p>
            <h2>Tasks</h2>
            <p>
                The main tab in the application is the <i>Tasks</i> tab.  This tab provides you a sorted list of all the tasks in all of 
                you lists.  You can filter this page by tapping the <i>filter</i> button.  You can also create new tasks in this tab by 
                tapping the <i>add</i> button.  Notice that the first thing you need to tell us is what list you want to add the task to.
                You can control which list this defaults in the <i>Settings</i> page.
            </p>
            <h2>Lists</h2>
            <p>
                Lists are a convenient way of organizing your tasks.  To view your lists, swipe to the <i>lists</i> tab.
                You may have noticed that we've already created two lists for you - <i>To Do</i> and <i>Shopping</i>.  
                You can add a new list by tapping the <i>add</i> button.  
            </p>
            <p>
                If you want to change or delete any of the lists 
                (the ones added automatically or your own lists), you can tap the list name and then tap the <i>edit</i> button.  
                Once you've tapped a list name, you can see the tasks within that list.  Each of the tabs will sort by a different 
                field - by name, by due date, or by priority.  
            </p>
            <p>
                You can add new tasks from this page, either by tapping the <i>add</i>
                button, which will let you enter all of the fields of the task, or by tapping the <i>quick add</i> button, which 
                will allow you to rapidly create new tasks by entering just their name in the dialog and then tapping <i>add</i>.
                Once you're done, tap <i>done</i> to dismiss the dialog.  Notice the microphone icon - tapping this allows you to 
                use our voice recognition service to translate a task name you speak into the microphone into text.  Try it!
            </p>
            <h2>List Types</h2>
            <p>
                The two lists we've added each have a different list type - <i>To Do List</i> and <i>Shopping List</i>, respectively.  These two 
                list types have different styles - the <i>To Do List</i> has more fields that are displayed when you add or edit a task that belongs to 
                a list of this type.  The <i>Shopping List</i> has only a <i>Name</i> field and is more appropriate for simple items.  Finally, there
                is another built-in list type called <i>Freeform List</i> - this list type has a big <i>Details</i> field that allows entering 
                a free-form description, which can contain phone numbers, email addresses, websites, and so on.
            </p>
            <h2>Tasks and Actions</h2>
            <p>
                When you tap a task, you are placed on the Actions tab, which displays any quick actions associated with that task. 
                For example, if your task has a due date, the available actions are <i>Add to calendar</i> and <i>postpone to tomorrow</i>.
                If your task has a phone number, a website, or an email address, you will have the appropriate actions to <i>phone</i>, 
                <i>text</i>, <i>browse</i>, or <i>email</i>.
            </p>
            <h2>Tags</h2>
            <p>
                Tags are a convenient way to associate a set of related tasks across lists.  You can have zero, one, or as many tags as you want 
                on a Task.  Just enter them in, separated by commas.  The <i>Tags</i> tab allows you to look at all your tags and bring up all the  
                tasks that have a particular tag.  Tags can also be color-coded to provide a better visual cue.  Just tap the tag name in the 
                <i>Tags</i> tab, and then tap the <i>edit</i> button.  You can also delete tags from this screen.
            </p>
            <h2>Advanced features</h2>
            <ul>
                <li><b>Templates:</b> You can designate a list as a template by tapping the list, tapping the <i>edit</i> button, and tapping the 
                <i>template</i> checkbox.  This list will now be available to import tasks from.  To import a template into a list, just tap the 
                <i>import from template</i> menu item in the list page.  </li>
                <li><b>Deleting all completed items:</b> You can delete all of the completed items in a list by tapping the <i>delete all completed items</i>
                menu item in the list page.</li>
                <li><b>Email lists:</b> You can send a formatted copy of your lists to any email address, so you can get your data out of the application 
                at any time.</li>
                <li><b>Sync now:</b> TaskStore will automatically sync your items, but you can trigger an immediate sync anytime by tapping the <i>sync now</i>
                button in the main page.</li>
                <li><b>New Task from email:</b> If you send an email to <a href="mailto:new@taskstore.net">new@taskstore.net</a> from the mail account you 
                registered with, TaskStore will automatically create a new task for you, using the Subject line as the name of the task.  TaskStore will also 
                recognize the hashtag <i>#list:</i> and interpret everything after the colon as the name of the list you'd like to add the task to.  Finally, 
                TaskStore will look in the message body for anything that looks like a date, and email address, a website, or a phone number, and add those fields 
                to your task.</li>
                <li><b>Link to another list:</b> If you would like to set up a task (for example, today's shopping) that points to a list (for example, 
                your standard shopping list template), you can create that task and choose <i>link to another list</i> in the task fields to point to that list.  When 
                you tap the task, the <i>navigate</i> action will now be available, which will navigate to the list you linked to</li>
            </ul>
            <h2>Go forth and be productive</h2>
            <p>With that, have fun!</p>
            <p>Please send us any questions or feedback to <a href="mailto:support@taskstore.net">support@taskstore.net</a>.  Thanks!</p>
        </div>
    </div>
</body>
</html>