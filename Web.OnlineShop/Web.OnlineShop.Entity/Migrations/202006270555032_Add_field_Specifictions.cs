namespace Web.OnlineShop.Entity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Add_field_Specifictions : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Product", "Specifications", c => c.String(storeType: "ntext"));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Product", "Specifications");
        }
    }
}
