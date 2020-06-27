namespace Web.OnlineShop.Entity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Update_tale_contact : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Contact", "Phone", c => c.String(maxLength: 15));
            AddColumn("dbo.Contact", "PhoneSecond", c => c.String(maxLength: 15));
            AddColumn("dbo.Contact", "Email", c => c.String(maxLength: 50));
            AddColumn("dbo.Contact", "Address", c => c.String(maxLength: 500));
            DropColumn("dbo.Contact", "Content");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Contact", "Content", c => c.String(storeType: "ntext"));
            DropColumn("dbo.Contact", "Address");
            DropColumn("dbo.Contact", "Email");
            DropColumn("dbo.Contact", "PhoneSecond");
            DropColumn("dbo.Contact", "Phone");
        }
    }
}
