﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ToDoList.Models
{
    [Table("Items")]
    public class Item
    {
        public Item()
        {
            this.CategoryItems = new HashSet<CategoryItem>();
            this.ItemPriorities = new HashSet<ItemPriority>();
        }

        [Key]
        public int Id { get; set; }
        public string Description { get; set; }
        public virtual ICollection<CategoryItem> CategoryItems { get; set; }
        public virtual ICollection<ItemPriority> ItemPriorities { get; set; }
    }
}
