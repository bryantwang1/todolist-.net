using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ToDoList.Models
{
    [Table("ItemsPriorities")]
    public class ItemPriority
    {
        [Key]
        public int Id { get; set; }

        public int ItemId { get; set; }
        public virtual Item Item { get; set; }

        public int PriorityId { get; set; }
        public virtual Priority Priority { get; set; } 

    }
}
