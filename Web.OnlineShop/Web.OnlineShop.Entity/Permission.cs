namespace Web.OnlineShop.Entity
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Permission")]
    [Serializable]
    public class Permission
    {
        [StringLength(20)]
        [Key, Column(Order = 0)]
        public string UserGroupId { get; set; }
        [StringLength(50)]
        [Key, Column(Order = 1)]
        public string RoleId { get; set; }

        public virtual UserGroup UserGroup { get; set; }
        public virtual Role Role { get; set; }
    }
}
