using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace TaskStoreClientEntities
{
    public class Constants
    {
        private ObservableCollection<Action> actions;
        /// <summary>
        /// Actions collection property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public ObservableCollection<Action> Actions
        {
            get
            {
                return actions;
            }
            set
            {
                if (value != actions)
                {
                    actions = value;
                    NotifyPropertyChanged("Actions");
                }
            }
        }

        private ObservableCollection<Color> colors;
        /// <summary>
        /// Colors collection property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public ObservableCollection<Color> Colors
        {
            get
            {
                return colors;
            }
            set
            {
                if (value != colors)
                {
                    colors = value;
                    NotifyPropertyChanged("Colors");
                }
            }
        }

        private ObservableCollection<FieldType> fieldTypes;
        /// <summary>
        /// Field Types collection property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public ObservableCollection<FieldType> FieldTypes
        {
            get
            {
                return fieldTypes;
            }
            set
            {
                if (value != fieldTypes)
                {
                    fieldTypes = value;
                    NotifyPropertyChanged("FieldTypes");
                }
            }
        }

        private ObservableCollection<ListType> listTypes;
        /// <summary>
        /// List Types collection property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public ObservableCollection<ListType> ListTypes
        {
            get
            {
                return listTypes;
            }
            set
            {
                if (value != listTypes)
                {
                    listTypes = value;
                    NotifyPropertyChanged("ListTypes");
                }
            }
        }

        private ObservableCollection<Priority> priorities;
        /// <summary>
        /// Priorities collection property
        /// </summary>
        /// <returns></returns>
        [DataMember]
        public ObservableCollection<Priority> Priorities
        {
            get
            {
                return priorities;
            }
            set
            {
                if (value != priorities)
                {
                    priorities = value;
                    NotifyPropertyChanged("Priorities");
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void NotifyPropertyChanged(String propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (null != handler)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}