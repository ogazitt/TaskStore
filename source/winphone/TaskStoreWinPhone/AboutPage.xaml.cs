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
using Microsoft.Phone.Tasks;

namespace TaskStoreWinPhone
{
    public partial class AboutPage : PhoneApplicationPage
    {
        public AboutPage()
        {
            InitializeComponent();
            
            // Set the data context of the page to the main view model
            DataContext = App.ViewModel;
        }

        // Event handlers for About tab
        private void About_FeedbackButton_Click(object sender, EventArgs e)
        {
            EmailComposeTask emailComposeTask = new EmailComposeTask();
            emailComposeTask.To = App.ViewModel.About.FeedbackEmail;
            emailComposeTask.Subject = "TaskStore Feedback";
            emailComposeTask.Show();
        }

        private void About_ReviewButton_Click(object sender, EventArgs e)
        {
            MarketplaceReviewTask reviewTask = new MarketplaceReviewTask();
            reviewTask.Show();
        }


        private void FirstListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}