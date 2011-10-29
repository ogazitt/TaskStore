using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Reflection;

namespace TaskStoreClientEntities
{
    [DataContract(Namespace = "")]
    public class Priority : INotifyPropertyChanged
    {
        public Priority() { }

        public Priority(Priority priority)
        {
            Copy(priority);
        }

        public void Copy(Priority priority)
        {
            // copy all of the properties
            foreach (PropertyInfo pi in priority.GetType().GetProperties())
            {
                // get the value of the property
                var val = pi.GetValue(priority, null);
                pi.SetValue(this, val, null);
            }
        }

        private int priorityID;
        /// <summary>
        /// PriorityID property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public int PriorityID
        {
            get
            {
                return priorityID;
            }
            set
            {
                if (value != priorityID)
                {
                    priorityID = value;
                    NotifyPropertyChanged("PriorityID");
                }
            }
        }

        private string name;
        /// <summary>
        /// Name property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                if (value != name)
                {
                    name = value;
                    NotifyPropertyChanged("Name");
                }
            }
        }

        private string color;
        /// <summary>
        /// Color property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public string Color
        {
            get
            {
                return color;
            }
            set
            {
                if (value != color)
                {
                    color = value;
                    NotifyPropertyChanged("Color");
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged(String propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (null != handler)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}