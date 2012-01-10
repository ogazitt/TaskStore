using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using NSpeex;
using TaskStoreClientEntities;

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
            urlTextBox.Text = WebServiceHelper.BaseUrl;
        }

        private void invokeButton_Click(object sender, EventArgs e)
        {
            resultTextBox.Text = "";

            User u = new User()
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
                WebServiceHelper.BaseUrl = urlTextBox.Text;

            if (checkBox1.CheckState == CheckState.Checked)
            {
                bytes = EncodeSpeech(bytes, len);
                WebServiceHelper.ContentType = "application/speex";
            }
            else
                WebServiceHelper.ContentType = "application/json";

            start = DateTime.Now;
            WebServiceHelper.SpeechToText(u, bytes, new WebServiceCallbackDelegate(WebServiceCallback),
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

        private byte[] EncodeSpeech(byte[] buf, int len)
        {
            SpeexEncoder encoder = new SpeexEncoder(BandMode.Wide);

            //// convert to short array
            //short[] data = new short[len / 2];
            //int sampleIndex = 0;
            //for (int index = 0; index < len; index += 2, sampleIndex++)
            //{
            //    data[sampleIndex] = BitConverter.ToInt16(buf, index);
            //}

            //var encodedData = new byte[len];
            //// note: the number of samples per frame must be a multiple of encoder.FrameSize
            //int encodedBytes = encoder.Encode(data, 0, sampleIndex, encodedData, 0, len);
            //if (encodedBytes != 0)
            //{
            //    byte[] sizeBuf = BitConverter.GetBytes(encodedBytes);
            //    byte[] returnBuf = new byte[encodedBytes + sizeBuf.Length];
            //    sizeBuf.CopyTo(returnBuf, 0);
            //    Array.Copy(encodedData, 0, returnBuf, sizeBuf.Length, encodedBytes);
            //    return returnBuf;
            //}
            //else
            //    return buf;

            int inDataSize = len / 2;
            // convert to short array
            short[] data = new short[inDataSize];
            int sampleIndex = 0;
            for (int index = 0; index < len; index += 2, sampleIndex++)
            {
                data[sampleIndex] = BitConverter.ToInt16(buf, index);
            }

            // note: the number of samples per frame must be a multiple of encoder.FrameSize
            inDataSize = inDataSize - inDataSize % encoder.FrameSize;

            var encodedData = new byte[len];
            int encodedBytes = encoder.Encode(data, 0, inDataSize, encodedData, 0, len);
            if (encodedBytes != 0)
            {
                // each chunk is laid out as follows:
                // | 4-byte total chunk size | 4-byte encoded buffer size | <encoded-bytes> |
                byte[] inDataSizeBuf = BitConverter.GetBytes(inDataSize);
                byte[] sizeBuf = BitConverter.GetBytes(encodedBytes + inDataSizeBuf.Length);
                byte[] returnBuf = new byte[encodedBytes + sizeBuf.Length + inDataSizeBuf.Length];
                sizeBuf.CopyTo(returnBuf, 0);
                inDataSizeBuf.CopyTo(returnBuf, sizeBuf.Length);
                Array.Copy(encodedData, 0, returnBuf, sizeBuf.Length + inDataSizeBuf.Length, encodedBytes);
                return returnBuf;
            }
            else
                return buf;
        }

    }
}
