﻿#pragma checksum "C:\Users\Omri\Documents\Visual Studio 2010\Projects\TaskStore\TaskStoreWinPhone\MainPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "71B1BE284258E927CDEBB4FF27CF0747"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.237
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Microsoft.Phone.Controls;
using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Automation.Peers;
using System.Windows.Automation.Provider;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace TaskStoreWinPhone {
    
    
    public partial class MainPage : Microsoft.Phone.Controls.PhoneApplicationPage {
        
        internal System.Windows.Controls.Grid LayoutRoot;
        
        internal System.Windows.Controls.Image ConnectedIconImage;
        
        internal Microsoft.Phone.Controls.Pivot MainPivot;
        
        internal System.Windows.Controls.TextBlock SearchHeader;
        
        internal System.Windows.Controls.ListBox TasksListBox;
        
        internal System.Windows.Controls.ListBox ListsListBox;
        
        internal System.Windows.Controls.ListBox TagsListBox;
        
        internal System.Windows.Controls.Primitives.Popup SearchPopup;
        
        internal System.Windows.Controls.TextBox SearchTextBox;
        
        internal System.Windows.Controls.Button SearchPopup_SearchButton;
        
        internal System.Windows.Controls.Button SearchPopup_ClearButton;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Windows.Application.LoadComponent(this, new System.Uri("/TaskStoreWinPhone;component/MainPage.xaml", System.UriKind.Relative));
            this.LayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("LayoutRoot")));
            this.ConnectedIconImage = ((System.Windows.Controls.Image)(this.FindName("ConnectedIconImage")));
            this.MainPivot = ((Microsoft.Phone.Controls.Pivot)(this.FindName("MainPivot")));
            this.SearchHeader = ((System.Windows.Controls.TextBlock)(this.FindName("SearchHeader")));
            this.TasksListBox = ((System.Windows.Controls.ListBox)(this.FindName("TasksListBox")));
            this.ListsListBox = ((System.Windows.Controls.ListBox)(this.FindName("ListsListBox")));
            this.TagsListBox = ((System.Windows.Controls.ListBox)(this.FindName("TagsListBox")));
            this.SearchPopup = ((System.Windows.Controls.Primitives.Popup)(this.FindName("SearchPopup")));
            this.SearchTextBox = ((System.Windows.Controls.TextBox)(this.FindName("SearchTextBox")));
            this.SearchPopup_SearchButton = ((System.Windows.Controls.Button)(this.FindName("SearchPopup_SearchButton")));
            this.SearchPopup_ClearButton = ((System.Windows.Controls.Button)(this.FindName("SearchPopup_ClearButton")));
        }
    }
}
