using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace Web.OnlineShop.Entity
{
    [Table("Role")]
    public class Role
    {
        [StringLength(50)]
        public string Id { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public virtual ICollection<Permission> Permission { get; set; }
    }
}
