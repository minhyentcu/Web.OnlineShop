namespace Web.OnlineShop.Entity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Create_table_Role : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Permission",
                c => new
                    {
                        UserGroupId = c.String(nullable: false, maxLength: 20),
                        RoleId = c.String(nullable: false, maxLength: 50),
                        UserGourp_Id = c.String(maxLength: 20),
                    })
                .PrimaryKey(t => new { t.UserGroupId, t.RoleId })
                .ForeignKey("dbo.Role", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.UserGroup", t => t.UserGourp_Id)
                .Index(t => t.RoleId)
                .Index(t => t.UserGourp_Id);
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 50),
                        Name = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.UserGroup",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 20),
                        Name = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.User", "GroupId", c => c.String(maxLength: 20));
            AddColumn("dbo.User", "UserGourp_Id", c => c.String(maxLength: 20));
            CreateIndex("dbo.User", "UserGourp_Id");
            AddForeignKey("dbo.User", "UserGourp_Id", "dbo.UserGroup", "Id");
            DropColumn("dbo.User", "MetaKeywords");
            DropColumn("dbo.User", "MetaDescription");
        }
        
        public override void Down()
        {
            AddColumn("dbo.User", "MetaDescription", c => c.String(maxLength: 250));
            AddColumn("dbo.User", "MetaKeywords", c => c.String(maxLength: 250));
            DropForeignKey("dbo.User", "UserGourp_Id", "dbo.UserGroup");
            DropForeignKey("dbo.Permission", "UserGourp_Id", "dbo.UserGroup");
            DropForeignKey("dbo.Permission", "RoleId", "dbo.Role");
            DropIndex("dbo.User", new[] { "UserGourp_Id" });
            DropIndex("dbo.Permission", new[] { "UserGourp_Id" });
            DropIndex("dbo.Permission", new[] { "RoleId" });
            DropColumn("dbo.User", "UserGourp_Id");
            DropColumn("dbo.User", "GroupId");
            DropTable("dbo.UserGroup");
            DropTable("dbo.Role");
            DropTable("dbo.Permission");
        }
    }
}
