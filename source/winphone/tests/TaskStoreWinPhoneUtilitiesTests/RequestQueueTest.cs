using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TaskStoreWinPhoneUtilities;

namespace TaskStoreWinPhoneUtilitiesTests
{
    [TestClass]
    public class RequestQueueTest
    {
        [TestMethod]
        public void EnqueueDequeue()
        {
            // Arrange
            string testString = "test";
            RequestQueue.RequestRecord record = new RequestQueue.RequestRecord()
            {
                Body = testString
            };

            // Act
            RequestQueue.EnqueueRequestRecord(record);
            var rec = RequestQueue.DequeueRequestRecord();

            // Assert
            string result = (string) rec.Body;
            Assert.AreEqual(rec, testString);
        }
    }
}
