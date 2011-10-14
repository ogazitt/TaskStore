using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace SpeechTest
{
    public partial class SpeechTest : Form
    {
        DateTime start;
        DateTime end;
        
        public SpeechTest()
        {
            InitializeComponent();
            networkOperationInProgress.Text = "";
            lastNetworkOperationSuccessful.Text = "";
            urlTextBox.Text = TaskStoreClientEntities.WebServiceHelper.BaseUrl;
        }

        private void invokeButton_Click(object sender, EventArgs e)
        {
            resultTextBox.Text = "";

            TaskStoreClientEntities.User u = new TaskStoreClientEntities.User()
            {
                Name = "ogazitt",
                Password = "zrc022..",
            };

            if (filenameTextBox.Text == "")
            {
                MessageBox.Show("filename must not be empty");
                return;
            }

            FileStream fs = File.Open(filenameTextBox.Text, FileMode.Open);
            byte[] bytes = new byte[fs.Length];
            int len = fs.Read(bytes, 0, bytes.Length);
            fs.Close();

            if (urlTextBox.Text != "")
                TaskStoreClientEntities.WebServiceHelper.BaseUrl = urlTextBox.Text;

            start = DateTime.Now;
            TaskStoreClientEntities.WebServiceHelper.SpeechToText(u, bytes, new WebServiceCallbackDelegate(WebServiceCallback),
                new NetworkOperationInProgressCallbackDelegate(NetworkOperationInProgressCallback));
        }

        public delegate void NetworkOperationInProgressCallbackDelegate(bool operationInProgress, bool? operationSuccessful);
        public void NetworkOperationInProgressCallback(bool operationInProgress, bool? operationSuccessful)
        {
            Invoke(new MethodInvoker(() =>
            {
                // signal whether the net operation is in progress or not
                networkOperationInProgress.Text = operationInProgress.ToString();

                // if the operationSuccessful flag is null, no new data; otherwise, it signals the status of the last operation
                if (operationSuccessful != null)
                    lastNetworkOperationSuccessful.Text = ((bool)operationSuccessful).ToString();
            }));
        }

        public delegate void WebServiceCallbackDelegate(string str);
        private void WebServiceCallback(string str)
        {
            end = DateTime.Now;
            TimeSpan ts = end - start;

            Invoke(new MethodInvoker(() =>
            {
                if (str != null)
                    resultTextBox.Text = str;
                else
                    resultTextBox.Text = "not recognized";
                MessageBox.Show(String.Format("{0}.{1} seconds", ts.Seconds.ToString(), ts.Milliseconds.ToString()));
            }));
        }

        private void chooseFileButton_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            DialogResult result = dialog.ShowDialog();
            if (result == DialogResult.OK)
                filenameTextBox.Text = dialog.FileName;
        }
    }
}
