using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Web.OnlineShop.Entity
{
    [Table("UserGroup")]
    public class UserGourp
    {
        [StringLength(20)]
        public string Id { get; set; }
        [StringLength(50)]
        public string Name { get; set; }

        public virtual ICollection<User> Users { get; set; }

        public virtual ICollection<Permission> Permission { get; set; }
    }
}
