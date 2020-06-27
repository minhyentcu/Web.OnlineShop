namespace Web.OnlineShop.Entity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Add_field_MetaTitle_Table_Content : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Content", "MetaTitle", c => c.String(maxLength: 250));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Content", "MetaTitle");
        }
    }
}
