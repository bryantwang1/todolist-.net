using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ToDoList.Models
{
    [Table("Priorities")]
    public class Priority
    {
        public Priority()
        {
            this.ItemPriorities = new HashSet<ItemPriority>();
        }
        [Key]
        public int Id { get; set; }
        public int Rating { get; set; }
        public virtual ICollection<ItemPriority> ItemPriorities { get; set; }

    }
}
