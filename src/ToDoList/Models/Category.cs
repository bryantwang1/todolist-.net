using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ToDoList.Models
{
    [Table("Categories")]
    public class Category
    {
        public Category()
        {
            this.CategoryItems = new HashSet<CategoryItem>();
        }

        [Key]
        public int Id { get; set; }
        public string Description { get; set; }
        public virtual ICollection<CategoryItem> CategoryItems { get; set; }
    }
}
