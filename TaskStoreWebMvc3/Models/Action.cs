using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaskStoreWeb.Models
{
    public class Action
    {
        public int ActionID { get; set; }
        public string FieldName { get; set; }
        public string DisplayName { get; set; }
        public string ActionType { get; set; }
        public int SortOrder { get; set; }
    }
}