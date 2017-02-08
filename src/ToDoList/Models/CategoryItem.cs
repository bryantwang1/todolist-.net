using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ToDoList.Models
{
    [Table("CategoriesItems")]
    public class CategoryItem
    {
        [Key]
        public int Id { get; set; }

        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }

        public int ItemId { get; set; }
        public virtual Item Item { get; set; } 

    }
}
