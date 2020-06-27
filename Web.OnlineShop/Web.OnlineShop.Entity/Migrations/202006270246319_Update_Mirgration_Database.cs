namespace Web.OnlineShop.Entity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Update_Mirgration_Database : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.About", "CategoryId");
            DropColumn("dbo.About", "MetaKeywords");
            DropColumn("dbo.About", "MetaDescription");
            DropColumn("dbo.About", "ViewCount");
            DropColumn("dbo.Category", "ParentId");
            DropColumn("dbo.Category", "SeoTitle");
            DropColumn("dbo.Category", "MetaKeywords");
            DropColumn("dbo.Content", "Warranty");
            DropColumn("dbo.Content", "TopHot");
            DropColumn("dbo.Product", "Price");
            DropColumn("dbo.Product", "Quantity");
            DropColumn("dbo.Product", "Warranty");
            DropColumn("dbo.Product", "TopHot");
            DropColumn("dbo.Product", "ViewCount");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Product", "ViewCount", c => c.Int());
            AddColumn("dbo.Product", "TopHot", c => c.DateTime());
            AddColumn("dbo.Product", "Warranty", c => c.Int());
            AddColumn("dbo.Product", "Quantity", c => c.Int());
            AddColumn("dbo.Product", "Price", c => c.Decimal(precision: 18, scale: 0));
            AddColumn("dbo.Content", "TopHot", c => c.DateTime());
            AddColumn("dbo.Content", "Warranty", c => c.Int());
            AddColumn("dbo.Category", "MetaKeywords", c => c.String(maxLength: 250));
            AddColumn("dbo.Category", "SeoTitle", c => c.String(maxLength: 250));
            AddColumn("dbo.Category", "ParentId", c => c.Long());
            AddColumn("dbo.About", "ViewCount", c => c.Int());
            AddColumn("dbo.About", "MetaDescription", c => c.String(maxLength: 250));
            AddColumn("dbo.About", "MetaKeywords", c => c.String(maxLength: 250));
            AddColumn("dbo.About", "CategoryId", c => c.Long());
        }
    }
}
