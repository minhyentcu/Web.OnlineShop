USE [OnlineShopDbdDemo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[About]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifileBy] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifileBy] [varchar](50) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[PhoneSecond] [nvarchar](15) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_dbo.Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryId] [bigint] NOT NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifileBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[ViewCount] [int] NULL,
	[Tag] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.Content] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[Id] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_dbo.Footer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeId] [int] NULL,
 CONSTRAINT [PK_dbo.Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.MenuType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[UserGroupId] [nvarchar](20) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[ProductCategoryId] [bigint] NOT NULL,
	[Detail] [ntext] NULL,
	[Specifications] [ntext] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifileBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[ParentId] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifileBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_dbo.ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Descripstion] [nvarchar](250) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifileBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_dbo.Slide] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifileBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[GroupId] [nvarchar](20) NULL,
	[ResetCodePassword] [nvarchar](max) NULL,
	[UserGroup_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 6/30/2020 10:50:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.UserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202006291650106_Update-database', N'Web.OnlineShop.Entity.Migrations.Configuration', 0x1F8B0800000000000400ED5DDB6EDBC819BE2FD0772074D51659CB729A626BD8BB70EC646B74131B9177DB3B8312C732B114A925A9AC8DA24FD68B3E525FA1339C2139E7034F926C224060CD70BE39FDA739FCFFFCEF3FFF3DFBFE691D795F419A85497C3E991D1D4F3C102F93208C57E7936DFEF0CDB793EFBFFBFDEFCE3E04EB27EFE7F2BBB7E83B5832CECE278F79BE399D4EB3E52358FBD9D13A5CA649963CE447CB643DF583647A727CFCD7E96C3605106202B13CEFECCB36CEC335287EC09F9749BC049B7CEB479F92004419498739F302D5FBECAF41B6F197E07CF20FB038BA89A33006F3C76473F40102E5CF13EF220A7DD89839881E269E1FC749EEE7B0A9A73F65609EA749BC9A6F60821FDD3D6F00FCEEC18F3240BA705A7F6EDB9BE313D49B695DB0845A6EB33C593B02CEDE92E199F2C51B0DF2A41A3E3880787C50AF8B413C9F5C2C926D3EF1F89A4E2FA3147DA518E0A3A2D81B4F9AF9A6220C483FE8DF1BEF721BE5DB149CC7609BA77EF4C6BBDD2EA270F977F07C97FC02E2F3781B45743B614B611E9300936ED36403D2FCF90B7820ADBF0E26DE942D37E50B56C5A832B86BD771FE973F4FBCCFB0727F11818A0CA86198E7490A7E003148FD1C04B77E9E833446188010DA545B17FABFAC0DD21DE4A289F7C97FFA11C4ABFCF17C72F20EF2CDC7F00904650A69C14F7108990E16CAD32D30557205B2651A6E308128EB7A77DC455DD76B7F35448F723F8C34D5C03F3BA8660E27799B95D5BC4F9208F8B1A9D0650A10295CC1FFCA92E8EFBB706DAC8F147DFFAC9D2643C7C86F7D4D506E860F61B356E2B211E8BC9967D35AFA6865D2256CE92A499FDDC5525972944C7B21993E413EBE0BF368008911669BC87FBE4903905283F8F66464E7BED8593EDD76CAA89B496F24BFA138F8ED26FE5B5293BFAAE067FF6BB82A988D9FF824CE2197C19ABF80A8F8207B0C37D8DA3C2299F7B510FB9826EB2F495417ACF2EEEFFC7405A0F97597283E9827DB74D9588E62B4066214171CA5E85E48D19767DF95E46D9EAAD14E1C150B562C90ED7F4BD2207B4146CBD0FAF2E710FC76996C914670B090EEFC55F76247AD5B2BB5D956B796AA53A95B4BE5DB58B7FACB86BA15167C01BA15914E8FBAF5F63189753C387BD7014B1495CCC1328983BEABFAB0D6EBAA4E58FC22085290E98464377682854AB466A58F00040B7FF98B3B2F952547666A69A876427B2686EDA492BDE1A22ECCE0E626623393B45C0F762A1CECF93C4972B43BE3CCE545B943E7F116C6B1E3AAC83CCD832D8BAC69E31388B7EE94814A1D3A5DF42FFBEFC0939EE73BA0851FC3F897FDDDE4ADB6D97A1D834632197D2C10436316423F9BB111CA1F59697833CA7A7A6F41BA0EB3ACD827709DE0BAECEEA7F8A70CA43FA4C97623CEB5F47BB4786F42164C3D6AC16437638E1AB86C735B423155ABDC45410D90EEA0A08C7B9A94EA0D142E4B389BE0F3654713BA365513226D5895AB689D2C5F68A2F4A356472878205DF90D95DA3DA70D6FAF3662965E96A64A2AA4A9AB1D7FF0FB8B2AFE69447714B3B8125F55F40552603FE27AAF28B09120E469512B2D5D04B6FC8C1BE5DC5324CAB6AECE910A682ABB95684630CDB8E3D019A3FF736D344A6DB9C28AF56EFD2C43C77ABD5764E8CDAC935D71F3BE61370BE1D63BAD5643D67AABD56EB76A3C27EFAC998A1D084775D8D9AAC9B0480219C82FE1E71632A0E186658BB588957A93A95D89F66BB6DE4F9360BBCC9BDF85E50046A5B71797B986BB5D72EBA7B0DFC200F6B4C53A07C930DD1AF5C501DFAB7A0DB78389DC95AF9C48E6BD20DD6B1DA3F844584BA9BE6BB5A822608DB5CDA865CCA7B341FFA6FB782FB9998882335BD4A49386DD1C9E735C7B2837A137600995D3128BB57DB861301A082FCA40782117AF4DC681F696730B1B815F909A6C894636C23C0A8306876245B117601FF47CC560200FEBA6EBBC8E2C0B67F556306BD611B7BA5EA81BD5C2901757AD0551F69C05A1BF4AFDB5BB34AACBEE5E249186DC870D44135D762811151BCE524EBEED830B37B0A265B8F1238BBEEA91487C1B27B9178087300E69F9F33E8C7DA4956DAC5E1BF2BEC8B264191613C45EE4ADDD9DD8167E8803CFE4FB84E788F29D82ED85541C6E20DDC2369C4FFE24745C03CBDDA32C602BEB84C59D4D78BABF89AF400472E05D2C71289C4B3F5BFA81385B707C023605B20A409B99A11FC1366590F9C23817F98AD087A1F55C394B2301B5ABAA81CFB9021B1023E631CC874DD5F48A506C4255133764A6113A9B52E4A5A73AFE0A8C8A3A94F7616AE2C0B7A77A240C756B24A44ADFA7303141238A538CC80004A7E8BD4DCDF2FB9503D19AF4B28B6A8AF5375FEA79A64EEE06213DFDD5C401E94F37400310A16E1C6CAAD7DF0C1E8A1CA9835FDD84CB4E81591274D1B4AA6B5316447D7C7434E30D0CEB0EABB61A54ED34EE3B50D45E9E24D88F82F1E44340DF5FEBC3D09701D8D13057362D906C520FC097D83C2EFCE4E1922C256DA91768578BC2BE7A929D524136210BBF8C2C33786243D873909737B6501C43B81CAD4D724260242EA240AB6C713232219041D4C46942A9E2098918A5D56E01E12F951045A4020344E94C2DC3A85DB44D2085AFA61482787F1A00902F92AC387610B4285CCCBD0200BB4719406AE52583A195B80108B1A10C025BC586C295BC972150CAC0024685601E0986FDE5442E08623B4C0D9411A2D8489601908D6943F17AE7478641EF29714094B81278970A49427DA60A5BC2CB508B957CD50B5A5C08C2D862ED4E035113CB6B41B6B3160321784E88E3A05D595AAD2DA9C613EED20C816A49488130BCDE7A08E457F7C57130AF7AECD73D54676891A11916ED72A5D7B1A1EF54CA4745657CDB98DFDC4898074162705B8D6683DE2B8FF4C461B032C99D8C727A4E2BE9AB191B93192EE2351224E53E6865E8557967531CE79B249C4D1501C1CF3EF99B4D18AFA800E124C59BE3E8E097DFCCDD6366AF31C6749949426757ADAD6ACA93D45F012E17DFF3F918A6597EE5E7FEC247BBC097C15AF84C66D62AF457592363B98AD3582AB4F273F4372EA209E52D590E90F21F61EFD66855511C1A5073AF28E7A128ED7EE4A79233D4CB24DAAE63F5EA465D1A1F3BD2E5718A3D0273DE4F033119F678E49C96E9124E726913BEB5C33607A7D9A394476A344A99668FC29CE9D1504C86331E3A8D94A0BD172C451D167B2C4AC3B139AE88F8B054C4C3E922DAD994630A61312CB09FB0B9C032B315AB53E2B53DBBAB148A05C7AB8BEE2BD353578A9859AE931D9895B932C1B02C9333B25C972CA79B59A54817328716A6F4357206894ADF1FF152AE273B102E64BBAA816C5195DC57D1B28FF604BD51CB4800CD06AEAE87A37562837508A2B2BEC4CBCBC93A67376AB52F414E053BA611A9647BAC2204328D5224EC95002F36FFBB11E0E8B0A099009796EC47801317781A8024396294C17F05A432C31E8F38CCD34824C91EA30A2140A354897D89DD1D116E7DE4D49E72AB232A77D25517DD57E3A30BEADF276AED5ABD7764749487AF4C8BE427B205CA8EB8889CB976C043F88CB60107290AF6C33FAEF372D032121F88B79FDBE200DD7D66E5C5FA99571CA896B1B38A147B041C869646C029BBDCE5298F4D58FB51168A4B87D28D444344C2CF5199B657148F6F717443F5C5AD8F66942F2FBA6BAB6047F3421F08B79F19F5D1B7C5DCE80AABC697B95E4A0FB3F6DEA91AAFBC384D43A92E53EF6CCEF02D89F6B355DC59729F2779B157CA3FD48D82F613A2BC2861312B9AB2AF786ABA9A95861332D45CD4A11D7919E8BC08ADE2B631EBD02A75C80571570BD17D59588FFBDDCDF7BBBB3195A5A6421333410C73C8580C62F6DE4845F1765707669FFE5A9B8DED6742D8B50E1BE2D4A40EEEC7CADE3275970BDE3A1420C38155EA28050FF7D46FBC72D1A564ED50A03617A4C3EDDA063C1727A2BB860EA1BD08DEC74B1B74D03996EDEB7407C520BAEC311AC2ECD1A71BBD4E2E847031E41866E5F2C66B26AF5DE1ECCB35931D290AE2EBD65E4D60DF387725A128D78F8AE8E44E7DE7F66C676A2753EA9DCC55F1BC26C1B2DBCB013B627CDA4BB53DF7535EADEE2240575835C67458327A9CD5A1CE7468B1C081B12307B2C1C3682436C71EB10A2246835589F63874603166A4A8F4E1A992F5DA1337CB69574E9B4D71FA7B9BDD6FE48E28D9B8165D36C591B1D24B358E3CA80555BD73CB9401361A6B4C6D7B2E933828E8C4BBCE5020BC2AE89C6D7F791F4D912004574DFE938A1C494AF5BB72D5246E928CFF663124C81BB3188A8CB86CF27E93F8938907FBFF15DA222914D6CF590ED647E883A3F9AFD1651416177FCA0F3EF971F800B21C07659C9C1CCF4E26DE4514FA1976B1251EA1A77CF0102B17D1D95BE4220A82F5942FEEEE688A50B22C6062468A512E257E964344BA5D84AB108DAA3156648BC7F6E2AF7EBA7CF45331886B0DDA3012BD14BA8845EF06CD84E3EDAEBD74B47612CBC60D828DA3BA089D0124315C03F8775EC4706D0455079E958FBD2BAC2C186ED3268AC1719BB4D13A32AD2290D6C8B6AAF57DC7FC25896E5D8CCAC8227DB3887C966D057483B96E2D08C5277F8C20F67240E6D5388A81C3D6DEE29B2DE5680BE1E8AEE3003C9D4FFE55943CF5AEFF795F177EE315F2E9D43BF6FEDDF2BD97D18290C31E8A78E49F58D97B05DBB34CA79C341B2BEFC245B38D347112F282E7E31042BE1709CFBC2D2C1DB9D93BD7B960FC293B4566DE2856CCB32B26F78A7357BAC851DE5A939FDC7BF160E9CF6861B84FA899A4DD317747783B54D3ED4D86D2496F10C12CF34A1C822FCCF366F7CA0E3758031879D6432BBA051EACC0C13E869DB21C763ADCCB3D0D36967A47FD6D2D174A1F44CB6E3991A9E8C377B0A4DA5A37DABF03AC7A8EC36AE8F42F3988DFCBDDE6CCC3CDD4C30F8BC5629C2ACFAEC669567517DC65771AB408175536C6A845AC2758F4CC1B822B2C8876CF1841F51AC8AE06AB01390E3B582F67AFB3F689EB72BFA7F6F3E912D538C733F705ABCD72A48121C3ACC67A588CEDDDAAE9156F6E6A0D432B2654AA77A54CB46997C4EB8EC5FFC3DA7FFAA32B2A7BC9A68D3D726F6D90B4B1F1B48F3E1DB0E03EA8B3EADA678F1D949DAC0E6B27BD8E8FCC46697A004745AFF594FE56E60877C802103BD60D6A5FBE82737FDA210F233FAD2367712F3AE039DF211030767E958073DB1B6F258CAA468FBDFFB712ACB587C443EE603798FBB9EDDC8D6DEAAA822C851FED7FD731F82B961FBB3B74B6E65B955B9B1DF3AA1DD9CC4C4C97ED919963E39EE0C9B7CEA0ACBB9C9499AD702A4FB9C6F2807690AB487711C67EFA6CB17BA32213F18D6CFDEB9DF4939BE507A439DC23C083BC45CFDD1960DF10EEE5D1794D24271B95E7B93C69AD7E5E46AC6AE047AB45BAD1BE76CA3D53CACC174E18845CA8E6D12DA0937B211A4538D1CE094635FC8ADA54E15B07A117F3ABB0B2475C9979A3525F34F9E8829FEE9A86F4771F862224D543BACD49E8F8E86826CC1E8B2600BD84E9578474D54CBCC2A57C8099BFB5793B587CE9576AB80879C34894F20D78B1253D119376ACFA2129E97EB3A22AC97EE100A4C5B9FB53DBCAEC93C6FC3492980EE50582C273DDAB0D6D32A1241D3BF643437E91C0F9C6863AC912C40C0B5C13A5805D67C9E0EB5C530DA5CD2C5650E648F1E58F9048E191CB881CBEC851C1179906F8CA2540C4AFB36415D4B9A61AF0D56A093EC990A2933C037671B75844C6C9325C9C63815A5C059523E32C153ACE35D4409B3D421D74A6AC163ADF500F5E1F0835E0641936CE31A0528A5F80A683B748F0A96C8B4A14F86A68F3C0F3AA4A1C7DFE0BE914F01FD955ABAE4E5B8D111EEF2B8BE0245D064DB20CC0D4C697884E67CAAAA0E352F115B1616454DB271EF5192B53155B2C8A4D162A82906ACAE45B23744185BCE622E25874935FED4B7AA9DD10906C0950ED9471B072254695D34815F72E4A17A8927E9A17B2AA750817144A2A5376D26D3A7C95BCC3AA0557675DA545671D36AB7DF7546B06493FAD9617FA05063D497A712B5F1688E51D8640086355E59D4DB1AC2309F0A710AE0A5AD3DB189D5FE05F57200B5735048AC2158325634757DF5CC70F4969D9732D2A3F919C6406D0C8BE48F3F0015A7C307B092041C7AB89F7B31F6D01BAF3BA00C1757CB3CD37DB1C7619AC171133886859A0ABFF6C2AB4F9ECA63838CDBAE8026C66888E7C6EE2F7DB300AAA767F94382D2820D07A839C87A0B9CCD1B9C8EAB942FA2CBCCBA10222C3572D93EEC07A1341B0EC269EFB5F4193B641EEFB11ACFCE5F32D893AA606314F043BEC675744C1128CBA3CFC096938583F7DF77F1CF8317AACE30000, N'6.4.4')
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([Id], [Name], [Description], [Image], [Detail], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy]) VALUES (1, N'Giới thiệu trang web', N'Giới thiệu trang web', N'~/Upload/Content/banner.png', N'&lt;p&gt;&lt;strong&gt;Trong cuộc sống x&amp;atilde; hội ng&amp;agrave;y c&amp;agrave;ng hiện đại, sự ra đời của nhiều vật liệu cửa hiện đại đ&amp;atilde; l&amp;agrave;m thay đổi diện mạo mới cho h&amp;agrave;ng loạt c&amp;aacute;c c&amp;ocirc;ng tr&amp;igrave;nh kiến tr&amp;uacute;c, ng&amp;ocirc;i nh&amp;agrave;, c&amp;aacute;c x&amp;iacute; nghiệp&amp;hellip; ch&amp;uacute;ng gi&amp;uacute;p n&amp;acirc;ng tầm mọi kh&amp;ocirc;ng gian cho chủ sở hữu. C&amp;aacute;c loại&amp;nbsp;cửa khung nh&amp;ocirc;m k&amp;iacute;nh xingfa, cửa nhựa l&amp;otilde;i th&amp;eacute;p uPVC windows&amp;nbsp;hiện nay được thiết kế theo ti&amp;ecirc;u chuẩn hiện đại v&amp;agrave; c&amp;oacute; t&amp;iacute;nh thẩm mỹ rất cao đặc biệt l&amp;agrave; khả năng c&amp;aacute;ch &amp;acirc;m, chống ồn rất tốt. Những d&amp;ograve;ng sản phẩm&amp;nbsp;cửa nh&amp;ocirc;m hệ xingfa cao cấp, cửa nhựa l&amp;otilde;i th&amp;eacute;p uPVC windows&amp;nbsp;đang ng&amp;agrave;y c&amp;agrave;ng sử dụng th&amp;ocirc;ng dụng trong đời sống hiện đại ng&amp;agrave;y nay đặc biệt l&amp;agrave; c&amp;aacute;c chung cư cao tầng đều bắt buộc sử dụng cửa nh&amp;ocirc;m k&amp;iacute;nh, cửa nhựa window l&amp;agrave;m cửa sổ, hay c&amp;aacute;c cửa đi ban c&amp;ocirc;ng để bảo đảm độ an to&amp;agrave;n cũng như độ bền cửa sản phẩm.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Nhằm đ&amp;aacute;p ứng nhu cầu thị trường,&amp;nbsp;cơ sở sản xuất cửa nh&amp;ocirc;m k&amp;iacute;nh &amp;ndash; cửa nhựa &amp;ndash; cửa sắt Minh Ho&amp;agrave;ng DL&amp;nbsp;đ&amp;atilde; mạnh dạn đầu tư c&amp;ocirc;ng nghệ m&amp;aacute;y m&amp;oacute;c hiện đại, d&amp;acirc;y chuyển sản xuất tối t&amp;acirc;n nhất hiện n&amp;agrave;y để đưa v&amp;agrave;o sản xuất c&amp;aacute;c sản phẩm&amp;nbsp;cửa nh&amp;ocirc;m k&amp;iacute;nh &amp;ndash; cửa nhựa &amp;ndash; cửa sắt&amp;nbsp;phục vụ qu&amp;yacute; kh&amp;aacute;ch h&amp;agrave;ng.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sở hữu đội ngũ nh&amp;acirc;n vi&amp;ecirc;n c&amp;oacute; kinh nghiệm, tay nghề cao, hết m&amp;igrave;nh trong c&amp;ocirc;ng việc,&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;cung cấp dịch vụ trong to&amp;agrave;n tỉnh L&amp;acirc;m Đồng v&amp;agrave; đem lại sự h&amp;agrave;i l&amp;ograve;ng hết tuyệt đối cho kh&amp;aacute;ch h&amp;agrave;ng.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với phương ch&amp;acirc;m &amp;quot;CHẤT LƯỢNG TẠO N&amp;Ecirc;N SỰ UY T&amp;Iacute;N&amp;quot;&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;xin cam kết l&amp;agrave;m đ&amp;uacute;ng l&amp;agrave;m đủ, lu&amp;ocirc;n đặt lợi &amp;iacute;ch của kh&amp;aacute;ch h&amp;agrave;ng l&amp;ecirc;n h&amp;agrave;ng đầu.ok&lt;/strong&gt;&lt;/p&gt;
', 1, CAST(N'2020-06-26 15:21:40.203' AS DateTime), NULL, CAST(N'2020-06-30 18:22:11.770' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [MetaTitle], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaDescription], [Status], [ShowOnHome]) VALUES (1, N'Công trình', N'cong-trinh', 1, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [MetaTitle], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaDescription], [Status], [ShowOnHome]) VALUES (2, N'Báo giá', N'bao-gia', 2, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [MetaTitle], [DisplayOrder], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaDescription], [Status], [ShowOnHome]) VALUES (3, N'Tuyển dụng', N'tuyen-dung', 3, NULL, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Phone], [PhoneSecond], [Email], [Address], [Status]) VALUES (1, N'0922912138', N'0329386783', N'phamminhyen997@gmail.com', N'Lô G26, Trần Anh Tông, KQH Nguyên tử Lực, Phường 8, TP.Đà Lạt, Lâm Đồng', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([Id], [Name], [Description], [Image], [CategoryId], [Detail], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription], [ViewCount], [Tag]) VALUES (1, N'Công trình dân dụng Mai Hắc Đế, Phường 6, Đà Lạt, Lâm Đồng.', N'-Minh Hoàng DL ký nhận công trình nhà dân ở Mai Hắc Đế, phường 6, Đà Lạt, Lâm Đồng.', N'~/Upload/Content/congtrinh_1.jpg', 1, N'-Minh Hoàng DL ký nhận công trình nhà dân ở Mai Hắc Đế, phường 6, Đà Lạt, Lâm Đồng. -Khách hàng chọn sử dụng: + Cửa nhựa lõi thép + Cửa nhôm PMA -Chiết khấu cho Khách hàng thi công số lượng lớn. Liên hệ thi công Để có giá tốt nhất quý khách vui lòng liên hệ Minh Hoàng DL tại Lô G26 - Trần Anh Tông - KQH Nguyên Tử Lực - Phường 8 - Đà Lạt - Lâm Đồng Hoặc Hotline: 0931.222.775 - 0986.909.997 để được hỗ trợ tư vấn và nhận báo giá chi tiết.  Cảm ơn quý khách!', 1, NULL, NULL, NULL, NULL, NULL, N'cong-trinh-dan-dung-mai-hac-de-phuong-6-da-lat-lam-dong', NULL, NULL, NULL)
INSERT [dbo].[Content] ([Id], [Name], [Description], [Image], [CategoryId], [Detail], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription], [ViewCount], [Tag]) VALUES (2, N'Báo giá cửa nhôm Xingfa và phụ kiện đi kèm', N'Báo giá cửa nhôm Xingfa và phụ kiện đi kèm', N'~/Upload/Content/baogia_1.jpg', 2, N'-Công ty chúng tôi xin chân thành cảm ơn sự hợp tác của quý khách hàng đã quan tâm và sử dụng sản phẩm của chúng tôi.Thay mặt Cty MINH HOÀNG DL xin được gửi tới quý khách hàng lời chúc sức khỏe và thành công trong mọi lĩnh vực. Cty kính gởi đến quý khách hàng báo giá chi tiết sản phẩm như sau :  -GÍA 1 BỘ CỬA NHÔM XINGFA = DIỆN TÍCH CỬA(m2) x ĐƠN GIÁ + BỘ PHỤ KIỆN', 1, NULL, NULL, NULL, NULL, NULL, N'bao-gia-cua-nhom-xingfa-va-phu-kien-di-kem', NULL, NULL, NULL)
INSERT [dbo].[Content] ([Id], [Name], [Description], [Image], [CategoryId], [Detail], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription], [ViewCount], [Tag]) VALUES (4, N'Công trình dân dụng Tô Hiến Thành, Phường 3, Đà Lạt, Lâm Đồng', N'Công trình dân dụng Tô Hiến Thành, Phường 3, Đà Lạt, Lâm Đồng', N'~/Upload/Content/27072112congtrinh2.jpg', 1, N'&lt;p&gt;-C&amp;ocirc;ng tr&amp;igrave;nh d&amp;acirc;n dụng T&amp;ocirc; Hiến Th&amp;agrave;nh, Phường 3, Đ&amp;agrave; Lạt, L&amp;acirc;m Đồng.&lt;/p&gt;

&lt;p&gt;-Kh&amp;aacute;ch h&amp;agrave;ng sử dụng Cửa nhựa l&amp;otilde;i th&amp;eacute;p.&lt;/p&gt;

&lt;h2&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/h2&gt;

&lt;p&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;&lt;strong&gt;Minh Ho&amp;agrave;ng DL&lt;/strong&gt;&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;&lt;strong&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/strong&gt;&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;a href="tel:0931222775"&gt;&lt;strong&gt;0931.222.775&lt;/strong&gt;&lt;/a&gt;&lt;strong&gt;&amp;nbsp;-&amp;nbsp;&lt;/strong&gt;&lt;a href="tel:0986909997"&gt;&lt;strong&gt;0986.909.997&lt;/strong&gt;&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/p&gt;

&lt;p&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/p&gt;
', 1, CAST(N'2020-06-27 19:21:12.857' AS DateTime), NULL, NULL, NULL, NULL, N'cong-trinh-dan-dung-to-hien-thanh-phuong-3-da-lat-lam-dong', NULL, NULL, NULL)
INSERT [dbo].[Content] ([Id], [Name], [Description], [Image], [CategoryId], [Detail], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription], [ViewCount], [Tag]) VALUES (5, N'Tuyển dụng Thợ Chính lặp đặt cửa nhựa lõi thép, cửa nhôm.', N'Tuyển dụng Thợ Chính lặp đặt cửa nhựa lõi thép, cửa nhôm.', N'~/Upload/Content/30061242tuyendung_1.jpg', 3, N'&lt;p&gt;&lt;strong&gt;V&amp;igrave; số lượng c&amp;ocirc;ng việc nhiều, Minh Ho&amp;agrave;ng DL cần&amp;nbsp;tuyển dụng nh&amp;acirc;n vi&amp;ecirc;n thường xuy&amp;ecirc;n với c&amp;aacute;c y&amp;ecirc;u cầu như sau:&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;

&lt;h2&gt;&lt;strong&gt;M&amp;ocirc; tả c&amp;ocirc;ng việc:&lt;/strong&gt;&lt;/h2&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;Sản xuất- lắp đặt cửa nhựa l&amp;otilde;i th&amp;eacute;p uPVC, Cửa nh&amp;ocirc;m định h&amp;igrave;nh (XINGFA, PMA,...), K&amp;iacute;nh cường lực.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Sản xuất tại cơ sở TP. Đ&amp;agrave; Lạt, lắp đặt tại TP. Đ&amp;agrave; Lạt v&amp;agrave; c&amp;aacute;c huyện, thị x&amp;atilde;, thị trấn l&amp;acirc;n cận thuộc tỉnh L&amp;acirc;m Đồng.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Vị tr&amp;iacute;: thợ ch&amp;iacute;nh.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;hr /&gt;
&lt;h2&gt;&lt;strong&gt;Y&amp;ecirc;u cầu c&amp;ocirc;ng việc&lt;/strong&gt;&lt;/h2&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;C&amp;oacute; tay nghề, kinh nghiệm sản xuất v&amp;agrave; lắp đặt cửa nhựa l&amp;otilde;i th&amp;eacute;p uPVC, nh&amp;ocirc;m định h&amp;igrave;nh, k&amp;iacute;nh cường lực.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Trung thực, cần c&amp;ugrave;, nhanh nhẹn v&amp;agrave; c&amp;oacute; tr&amp;aacute;ch nhiệm, tự gi&amp;aacute;c trong c&amp;ocirc;ng việc.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Lương thỏa thuận.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;hr /&gt;
&lt;h2&gt;&lt;strong&gt;Li&amp;ecirc;n hệ c&amp;ocirc;ng việc&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;Để trao đổi chi tiết về vị tr&amp;iacute; l&amp;agrave;m việc, thời gian, lương thỏa thuận&amp;nbsp;vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;Mr. Minh&amp;nbsp;để trao đổi trực tiếp v&amp;agrave; sắp xếp thời gian phỏng vấn&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn c&amp;aacute;c bạn!&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;
', 1, CAST(N'2020-06-30 18:12:42.633' AS DateTime), NULL, CAST(N'2020-06-30 18:13:07.060' AS DateTime), NULL, NULL, N'tuyen-dung-tho-chinh-lap-dat-cua-nhua-loi-thep-cua-nhom', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [CreatedDate], [Status], [Content]) VALUES (1, N'Pham Minh Yen', N'0922912138', N'phamminhyen97@gmail.com', NULL, CAST(N'2020-06-30 13:20:03.867' AS DateTime), NULL, N'1233test')
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [CreatedDate], [Status], [Content]) VALUES (2, N'Pham Minh Yen', N'0922912138', N'phamminhyen97@gmail.com', NULL, CAST(N'2020-06-30 14:54:27.630' AS DateTime), 1, N'"Mình chỉ lắp cửa cho 2 phòng trong nhà, các nơi khác từ chối không làm vì công trình quá nhỏ. Ngược lại, đến với Minhhoangdl, các bạn tư vấn cực kỳ nhiệt tình, thi công đúng tiến độ. Cửa đẹp, chắc chắn. Rất hài lòng!"')
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [CreatedDate], [Status], [Content]) VALUES (3, N'Nguyễn Văn An', N'0922912138', N'phamminhyen97@gmail.com', NULL, CAST(N'2020-06-30 14:55:33.370' AS DateTime), 1, N'"Cực kỳ thích đội ngũ thi công của bên này, làm rất nhanh chóng và đúng hẹn dù không có chủ nhà trực tiếp giám sát. Sau khi thi công còn giúp mình dọn dẹp gọn gàng. Cảm ơn MinhHoangdl"')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[Footer] ([Id], [Content], [Status]) VALUES (N'1', N'   <div class="wrap">
            <div class="section group">
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Information</h4>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="contact.html">Customer Service</a></li>
                        <li><a href="#">Advanced Search</a></li>
                        <li><a href="delivery.html">Orders and Returns</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Why buy from us</h4>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="contact.html">Customer Service</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="contact.html">Site Map</a></li>
                        <li><a href="#">Search Terms</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>My account</h4>
                    <ul>
                        <li><a href="contact.html">Sign In</a></li>
                        <li><a href="index.html">View Cart</a></li>
                        <li><a href="#">My Wishlist</a></li>
                        <li><a href="#">Track My Order</a></li>
                        <li><a href="contact.html">Help</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Contact</h4>
                    <ul>
                        <li><span>+91-123-456789</span></li>
                        <li><span>+00-123-000000</span></li>
                    </ul>
                    <div class="social-icons">
                        <h4>Follow Us</h4>
                        <ul>
                            <li><a href="#" target="_blank"><img src="/Assets/Client/images/facebook.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="/Assets/Client/images/twitter.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="/Assets/Client/images/skype.png" alt="" /> </a></li>
                            <li><a href="#" target="_blank"> <img src="/Assets/Client/images/dribbble.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"> <img src="/Assets/Client/images/linkedin.png" alt="" /></a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy_right">
            <p>&copy; 2013 home_shoppe. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
        </div>', 1)
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeId]) VALUES (1, N'Trang chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([Id], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeId]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([Id], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeId]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([Id], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeId]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([Id], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeId]) VALUES (6, N'Đăng nhập', N'/dang-nhap', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([Id], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeId]) VALUES (7, N'Đăng ký', N'/dang-ky', 2, N'_sefl', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([Id], [Name]) VALUES (1, N'MenuMain')
INSERT [dbo].[MenuType] ([Id], [Name]) VALUES (2, N'MenuTop')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
INSERT [dbo].[Permission] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'ALL_ROLE')
INSERT [dbo].[Permission] ([UserGroupId], [RoleId]) VALUES (N'MOD', N'EDIT_ROLE')
INSERT [dbo].[Permission] ([UserGroupId], [RoleId]) VALUES (N'MOD', N'INSERT_ROLE')
INSERT [dbo].[Permission] ([UserGroupId], [RoleId]) VALUES (N'MOD', N'VIEW_ROLE')
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (17, NULL, N'Cửa lưới chống muỗi', N'Cửa lưới chống muỗi', N'~/Upload/Product/27014231cualuoichongmuoi_1.jpg', N'<Images><Image>~/Upload/Product/27014231cualuoichongmuoi_1.jpg</Image><Image>~/Upload/Product/27014231cualuoichongmuoi_2.jpg</Image></Images>', 11, N'&lt;p&gt;&lt;a href="https://webnoithat.net/bao-gia-cua-luoi-chong-muoi-cua-luoi-chong-con-trung-gia-re"&gt;Cửa lưới chống muỗi&lt;/a&gt;&amp;nbsp;l&amp;agrave; cửa c&amp;oacute; chức năng ngăn ngừa muỗi&amp;nbsp;v&amp;agrave;&amp;nbsp;c&amp;ocirc;n tr&amp;ugrave;ng đi&amp;nbsp;v&amp;agrave;o trong nh&amp;agrave; gi&amp;uacute;p kh&amp;ocirc;ng gian trong nh&amp;agrave; lu&amp;ocirc;n sạch sẽ, tuyệt đối an to&amp;agrave;n, đảm bảo vệ sinh, gi&amp;uacute;p người lớn v&amp;agrave; đặc biệt trẻ em kh&amp;ocirc;ng bị muỗi&amp;nbsp;đốt hoặc c&amp;ocirc;n tr&amp;ugrave;ng cắn hay&amp;nbsp;đe dọa, gi&amp;uacute;p đảm bảo sức khỏe cũng như tiếng cười trẻ thơ v&amp;agrave; cuộc sống hạnh ph&amp;uacute;c trong mỗi gia đ&amp;igrave;nh&lt;/p&gt;
', N'&lt;p&gt;&lt;strong&gt;M&amp;agrave;u trắng&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;_Cửa dưới 1m2&amp;nbsp;sẽ được t&amp;iacute;nh l&amp;agrave; 1 m2&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;-Bảo h&amp;agrave;nh 36 th&amp;aacute;ng&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;*Ghi ch&amp;uacute; :&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;-Phụ thu th&amp;ecirc;m nếu sơn m&amp;agrave;u kh&amp;aacute;c&lt;/strong&gt;&lt;/p&gt;
', 1, CAST(N'2020-06-27 13:42:31.237' AS DateTime), NULL, NULL, NULL, NULL, N'cua-luoi-chong-muoi', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (18, NULL, N'CỬA ĐI MỞ QUAY', N'Sản phẩm cửa uPVC (hay còn gọi là cửa nhựa lõi thép gia cường) tuy mới ra đời ở các nước châu Âu khoảng 60 năm trước đây nhưng đã chiếm hơn 60% thị phần cửa ở những quốc gia này. Hiện nay, sản phẩm cửa uPVC đã được sử dụng rộng rãi ở nhiều nước trên thế giới. Tại Việt Nam hiện nay, cửa nhựa uPVC đang trở nên thông dụng và được nhiều khách hàng quan tâm tìm hiểu và sử dụng.', N'~/Upload/Product/27014759cuadiquaymo_1.jpg', N'<Images><Image>~/Upload/Product/27014759cuadiquaymo_1.jpg</Image><Image>~/Upload/Product/27014759cuadiquaymo_2.jpg</Image><Image>~/Upload/Product/27014759cuadiquaymo_3.jpg</Image></Images>', 12, N'&lt;h2&gt;&lt;strong&gt;Ưu điểm của cửa nhựa UPVC.&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;1. C&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt tốt:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Căn ph&amp;ograve;ng nằm s&amp;aacute;t trục đường giao th&amp;ocirc;ng, nơi c&amp;oacute; cường độ tiếng ồn b&amp;ecirc;n ngo&amp;agrave;i l&amp;ecirc;n đến 85 dB, song nhờ cửa nhựa uPVC c&amp;oacute; độ c&amp;aacute;ch &amp;acirc;m tốt n&amp;ecirc;n cường độ tiếng ồn trong ph&amp;ograve;ng chỉ c&amp;ograve;n khoảng 40 - 45 dB.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đi k&amp;egrave;m với khả năng c&amp;aacute;ch &amp;acirc;m gi&amp;uacute;p n&amp;acirc;ng cao chất lượng cuộc sống, cửa nhựa uPVC c&amp;ograve;n c&amp;oacute; khả năng c&amp;aacute;ch nhiệt gấp từ 2 - 4 lần so với c&amp;aacute;c loại cửa th&amp;ocirc;ng thường, gi&amp;uacute;p tiết kiệm điện năng sưởi ấm v&amp;agrave; l&amp;agrave;m m&amp;aacute;t căn ph&amp;ograve;ng, mang lại hiệu quả kinh tế cao cho người sử dụng.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;2. T&amp;iacute;nh ổn định cao, kh&amp;ocirc;ng cong v&amp;ecirc;nh, co ng&amp;oacute;t:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Lu&amp;ocirc;n bền bỉ trước kh&amp;iacute; hậu nhiệt đới n&amp;oacute;ng, ẩm, mưa nhiều&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đặc t&amp;iacute;nh qu&amp;yacute; b&amp;aacute;u nổi bật của vật liệu uPVC l&amp;agrave; tuổi thọ rất cao do vật liệu n&amp;agrave;y kh&amp;ocirc;ng bị &amp;ocirc;xy h&amp;oacute;a, kh&amp;ocirc;ng bị l&amp;atilde;o h&amp;oacute;a hay ố v&amp;agrave;ng trong điều kiện bức xạ mặt trời v&amp;agrave; mưa axit.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Việc sử dụng c&amp;aacute;c chất phụ gia (Additives) v&amp;agrave; chất ổn định (Stabilizers) trong c&amp;ocirc;ng thức phối liệu đ&amp;atilde; tạo ra sự th&amp;iacute;ch ứng của vật liệu trong điều kiện nhiệt độ v&amp;agrave; độ ẩm cao.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;3. Chống ch&amp;aacute;y:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với nhiệt độ gần 100oC của đ&amp;egrave;n kh&amp;ograve;, thanh uPVC chỉ biến dạng m&amp;agrave; kh&amp;ocirc;ng b&amp;eacute;n ch&amp;aacute;y, loại bỏ hẳn qu&amp;aacute; tr&amp;igrave;nh ngọn lửa ph&amp;aacute;t t&amp;aacute;n qua cửa.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;4. Hiệu quả kinh tế cao trong qu&amp;aacute; tr&amp;igrave;nh sử dụng:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cửa nhựa uPVC c&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt, kh&amp;ocirc;ng đ&amp;ograve;i hỏi tu bổ định kỳ, duy tr&amp;igrave; chất lượng sử dụng cao trong thời gian h&amp;agrave;ng chục năm&amp;hellip; Hơn thế nữa, cửa uPVC gi&amp;uacute;p hạn chế sự truyền nhiệt, điều đ&amp;oacute; đồng nghĩa với việc tiết kiệm điện năng để l&amp;agrave;m m&amp;aacute;t hoặc sưởi ấm căn ph&amp;ograve;ng. Chỉ sau v&amp;agrave;i năm sử dụng, cửa sổ từ uPVC sẽ b&amp;ugrave; đắp lại to&amp;agrave;n bộ chi ph&amp;iacute; đầu tư ban đầu.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;So với một số loại cửa th&amp;ocirc;ng thường, chi ph&amp;iacute; đầu tư ban đầu cho cửa uPVC cao hơn, song theo thời gian, hiệu quả kinh tế nhờ tiết kiệm chi ph&amp;iacute; ph&amp;aacute;t sinh trong qu&amp;aacute; tr&amp;igrave;nh sử dụng m&amp;agrave; cửa uPVC đem lại sẽ ng&amp;agrave;y c&amp;agrave;ng được thể hiện r&amp;otilde; rệt hơn.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Những ưu điểm ri&amp;ecirc;ng kh&amp;aacute;c như t&amp;iacute;nh tiện dụng của bộ phụ kiện kim kh&amp;iacute;, c&amp;aacute;nh cửa&amp;nbsp;đ&amp;oacute;ng kh&amp;iacute;t v&amp;agrave; ổn định, cửa&amp;nbsp;kh&amp;ocirc;ng cong v&amp;ecirc;nh hoặc co d&amp;atilde;n, bề mặt khung cửa&amp;nbsp;giữ m&amp;agrave;u sắc tươi mới như ban đầu&amp;hellip;cũng l&amp;agrave; những luận cứ kh&amp;aacute;ch quan khẳng định t&amp;iacute;nh kinh tế trước mắt cũng như l&amp;acirc;u d&amp;agrave;i của việc lựa chọn cửa sổ từ thanh profile định h&amp;igrave;nh uPVC.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;5. Đa dạng k&amp;iacute;ch thước, kiểu d&amp;aacute;ng:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cửa nhựa uPVC ph&amp;ugrave; hợp với mọi kiểu kiến tr&amp;uacute;c: T&amp;ograve;a nh&amp;agrave;, biệt thự, văn ph&amp;ograve;ng, nh&amp;agrave; ở,&amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với của nhựa uPVC bạn c&amp;oacute; thể lựa chọn kiểu d&amp;aacute;ng sản phẩm ph&amp;ugrave; hợp với nhu cầu sử dụng v&amp;agrave; tiết kiệm kh&amp;ocirc;ng gian, tiện lợi trong sử dụng.&lt;/strong&gt;&lt;/p&gt;

&lt;h2&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh : Cường Lực 8mm -12mm&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;L&amp;otilde;i Th&amp;eacute;p : 1,2mm - 1,5mm&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;M&amp;agrave;u sắc: Trắng&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Phụ Kiện GQ&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 13:47:59.487' AS DateTime), NULL, NULL, NULL, NULL, N'cua-di-mo-quay', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (19, NULL, N'CỬA NHỰA MỞ TRƯỢT', N'Sản phẩm cửa uPVC (hay còn gọi là cửa nhựa lõi thép gia cường) tuy mới ra đời ở các nước châu Âu khoảng 60 năm trước đây nhưng đã chiếm hơn 60% thị phần cửa ở những quốc gia này. Hiện nay, sản phẩm cửa uPVC đã được sử dụng rộng rãi ở nhiều nước trên thế giới. Tại Việt Nam hiện nay, cửa nhựa uPVC đang trở nên thông dụng và được nhiều khách hàng quan tâm tìm hiểu và sử dụng.', N'~/Upload/Product/27015113cuanhua.jpg', N'<Images><Image>~/Upload/Product/27015113cuanhua_1.jpg</Image><Image>~/Upload/Product/27015113cuanhua_2.jpg</Image><Image>~/Upload/Product/27015113cuanhua_3.jpg</Image></Images>', 12, N'&lt;h2&gt;&lt;strong&gt;Ưu điểm của cửa nhựa UPVC.&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;1. C&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt tốt:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Căn ph&amp;ograve;ng nằm s&amp;aacute;t trục đường giao th&amp;ocirc;ng, nơi c&amp;oacute; cường độ tiếng ồn b&amp;ecirc;n ngo&amp;agrave;i l&amp;ecirc;n đến 85 dB, song nhờ cửa nhựa uPVC c&amp;oacute; độ c&amp;aacute;ch &amp;acirc;m tốt n&amp;ecirc;n cường độ tiếng ồn trong ph&amp;ograve;ng chỉ c&amp;ograve;n khoảng 40 - 45 dB.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đi k&amp;egrave;m với khả năng c&amp;aacute;ch &amp;acirc;m gi&amp;uacute;p n&amp;acirc;ng cao chất lượng cuộc sống, cửa nhựa uPVC c&amp;ograve;n c&amp;oacute; khả năng c&amp;aacute;ch nhiệt gấp từ 2 - 4 lần so với c&amp;aacute;c loại cửa th&amp;ocirc;ng thường, gi&amp;uacute;p tiết kiệm điện năng sưởi ấm v&amp;agrave; l&amp;agrave;m m&amp;aacute;t căn ph&amp;ograve;ng, mang lại hiệu quả kinh tế cao cho người sử dụng.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;2. T&amp;iacute;nh ổn định cao, kh&amp;ocirc;ng cong v&amp;ecirc;nh, co ng&amp;oacute;t:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Lu&amp;ocirc;n bền bỉ trước kh&amp;iacute; hậu nhiệt đới n&amp;oacute;ng, ẩm, mưa nhiều&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đặc t&amp;iacute;nh qu&amp;yacute; b&amp;aacute;u nổi bật của vật liệu uPVC l&amp;agrave; tuổi thọ rất cao do vật liệu n&amp;agrave;y kh&amp;ocirc;ng bị &amp;ocirc;xy h&amp;oacute;a, kh&amp;ocirc;ng bị l&amp;atilde;o h&amp;oacute;a hay ố v&amp;agrave;ng trong điều kiện bức xạ mặt trời v&amp;agrave; mưa axit.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Việc sử dụng c&amp;aacute;c chất phụ gia (Additives) v&amp;agrave; chất ổn định (Stabilizers) trong c&amp;ocirc;ng thức phối liệu đ&amp;atilde; tạo ra sự th&amp;iacute;ch ứng của vật liệu trong điều kiện nhiệt độ v&amp;agrave; độ ẩm cao.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;3. Chống ch&amp;aacute;y:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với nhiệt độ gần 100oC của đ&amp;egrave;n kh&amp;ograve;, thanh uPVC chỉ biến dạng m&amp;agrave; kh&amp;ocirc;ng b&amp;eacute;n ch&amp;aacute;y, loại bỏ hẳn qu&amp;aacute; tr&amp;igrave;nh ngọn lửa ph&amp;aacute;t t&amp;aacute;n qua cửa.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;4. Hiệu quả kinh tế cao trong qu&amp;aacute; tr&amp;igrave;nh sử dụng:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cửa nhựa uPVC c&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt, kh&amp;ocirc;ng đ&amp;ograve;i hỏi tu bổ định kỳ, duy tr&amp;igrave; chất lượng sử dụng cao trong thời gian h&amp;agrave;ng chục năm&amp;hellip; Hơn thế nữa, cửa uPVC gi&amp;uacute;p hạn chế sự truyền nhiệt, điều đ&amp;oacute; đồng nghĩa với việc tiết kiệm điện năng để l&amp;agrave;m m&amp;aacute;t hoặc sưởi ấm căn ph&amp;ograve;ng. Chỉ sau v&amp;agrave;i năm sử dụng, cửa sổ từ uPVC sẽ b&amp;ugrave; đắp lại to&amp;agrave;n bộ chi ph&amp;iacute; đầu tư ban đầu.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;So với một số loại cửa th&amp;ocirc;ng thường, chi ph&amp;iacute; đầu tư ban đầu cho cửa uPVC cao hơn, song theo thời gian, hiệu quả kinh tế nhờ tiết kiệm chi ph&amp;iacute; ph&amp;aacute;t sinh trong qu&amp;aacute; tr&amp;igrave;nh sử dụng m&amp;agrave; cửa uPVC đem lại sẽ ng&amp;agrave;y c&amp;agrave;ng được thể hiện r&amp;otilde; rệt hơn.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Những ưu điểm ri&amp;ecirc;ng kh&amp;aacute;c như t&amp;iacute;nh tiện dụng của bộ phụ kiện kim kh&amp;iacute;, c&amp;aacute;nh cửa&amp;nbsp;đ&amp;oacute;ng kh&amp;iacute;t v&amp;agrave; ổn định, cửa&amp;nbsp;kh&amp;ocirc;ng cong v&amp;ecirc;nh hoặc co d&amp;atilde;n, bề mặt khung cửa&amp;nbsp;giữ m&amp;agrave;u sắc tươi mới như ban đầu&amp;hellip;cũng l&amp;agrave; những luận cứ kh&amp;aacute;ch quan khẳng định t&amp;iacute;nh kinh tế trước mắt cũng như l&amp;acirc;u d&amp;agrave;i của việc lựa chọn cửa sổ từ thanh profile định h&amp;igrave;nh uPVC.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;5. Đa dạng k&amp;iacute;ch thước, kiểu d&amp;aacute;ng:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cửa nhựa uPVC ph&amp;ugrave; hợp với mọi kiểu kiến tr&amp;uacute;c: T&amp;ograve;a nh&amp;agrave;, biệt thự, văn ph&amp;ograve;ng, nh&amp;agrave; ở,&amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với của nhựa uPVC bạn c&amp;oacute; thể lựa chọn kiểu d&amp;aacute;ng sản phẩm ph&amp;ugrave; hợp với nhu cầu sử dụng v&amp;agrave; tiết kiệm kh&amp;ocirc;ng gian, tiện lợi trong sử dụng.&lt;/strong&gt;&lt;/p&gt;

&lt;h2&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm -12mm&lt;/li&gt;
	&lt;li&gt;L&amp;otilde;i Th&amp;eacute;p : 1,2mm - 1,5mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng&lt;/li&gt;
	&lt;li&gt;Phụ Kiện GQ&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 13:51:13.663' AS DateTime), NULL, NULL, NULL, NULL, N'cua-nhua-mo-truot', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (20, NULL, N'CỬA SỔ HẤT', N'Sản phẩm cửa uPVC (hay còn gọi là cửa nhựa lõi thép gia cường) tuy mới ra đời ở các nước châu Âu khoảng 60 năm trước đây nhưng đã chiếm hơn 60% thị phần cửa ở những quốc gia này. Hiện nay, sản phẩm cửa uPVC đã được sử dụng rộng rãi ở nhiều nước trên thế giới. Tại Việt Nam hiện nay, cửa nhựa uPVC đang trở nên thông dụng và được nhiều khách hàng quan tâm tìm hiểu và sử dụng.', N'~/Upload/Product/27053143cuasohat1.jpg', N'<Images><Image>~/Upload/Product/27053143cuasohat1.jpg</Image><Image>~/Upload/Product/27053143cuasohat2.jpg</Image><Image>~/Upload/Product/27053143cuasohat3.jpg</Image></Images>', 11, N'&lt;h2&gt;Ưu điểm của cửa nhựa UPVC.&lt;/h2&gt;

&lt;p&gt;1. C&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt tốt:&lt;/p&gt;

&lt;p&gt;Căn ph&amp;ograve;ng nằm s&amp;aacute;t trục đường giao th&amp;ocirc;ng, nơi c&amp;oacute; cường độ tiếng ồn b&amp;ecirc;n ngo&amp;agrave;i l&amp;ecirc;n đến 85 dB, song nhờ cửa nhựa uPVC c&amp;oacute; độ c&amp;aacute;ch &amp;acirc;m tốt n&amp;ecirc;n cường độ tiếng ồn trong ph&amp;ograve;ng chỉ c&amp;ograve;n khoảng 40 - 45 dB.&lt;/p&gt;

&lt;p&gt;Đi k&amp;egrave;m với khả năng c&amp;aacute;ch &amp;acirc;m gi&amp;uacute;p n&amp;acirc;ng cao chất lượng cuộc sống, cửa nhựa uPVC c&amp;ograve;n c&amp;oacute; khả năng c&amp;aacute;ch nhiệt gấp từ 2 - 4 lần so với c&amp;aacute;c loại cửa th&amp;ocirc;ng thường, gi&amp;uacute;p tiết kiệm điện năng sưởi ấm v&amp;agrave; l&amp;agrave;m m&amp;aacute;t căn ph&amp;ograve;ng, mang lại hiệu quả kinh tế cao cho người sử dụng.&lt;/p&gt;

&lt;p&gt;2. T&amp;iacute;nh ổn định cao, kh&amp;ocirc;ng cong v&amp;ecirc;nh, co ng&amp;oacute;t:&lt;/p&gt;

&lt;p&gt;Lu&amp;ocirc;n bền bỉ trước kh&amp;iacute; hậu nhiệt đới n&amp;oacute;ng, ẩm, mưa nhiều&lt;/p&gt;

&lt;p&gt;Đặc t&amp;iacute;nh qu&amp;yacute; b&amp;aacute;u nổi bật của vật liệu uPVC l&amp;agrave; tuổi thọ rất cao do vật liệu n&amp;agrave;y kh&amp;ocirc;ng bị &amp;ocirc;xy h&amp;oacute;a, kh&amp;ocirc;ng bị l&amp;atilde;o h&amp;oacute;a hay ố v&amp;agrave;ng trong điều kiện bức xạ mặt trời v&amp;agrave; mưa axit.&lt;/p&gt;

&lt;p&gt;Việc sử dụng c&amp;aacute;c chất phụ gia (Additives) v&amp;agrave; chất ổn định (Stabilizers) trong c&amp;ocirc;ng thức phối liệu đ&amp;atilde; tạo ra sự th&amp;iacute;ch ứng của vật liệu trong điều kiện nhiệt độ v&amp;agrave; độ ẩm cao.&lt;/p&gt;

&lt;p&gt;3. Chống ch&amp;aacute;y:&lt;/p&gt;

&lt;p&gt;Với nhiệt độ gần 100oC của đ&amp;egrave;n kh&amp;ograve;, thanh uPVC chỉ biến dạng m&amp;agrave; kh&amp;ocirc;ng b&amp;eacute;n ch&amp;aacute;y, loại bỏ hẳn qu&amp;aacute; tr&amp;igrave;nh ngọn lửa ph&amp;aacute;t t&amp;aacute;n qua cửa.&lt;/p&gt;

&lt;p&gt;4. Hiệu quả kinh tế cao trong qu&amp;aacute; tr&amp;igrave;nh sử dụng:&lt;/p&gt;

&lt;p&gt;Cửa nhựa uPVC c&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt, kh&amp;ocirc;ng đ&amp;ograve;i hỏi tu bổ định kỳ, duy tr&amp;igrave; chất lượng sử dụng cao trong thời gian h&amp;agrave;ng chục năm&amp;hellip; Hơn thế nữa, cửa uPVC gi&amp;uacute;p hạn chế sự truyền nhiệt, điều đ&amp;oacute; đồng nghĩa với việc tiết kiệm điện năng để l&amp;agrave;m m&amp;aacute;t hoặc sưởi ấm căn ph&amp;ograve;ng. Chỉ sau v&amp;agrave;i năm sử dụng, cửa sổ từ uPVC sẽ b&amp;ugrave; đắp lại to&amp;agrave;n bộ chi ph&amp;iacute; đầu tư ban đầu.&lt;/p&gt;

&lt;p&gt;So với một số loại cửa th&amp;ocirc;ng thường, chi ph&amp;iacute; đầu tư ban đầu cho cửa uPVC cao hơn, song theo thời gian, hiệu quả kinh tế nhờ tiết kiệm chi ph&amp;iacute; ph&amp;aacute;t sinh trong qu&amp;aacute; tr&amp;igrave;nh sử dụng m&amp;agrave; cửa uPVC đem lại sẽ ng&amp;agrave;y c&amp;agrave;ng được thể hiện r&amp;otilde; rệt hơn.&lt;/p&gt;

&lt;p&gt;Những ưu điểm ri&amp;ecirc;ng kh&amp;aacute;c như t&amp;iacute;nh tiện dụng của bộ phụ kiện kim kh&amp;iacute;, c&amp;aacute;nh cửa&amp;nbsp;&lt;strong&gt;đ&amp;oacute;ng kh&amp;iacute;t v&amp;agrave; ổn định&lt;/strong&gt;, cửa&amp;nbsp;&lt;strong&gt;kh&amp;ocirc;ng cong v&amp;ecirc;nh hoặc co d&amp;atilde;n&lt;/strong&gt;, bề mặt khung cửa&lt;strong&gt;&amp;nbsp;giữ m&amp;agrave;u sắc tươi mới như ban đầu&lt;/strong&gt;&amp;hellip;cũng l&amp;agrave; những luận cứ kh&amp;aacute;ch quan khẳng định t&amp;iacute;nh kinh tế trước mắt cũng như l&amp;acirc;u d&amp;agrave;i của việc lựa chọn cửa sổ từ thanh profile định h&amp;igrave;nh uPVC.&lt;/p&gt;

&lt;p&gt;5. Đa dạng k&amp;iacute;ch thước, kiểu d&amp;aacute;ng:&lt;/p&gt;

&lt;p&gt;Cửa nhựa uPVC ph&amp;ugrave; hợp với mọi kiểu kiến tr&amp;uacute;c: T&amp;ograve;a nh&amp;agrave;, biệt thự, văn ph&amp;ograve;ng, nh&amp;agrave; ở,&amp;hellip;&lt;/p&gt;

&lt;p&gt;Với của nhựa uPVC bạn c&amp;oacute; thể lựa chọn kiểu d&amp;aacute;ng sản phẩm ph&amp;ugrave; hợp với nhu cầu sử dụng v&amp;agrave; tiết kiệm kh&amp;ocirc;ng gian, tiện lợi trong sử dụng.&lt;/p&gt;

&lt;h2&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/h2&gt;

&lt;p&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;&lt;strong&gt;Minh Ho&amp;agrave;ng DL&lt;/strong&gt;&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;&lt;strong&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/strong&gt;&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&lt;strong&gt;&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&lt;/strong&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/p&gt;

&lt;p&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/p&gt;
', N'&lt;p&gt;Th&amp;ocirc;ng số kỹ thuật:&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm -12mm&lt;/li&gt;
	&lt;li&gt;L&amp;otilde;i Th&amp;eacute;p : 1,2mm - 1,5mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng&lt;/li&gt;
	&lt;li&gt;Phụ Kiện GQ&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:31:43.670' AS DateTime), NULL, NULL, NULL, NULL, N'cua-so-hat', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (21, NULL, N'CỬA TRƯỢT MỞ XẾP NHÔM XINGFA', N'Cửa nhôm kính Xingfa giúp lấy ánh sáng tự nhiên tối đa vào nhà lại cách nhiệt giúp tiết kiệm điện điều hòa và điện thắp sáng, cửa cách âm tuyệt đối giúp giảm tiếng ồn bên ngoài.', N'~/Upload/Product/27053342cuanhomXinga1.jpg', N'<Images><Image>~/Upload/Product/27053342cuanhomXinga1.jpg</Image><Image>~/Upload/Product/27053342cuanhomXinga2.jpg</Image><Image>~/Upload/Product/27053342cuanhomXinga3.jpg</Image><Image>~/Upload/Product/27053342cuanhomXinga4.jpg</Image></Images>', 13, N'&lt;h2&gt;Đặc t&amp;iacute;nh ưu việt của cửa nh&amp;ocirc;m Xingfa.&lt;/h2&gt;

&lt;p&gt;Kh&amp;ocirc;ng bị cong v&amp;ecirc;nh, co ng&amp;oacute;t, oxi h&amp;oacute;a v&amp;agrave; han gỉ theo thời gian như một số sản phẩm cửa nhựa l&amp;otilde;i th&amp;eacute;p th&amp;ocirc;ng thường trong điều kiện kh&amp;iacute; hậu khắc nghiệt hoặc kh&amp;iacute; hậu v&amp;ugrave;ng biển mặn. Kh&amp;ocirc;ng bị mối mọt như c&amp;aacute;c sản phẩm cửa gỗ.&lt;/p&gt;

&lt;p&gt;Gia nhiệt cửa nh&amp;ocirc;m mang lại khả năng chịu nhiệt v&amp;agrave; c&amp;oacute; t&amp;iacute;nh chống ch&amp;aacute;y rất tốt, gặp hỏa hoạn, dưới 1000 độ C cửa kh&amp;ocirc;ng bị biến dạng, hạn chế sự lan rộng của lửa ra c&amp;aacute;c khu vực kh&amp;aacute;c.&lt;/p&gt;

&lt;p&gt;Hệ gioăng EPDM k&amp;iacute;n kh&amp;iacute;t kết hợp với phụ kiện Kinglong cao cấp gi&amp;uacute;p cửa nh&amp;ocirc;m lu&amp;ocirc;n c&amp;aacute;ch &amp;acirc;m c&amp;aacute;ch nhiệt, đem đến kh&amp;ocirc;ng gian y&amp;ecirc;n tĩnh.&lt;/p&gt;

&lt;p&gt;Sử dụng k&amp;iacute;nh an to&amp;agrave;n, k&amp;iacute;nh cường lực, k&amp;iacute;nh hộp&amp;hellip; mang lại độ an to&amp;agrave;n cao, kh&amp;ocirc;ng g&amp;acirc;y s&amp;aacute;t thương khi vỡ, đặc biệt rất hiếm khi vỡ, k&amp;iacute;nh nghệ thuật mang lại vẻ đẹp cho kh&amp;ocirc;ng gian nh&amp;agrave; bạn,&lt;/p&gt;

&lt;p&gt;Thanh profile nh&amp;ocirc;m gồm c&amp;aacute;c khoang trống v&amp;agrave; hai đường g&amp;acirc;n gia cường trợ lực c&amp;oacute; khả năng chịu lực va đập hay vặn xoắn.&lt;/p&gt;

&lt;p&gt;Sử dụng c&amp;ocirc;ng nghệ &amp;eacute;p g&amp;oacute;c để kết nối c&amp;aacute;c thanh nh&amp;ocirc;m mang lại độ khỏe khoắn v&amp;agrave; chắc cho c&amp;aacute;nh cửa. tự nhi&amp;ecirc;n hay gỗ c&amp;ocirc;ng nghiệp.&lt;/p&gt;

&lt;p&gt;Với c&amp;aacute;c c&amp;ocirc;ng tr&amp;igrave;nh kiến tr&amp;uacute;c l&amp;agrave; chung cư, nh&amp;agrave; cao tầng, kh&amp;aacute;ch sạn, nh&amp;agrave; h&amp;agrave;ng rất cần thiết sử dụng cửa nh&amp;ocirc;m để tăng t&amp;iacute;nh chịu lực cao gấp nhiều lần so với c&amp;aacute;c d&amp;ograve;ng cửa kh&amp;aacute;c.&lt;/p&gt;

&lt;p&gt;Bề mặt sơn tĩnh điện với c&amp;ocirc;ng nghệ hiện đại của Nhật Bản gi&amp;uacute;p lớp sơn lu&amp;ocirc;n s&amp;aacute;ng b&amp;oacute;ng, dễ d&amp;agrave;ng vệ sinh khi bụi bẩn, chống tia UV mặt trời.&lt;/p&gt;

&lt;p&gt;C&amp;oacute; rất nhiều thiết kế cửa nh&amp;ocirc;m k&amp;iacute;nh Xingfa cho bạn lựa chọn: Mở quay, trượt, hất, xếp trượt, quay trượt &amp;hellip;&lt;/p&gt;

&lt;h2&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/h2&gt;

&lt;p&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;&lt;strong&gt;Minh Ho&amp;agrave;ng DL&lt;/strong&gt;&amp;nbsp;tại&amp;nbsp;&lt;strong&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/strong&gt;&lt;br /&gt;
Hoặc Hotline:&lt;strong&gt;&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&lt;/strong&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/p&gt;

&lt;p&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;Độ d&amp;agrave;y: 1,4-2mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm &amp;ndash; 12mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng, Ghi, N&amp;acirc;u, V&amp;acirc;n Gỗ&lt;/li&gt;
	&lt;li&gt;Phụ kiện : KinLong&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh nh&amp;ocirc;m 10 năm bền m&amp;agrave;u&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:33:42.967' AS DateTime), NULL, NULL, NULL, NULL, N'cua-truot-mo-xep-nhom-xingfa', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (22, NULL, N'CỬA ĐI MỞ QUAY NHÔM XINGFA', N'Cửa nhôm kính Xingfa giúp lấy ánh sáng tự nhiên tối đa vào nhà lại cách nhiệt giúp tiết kiệm điện điều hòa và điện thắp sáng, cửa cách âm tuyệt đối giúp giảm tiếng ồn bên ngoài.', N'~/Upload/Product/27053530cuadimoquay11.jpg', N'<Images><Image>~/Upload/Product/27053530cuadimoquay.jpg</Image><Image>~/Upload/Product/27053530cuadimoquay11.jpg</Image><Image>~/Upload/Product/27053530cuadimoquayxinga.jpg</Image><Image>~/Upload/Product/27053530cuanhomXinga1.jpg</Image></Images>', 13, N'&lt;h2&gt;Đặc t&amp;iacute;nh ưu việt của cửa nh&amp;ocirc;m Xingfa.&lt;/h2&gt;

&lt;p&gt;Kh&amp;ocirc;ng bị cong v&amp;ecirc;nh, co ng&amp;oacute;t, oxi h&amp;oacute;a v&amp;agrave; han gỉ theo thời gian như một số sản phẩm cửa nhựa l&amp;otilde;i th&amp;eacute;p th&amp;ocirc;ng thường trong điều kiện kh&amp;iacute; hậu khắc nghiệt hoặc kh&amp;iacute; hậu v&amp;ugrave;ng biển mặn. Kh&amp;ocirc;ng bị mối mọt như c&amp;aacute;c sản phẩm cửa gỗ.&lt;/p&gt;

&lt;p&gt;Gia nhiệt cửa nh&amp;ocirc;m mang lại khả năng chịu nhiệt v&amp;agrave; c&amp;oacute; t&amp;iacute;nh chống ch&amp;aacute;y rất tốt, gặp hỏa hoạn, dưới 1000 độ C cửa kh&amp;ocirc;ng bị biến dạng, hạn chế sự lan rộng của lửa ra c&amp;aacute;c khu vực kh&amp;aacute;c.&lt;/p&gt;

&lt;p&gt;Hệ gioăng EPDM k&amp;iacute;n kh&amp;iacute;t kết hợp với phụ kiện Kinglong cao cấp gi&amp;uacute;p cửa nh&amp;ocirc;m lu&amp;ocirc;n c&amp;aacute;ch &amp;acirc;m c&amp;aacute;ch nhiệt, đem đến kh&amp;ocirc;ng gian y&amp;ecirc;n tĩnh.&lt;/p&gt;

&lt;p&gt;Sử dụng k&amp;iacute;nh an to&amp;agrave;n, k&amp;iacute;nh cường lực, k&amp;iacute;nh hộp&amp;hellip; mang lại độ an to&amp;agrave;n cao, kh&amp;ocirc;ng g&amp;acirc;y s&amp;aacute;t thương khi vỡ, đặc biệt rất hiếm khi vỡ, k&amp;iacute;nh nghệ thuật mang lại vẻ đẹp cho kh&amp;ocirc;ng gian nh&amp;agrave; bạn,&lt;/p&gt;

&lt;p&gt;Thanh profile nh&amp;ocirc;m gồm c&amp;aacute;c khoang trống v&amp;agrave; hai đường g&amp;acirc;n gia cường trợ lực c&amp;oacute; khả năng chịu lực va đập hay vặn xoắn.&lt;/p&gt;

&lt;p&gt;Sử dụng c&amp;ocirc;ng nghệ &amp;eacute;p g&amp;oacute;c để kết nối c&amp;aacute;c thanh nh&amp;ocirc;m mang lại độ khỏe khoắn v&amp;agrave; chắc cho c&amp;aacute;nh cửa. tự nhi&amp;ecirc;n hay gỗ c&amp;ocirc;ng nghiệp.&lt;/p&gt;

&lt;p&gt;Với c&amp;aacute;c c&amp;ocirc;ng tr&amp;igrave;nh kiến tr&amp;uacute;c l&amp;agrave; chung cư, nh&amp;agrave; cao tầng, kh&amp;aacute;ch sạn, nh&amp;agrave; h&amp;agrave;ng rất cần thiết sử dụng cửa nh&amp;ocirc;m để tăng t&amp;iacute;nh chịu lực cao gấp nhiều lần so với c&amp;aacute;c d&amp;ograve;ng cửa kh&amp;aacute;c.&lt;/p&gt;

&lt;p&gt;Bề mặt sơn tĩnh điện với c&amp;ocirc;ng nghệ hiện đại của Nhật Bản gi&amp;uacute;p lớp sơn lu&amp;ocirc;n s&amp;aacute;ng b&amp;oacute;ng, dễ d&amp;agrave;ng vệ sinh khi bụi bẩn, chống tia UV mặt trời.&lt;/p&gt;

&lt;p&gt;C&amp;oacute; rất nhiều thiết kế cửa nh&amp;ocirc;m k&amp;iacute;nh Xingfa cho bạn lựa chọn: Mở quay, trượt, hất, xếp trượt, quay trượt &amp;hellip;&lt;/p&gt;

&lt;h2&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/h2&gt;

&lt;p&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;&lt;strong&gt;Minh Ho&amp;agrave;ng DL&lt;/strong&gt;&amp;nbsp;tại&amp;nbsp;&lt;strong&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/strong&gt;&lt;br /&gt;
Hoặc Hotline:&lt;strong&gt;&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&lt;/strong&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/p&gt;

&lt;p&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;Độ d&amp;agrave;y: 1,4-2mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm &amp;ndash; 12mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng, Ghi, N&amp;acirc;u, V&amp;acirc;n Gỗ&lt;/li&gt;
	&lt;li&gt;Phụ kiện : KinLong&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh nh&amp;ocirc;m 10 năm bền m&amp;agrave;u&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:35:30.170' AS DateTime), NULL, NULL, NULL, NULL, N'cua-di-mo-quay-nhom-xingfa', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (23, NULL, N'CỬA MỞ TRƯỢT NHÔM XINGFA', N'Cửa nhôm kính Xingfa giúp lấy ánh sáng tự nhiên tối đa vào nhà lại cách nhiệt giúp tiết kiệm điện điều hòa và điện thắp sáng, cửa cách âm tuyệt đối giúp giảm tiếng ồn bên ngoài.', N'~/Upload/Product/27053701cuamotruotnhom1.jpg', N'<Images><Image>~/Upload/Product/27053701cuamotruotnhom1.jpg</Image><Image>~/Upload/Product/27053701cuamotruotnhom2.jpg</Image><Image>~/Upload/Product/27053701cuamotruotnhom3.jpg</Image></Images>', 13, N'&lt;h1&gt;&lt;strong&gt;Đặc t&amp;iacute;nh ưu việt của cửa nh&amp;ocirc;m Xingfa.&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Kh&amp;ocirc;ng bị cong v&amp;ecirc;nh, co ng&amp;oacute;t, oxi h&amp;oacute;a v&amp;agrave; han gỉ theo thời gian như một số sản phẩm cửa nhựa l&amp;otilde;i th&amp;eacute;p th&amp;ocirc;ng thường trong điều kiện kh&amp;iacute; hậu khắc nghiệt hoặc kh&amp;iacute; hậu v&amp;ugrave;ng biển mặn. Kh&amp;ocirc;ng bị mối mọt như c&amp;aacute;c sản phẩm cửa gỗ.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Gia nhiệt cửa nh&amp;ocirc;m mang lại khả năng chịu nhiệt v&amp;agrave; c&amp;oacute; t&amp;iacute;nh chống ch&amp;aacute;y rất tốt, gặp hỏa hoạn, dưới 1000 độ C cửa kh&amp;ocirc;ng bị biến dạng, hạn chế sự lan rộng của lửa ra c&amp;aacute;c khu vực kh&amp;aacute;c.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Hệ gioăng EPDM k&amp;iacute;n kh&amp;iacute;t kết hợp với phụ kiện Kinglong cao cấp gi&amp;uacute;p cửa nh&amp;ocirc;m lu&amp;ocirc;n c&amp;aacute;ch &amp;acirc;m c&amp;aacute;ch nhiệt, đem đến kh&amp;ocirc;ng gian y&amp;ecirc;n tĩnh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng k&amp;iacute;nh an to&amp;agrave;n, k&amp;iacute;nh cường lực, k&amp;iacute;nh hộp&amp;hellip; mang lại độ an to&amp;agrave;n cao, kh&amp;ocirc;ng g&amp;acirc;y s&amp;aacute;t thương khi vỡ, đặc biệt rất hiếm khi vỡ, k&amp;iacute;nh nghệ thuật mang lại vẻ đẹp cho kh&amp;ocirc;ng gian nh&amp;agrave; bạn,&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Thanh profile nh&amp;ocirc;m gồm c&amp;aacute;c khoang trống v&amp;agrave; hai đường g&amp;acirc;n gia cường trợ lực c&amp;oacute; khả năng chịu lực va đập hay vặn xoắn.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng c&amp;ocirc;ng nghệ &amp;eacute;p g&amp;oacute;c để kết nối c&amp;aacute;c thanh nh&amp;ocirc;m mang lại độ khỏe khoắn v&amp;agrave; chắc cho c&amp;aacute;nh cửa. tự nhi&amp;ecirc;n hay gỗ c&amp;ocirc;ng nghiệp.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với c&amp;aacute;c c&amp;ocirc;ng tr&amp;igrave;nh kiến tr&amp;uacute;c l&amp;agrave; chung cư, nh&amp;agrave; cao tầng, kh&amp;aacute;ch sạn, nh&amp;agrave; h&amp;agrave;ng rất cần thiết sử dụng cửa nh&amp;ocirc;m để tăng t&amp;iacute;nh chịu lực cao gấp nhiều lần so với c&amp;aacute;c d&amp;ograve;ng cửa kh&amp;aacute;c.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Bề mặt sơn tĩnh điện với c&amp;ocirc;ng nghệ hiện đại của Nhật Bản gi&amp;uacute;p lớp sơn lu&amp;ocirc;n s&amp;aacute;ng b&amp;oacute;ng, dễ d&amp;agrave;ng vệ sinh khi bụi bẩn, chống tia UV mặt trời.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C&amp;oacute; rất nhiều thiết kế cửa nh&amp;ocirc;m k&amp;iacute;nh Xingfa cho bạn lựa chọn: Mở quay, trượt, hất, xếp trượt, quay trượt &amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;Độ d&amp;agrave;y: 1,4-2mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm &amp;ndash; 12mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng, Ghi, N&amp;acirc;u, V&amp;acirc;n Gỗ&lt;/li&gt;
	&lt;li&gt;Phụ kiện : KinLong&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh nh&amp;ocirc;m 10 năm bền m&amp;agrave;u&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:37:01.310' AS DateTime), NULL, NULL, NULL, NULL, N'cua-mo-truot-nhom-xingfa', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (24, NULL, N'CỬA SỔ HẤT NHÔM XINGFA', N'Cửa nhôm kính Xingfa giúp lấy ánh sáng tự nhiên tối đa vào nhà lại cách nhiệt giúp tiết kiệm điện điều hòa và điện thắp sáng, cửa cách âm tuyệt đối giúp giảm tiếng ồn bên ngoài.', N'~/Upload/Product/27053838cuasohatnhom1.jpg', N'<Images><Image>~/Upload/Product/27053838cuasohatnhom1.jpg</Image><Image>~/Upload/Product/27053838cuasohatnhom2.jpg</Image><Image>~/Upload/Product/27053838cuasohatnhom3.jpg</Image></Images>', 13, N'&lt;h1&gt;&lt;strong&gt;Đặc t&amp;iacute;nh ưu việt của cửa nh&amp;ocirc;m Xingfa.&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Kh&amp;ocirc;ng bị cong v&amp;ecirc;nh, co ng&amp;oacute;t, oxi h&amp;oacute;a v&amp;agrave; han gỉ theo thời gian như một số sản phẩm cửa nhựa l&amp;otilde;i th&amp;eacute;p th&amp;ocirc;ng thường trong điều kiện kh&amp;iacute; hậu khắc nghiệt hoặc kh&amp;iacute; hậu v&amp;ugrave;ng biển mặn. Kh&amp;ocirc;ng bị mối mọt như c&amp;aacute;c sản phẩm cửa gỗ.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Gia nhiệt cửa nh&amp;ocirc;m mang lại khả năng chịu nhiệt v&amp;agrave; c&amp;oacute; t&amp;iacute;nh chống ch&amp;aacute;y rất tốt, gặp hỏa hoạn, dưới 1000 độ C cửa kh&amp;ocirc;ng bị biến dạng, hạn chế sự lan rộng của lửa ra c&amp;aacute;c khu vực kh&amp;aacute;c.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Hệ gioăng EPDM k&amp;iacute;n kh&amp;iacute;t kết hợp với phụ kiện Kinglong cao cấp gi&amp;uacute;p cửa nh&amp;ocirc;m lu&amp;ocirc;n c&amp;aacute;ch &amp;acirc;m c&amp;aacute;ch nhiệt, đem đến kh&amp;ocirc;ng gian y&amp;ecirc;n tĩnh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng k&amp;iacute;nh an to&amp;agrave;n, k&amp;iacute;nh cường lực, k&amp;iacute;nh hộp&amp;hellip; mang lại độ an to&amp;agrave;n cao, kh&amp;ocirc;ng g&amp;acirc;y s&amp;aacute;t thương khi vỡ, đặc biệt rất hiếm khi vỡ, k&amp;iacute;nh nghệ thuật mang lại vẻ đẹp cho kh&amp;ocirc;ng gian nh&amp;agrave; bạn,&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Thanh profile nh&amp;ocirc;m gồm c&amp;aacute;c khoang trống v&amp;agrave; hai đường g&amp;acirc;n gia cường trợ lực c&amp;oacute; khả năng chịu lực va đập hay vặn xoắn.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng c&amp;ocirc;ng nghệ &amp;eacute;p g&amp;oacute;c để kết nối c&amp;aacute;c thanh nh&amp;ocirc;m mang lại độ khỏe khoắn v&amp;agrave; chắc cho c&amp;aacute;nh cửa. tự nhi&amp;ecirc;n hay gỗ c&amp;ocirc;ng nghiệp.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với c&amp;aacute;c c&amp;ocirc;ng tr&amp;igrave;nh kiến tr&amp;uacute;c l&amp;agrave; chung cư, nh&amp;agrave; cao tầng, kh&amp;aacute;ch sạn, nh&amp;agrave; h&amp;agrave;ng rất cần thiết sử dụng cửa nh&amp;ocirc;m để tăng t&amp;iacute;nh chịu lực cao gấp nhiều lần so với c&amp;aacute;c d&amp;ograve;ng cửa kh&amp;aacute;c.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Bề mặt sơn tĩnh điện với c&amp;ocirc;ng nghệ hiện đại của Nhật Bản gi&amp;uacute;p lớp sơn lu&amp;ocirc;n s&amp;aacute;ng b&amp;oacute;ng, dễ d&amp;agrave;ng vệ sinh khi bụi bẩn, chống tia UV mặt trời.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C&amp;oacute; rất nhiều thiết kế cửa nh&amp;ocirc;m k&amp;iacute;nh Xingfa cho bạn lựa chọn: Mở quay, trượt, hất, xếp trượt, quay trượt &amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;Độ d&amp;agrave;y: 1,4-2mm&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh : Cường Lực 8mm &amp;ndash; 12mm&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;M&amp;agrave;u sắc: Trắng, Ghi, N&amp;acirc;u, V&amp;acirc;n Gỗ&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Phụ kiện : KinLong&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Bảo h&amp;agrave;nh nh&amp;ocirc;m 10 năm bền m&amp;agrave;u&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:38:38.853' AS DateTime), NULL, CAST(N'2020-06-27 17:47:58.580' AS DateTime), NULL, NULL, N'cua-so-hat-nhom-xingfa', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (25, NULL, N'CẦU THANG KÍNH CƯỜNG LỰC KHÔNG TRỤ', N'Cầu thang kính cường lực được sản xuất dựa trên dây chuyên hiện đại cùng công nghệ tiên tiến và dội ngũ công nhân viên chuyên nghiệp tạo nên sản phẩm cầu thang kính cường lực chất lượng cao cấp với giá thành cạnh tranh.', N'~/Upload/Product/27054947cauthangkinh1.jpg', N'<Images><Image>~/Upload/Product/27054947cauthangkinh1.jpg</Image><Image>~/Upload/Product/27054947cauthangkinh2.jpg</Image><Image>~/Upload/Product/27054947cauthangkinh3.jpg</Image></Images>', 14, N'&lt;h1&gt;&lt;strong&gt;Ưu điểm khi sử dụng cầu thang k&amp;iacute;nh cường lực:&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;1. Mang đến sự tinh tế cho mỗi c&amp;ocirc;ng tr&amp;igrave;nh&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;Cầu thang k&amp;iacute;nh đẹp được sử dụng rất phổ biến tr&amp;ecirc;n thị trường,đặc biệt l&amp;agrave; được sử dụng nhiều ở c&amp;aacute;c trung t&amp;acirc;m thương mại lớn v&amp;agrave; cao ốc to&amp;agrave; nh&amp;agrave; cao tầng v&amp;igrave;&amp;nbsp;cầu thang k&amp;iacute;nh đẹp&amp;nbsp;mang đến một phong c&amp;aacute;ch ri&amp;ecirc;ng v&amp;agrave; n&amp;eacute;t độc đ&amp;aacute;o cho c&amp;ocirc;ng tr&amp;igrave;nh của bạn.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Khi bạn quyết định thay thế những chiếc cầu thang truyền thống bằng chiếc cầu thang k&amp;iacute;nh l&amp;agrave; bạn đang tạo ra cho c&amp;ocirc;ng tr&amp;igrave;nh của m&amp;igrave;nh kh&amp;ocirc;ng gian tho&amp;aacute;ng m&amp;aacute;t dễ chịu v&amp;agrave; s&amp;aacute;ng sủa cũng như những n&amp;eacute;t sang trọng v&amp;agrave; lịch sự.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Mẫu m&amp;atilde; đa dạng, phong ph&amp;uacute; về chủng loại&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;&amp;nbsp;Mẫu m&amp;atilde; đa dạng bao gồm: cầu thang k&amp;iacute;nh đẹp, cầu thang k&amp;iacute;nh đẹp h&amp;agrave; nội, cầu thang k&amp;iacute;nh gi&amp;aacute; rẻ,cầu thang k&amp;iacute;nh kh&amp;ocirc;ng trụ, cầu thang k&amp;iacute;nh inox, cầu thang k&amp;iacute;nh cường lực, cầu thang k&amp;iacute;nh cong&amp;nbsp;với rất nhiều mẫu m&amp;atilde; v&amp;agrave; kiểu d&amp;aacute;ng kh&amp;aacute;c nhau ph&amp;ugrave; hợp với kiến tr&amp;uacute;c của qu&amp;yacute; kh&amp;aacute;ch.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;2. An to&amp;agrave;n tuyệt đối&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;&amp;nbsp;Việc sử dụng k&amp;iacute;nh cường lực cho cầu thang k&amp;iacute;nh l&amp;agrave; v&amp;ocirc; c&amp;ugrave;ng an to&amp;agrave;n.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Sản phẩm k&amp;iacute;nh cường lực l&amp;agrave; sản phẩm si&amp;ecirc;u bền v&amp;agrave; chất lượng chịu được lực v&amp;agrave; chống trầy xước hơn những loại kh&amp;aacute;c.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Sử dụng k&amp;iacute;nh cường lực nếu trường hợp rủi ro xảy ra k&amp;iacute;nh vỡ th&amp;igrave; cũng kh&amp;ocirc;ng nguy hiểm cho người sử dụng.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;3. Khả năng chịu sốc nhiệt cao, chống rung, chịu lực tốt&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh chịu lực rất tốt,khả năng va đập mạnh cũng kh&amp;ocirc;ng sao,chịu được tải trọng lớn.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh c&amp;oacute; khả năng chống rung từ những t&amp;aacute;c động mạnh từ b&amp;ecirc;n ngo&amp;agrave;i t&amp;aacute;c động v&amp;agrave;o.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh cường lực c&amp;oacute; khả năng chịu sốc nhiệt rất cao&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;4. Độ bền cao, sử dụng l&amp;acirc;u d&amp;agrave;i&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;Tuổi thọ của cầu thang k&amp;iacute;nh cường lực rất cao,v&amp;agrave; bạn c&amp;oacute; thể y&amp;ecirc;n t&amp;acirc;m sử dụng rất l&amp;acirc;u d&amp;agrave;i.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm-12mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;ch thước: theo y&amp;ecirc;u cầu&lt;/li&gt;
	&lt;li&gt;Thiết kế theo mẫu c&amp;oacute; sẵn hoặc theo &amp;yacute; tưởng của Kh&amp;aacute;ch H&amp;agrave;ng&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:49:47.610' AS DateTime), NULL, NULL, NULL, NULL, N'cau-thang-kinh-cuong-luc-khong-tru', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (26, NULL, N'LAN CAN KÍNH CẦU THANG TRỤ GỖ', N'Những tấm kính cường lực với độ bền chắc hiện nay không chỉ xuất hiện trong các tòa nhà cao tầng mà dần được người dân sử dụng nhiều hơn để thiết kế nội thất cho ngôi nhà của mình.', N'~/Upload/Product/27055125lancankinh.jpg', N'<Images><Image>~/Upload/Product/27055125lancankinh.jpg</Image><Image>~/Upload/Product/27055125lancankinh2.jpg</Image><Image>~/Upload/Product/27055125lancankinh3.jpg</Image></Images>', 14, N'&lt;h1&gt;&lt;strong&gt;Lợi &amp;iacute;ch khi sử dụng lan canh k&amp;iacute;nh:&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;1. Kh&amp;ocirc;ng gian sống trở n&amp;ecirc;n rộng r&amp;atilde;i v&amp;agrave; thoải m&amp;aacute;i hơn&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Ưu điểm nổi bật của hầu hết mọi loại k&amp;iacute;nh l&amp;agrave; n&amp;oacute; mang đến sự rộng r&amp;atilde;i v&amp;agrave; v&amp;agrave; tho&amp;aacute;ng cho kh&amp;ocirc;ng gian. Việc sử dụng k&amp;iacute;nh cường lực để l&amp;agrave;m lan can cũng sẽ mang đến cho bạn những kh&amp;ocirc;ng gian rộng v&amp;agrave; hết sức th&amp;ocirc;ng tho&amp;aacute;ng. Nếu sử dụng sắt, inox hay nh&amp;ocirc;m l&amp;agrave;m lan can chắc hẳn bạn sẽ kh&amp;ocirc;ng thể n&amp;agrave;o cảm nhận được kh&amp;ocirc;ng gian b&amp;ecirc;n ngo&amp;agrave;i như vật liệu k&amp;iacute;nh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;2. Vệ sinh dễ d&amp;agrave;ng&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với những lan can cầu thang ngo&amp;agrave;i trời ch&amp;uacute;ng rất dễ bị b&amp;aacute;m nhiều bụi bẩn nếu l&amp;agrave; c&amp;aacute;c vật liệu kh&amp;aacute;c sẽ dễ bị hư hỏng, oxy h&amp;oacute;a v&amp;agrave; kh&amp;oacute; khăn cho việc vệ sinh. Nhưng với chất liệu k&amp;iacute;nh việc vệ sinh trở n&amp;ecirc;n dễ d&amp;agrave;ng hơn rất nhiều v&amp;agrave; mang đến vẻ đẹp, sự s&amp;aacute;ng b&amp;oacute;ng cho ng&amp;ocirc;i nh&amp;agrave;.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;4. Bền đẹp&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Chất liệu k&amp;iacute;nh cường lực c&amp;oacute; độ bền rất cao, khả năng chịu t&amp;aacute;c động lớn n&amp;ecirc;n khi sử dụng để l&amp;agrave;m lan can quả thật l&amp;agrave; một lựa chọn ho&amp;agrave;n hảo. Bạn sẽ kh&amp;ocirc;ng phải tốn k&amp;eacute;m chi ph&amp;iacute; sửa chữa ch&amp;uacute;ng v&amp;igrave; tuổi thọ c&amp;oacute; thể k&amp;eacute;o d&amp;agrave;i đến v&amp;agrave;i chục năm.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;5. Kh&amp;ocirc;ng bị ảnh hưởng bởi thời tiết&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Nếu như một số vật liệu như gỗ, inox, sắt th&amp;eacute;p c&amp;oacute; thể bị hư hỏng nếu như thời tiết kh&amp;iacute; hậu kh&amp;ocirc;ng thuận lợi th&amp;igrave; lan can bằng k&amp;iacute;nh cường lực c&amp;oacute; thể vượt qua những điều ấy một c&amp;aacute;ch tốt nhất. N&amp;oacute; vẫn giữ được độ bền, sự chắc chắn của m&amp;igrave;nh trước thời tiết. D&amp;ugrave; nắng n&amp;oacute;ng, mưa bụi cũng kh&amp;ocirc;ng l&amp;agrave;m ảnh đến chất lượng v&amp;agrave; tuổi thọ k&amp;iacute;nh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;6. Ph&amp;ugrave; hợp với diện t&amp;iacute;ch nhỏ&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng cầu thang k&amp;iacute;nh cường lực v&amp;agrave; cả lan can l&amp;agrave;m bằng k&amp;iacute;nh sẽ rất ph&amp;ugrave; hợp với những căn hộ c&amp;oacute; diện t&amp;iacute;ch nhỏ v&amp;agrave; n&amp;oacute; gi&amp;uacute;p kh&amp;ocirc;ng gian thanh tho&amp;aacute;t, ấn tượng hơn. Nhờ khả năng phản chiếu &amp;aacute;nh s&amp;aacute;ng n&amp;ecirc;n kh&amp;ocirc;ng gian trong nh&amp;agrave; sẽ s&amp;aacute;ng v&amp;agrave; tho&amp;aacute;ng hơn rất nhiều.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;7. T&amp;iacute;nh thẩm mỹ cao&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sự an to&amp;agrave;n của lan can k&amp;iacute;nh lu&amp;ocirc;n được đặt l&amp;ecirc;n h&amp;agrave;ng đầu nhưng t&amp;iacute;nh thẩm mỹ của sản phẩm vẫn được ch&amp;uacute; trọng nhiều. Một chiếc lan can bằng k&amp;iacute;nh sẽ g&amp;oacute;p phần l&amp;agrave;m đẹp hơn cho ng&amp;ocirc;i nh&amp;agrave; của bạn cũng như tăng th&amp;ecirc;m gi&amp;aacute; trị cho kh&amp;ocirc;ng gian&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;p&gt;K&amp;iacute;nh : Cường Lực 8mm &amp;ndash; 12mm&lt;/p&gt;

&lt;p&gt;K&amp;iacute;ch thước: theo y&amp;ecirc;u cầu&lt;/p&gt;

&lt;p&gt;Thiết kế theo mẫu c&amp;oacute; sẵn hoặc theo &amp;yacute; tưởng của kh&amp;aacute;ch h&amp;agrave;ng&lt;/p&gt;
', 1, CAST(N'2020-06-27 17:51:25.117' AS DateTime), NULL, NULL, NULL, NULL, N'lan-can-kinh-cau-thang-tru-go', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (27, NULL, N'LAN CAN KÍNH CẦU THANG TAY VỊN GỖ', N'Những tấm kính cường lực với độ bền chắc hiện nay không chỉ xuất hiện trong các tòa nhà cao tầng mà dần được người dân sử dụng nhiều hơn để thiết kế nội thất cho ngôi nhà của mình.', N'~/Upload/Product/27055320lancantayvingo1.jpg', N'<Images><Image>~/Upload/Product/27055320lancantayvingo1.jpg</Image><Image>~/Upload/Product/27055320lancantayvingo2.jpg</Image><Image>~/Upload/Product/27055320lancantayvingo3.jpg</Image></Images>', 14, N'&lt;h1&gt;&lt;strong&gt;Lợi &amp;iacute;ch khi sử dụng lan canh k&amp;iacute;nh:&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;1. Kh&amp;ocirc;ng gian sống trở n&amp;ecirc;n rộng r&amp;atilde;i v&amp;agrave; thoải m&amp;aacute;i hơn&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Ưu điểm nổi bật của hầu hết mọi loại k&amp;iacute;nh l&amp;agrave; n&amp;oacute; mang đến sự rộng r&amp;atilde;i v&amp;agrave; v&amp;agrave; tho&amp;aacute;ng cho kh&amp;ocirc;ng gian. Việc sử dụng k&amp;iacute;nh cường lực để l&amp;agrave;m lan can cũng sẽ mang đến cho bạn những kh&amp;ocirc;ng gian rộng v&amp;agrave; hết sức th&amp;ocirc;ng tho&amp;aacute;ng. Nếu sử dụng sắt, inox hay nh&amp;ocirc;m l&amp;agrave;m lan can chắc hẳn bạn sẽ kh&amp;ocirc;ng thể n&amp;agrave;o cảm nhận được kh&amp;ocirc;ng gian b&amp;ecirc;n ngo&amp;agrave;i như vật liệu k&amp;iacute;nh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;2. Vệ sinh dễ d&amp;agrave;ng&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với những lan can cầu thang ngo&amp;agrave;i trời ch&amp;uacute;ng rất dễ bị b&amp;aacute;m nhiều bụi bẩn nếu l&amp;agrave; c&amp;aacute;c vật liệu kh&amp;aacute;c sẽ dễ bị hư hỏng, oxy h&amp;oacute;a v&amp;agrave; kh&amp;oacute; khăn cho việc vệ sinh. Nhưng với chất liệu k&amp;iacute;nh việc vệ sinh trở n&amp;ecirc;n dễ d&amp;agrave;ng hơn rất nhiều v&amp;agrave; mang đến vẻ đẹp, sự s&amp;aacute;ng b&amp;oacute;ng cho ng&amp;ocirc;i nh&amp;agrave;.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;4. Bền đẹp&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Chất liệu k&amp;iacute;nh cường lực c&amp;oacute; độ bền rất cao, khả năng chịu t&amp;aacute;c động lớn n&amp;ecirc;n khi sử dụng để l&amp;agrave;m lan can quả thật l&amp;agrave; một lựa chọn ho&amp;agrave;n hảo. Bạn sẽ kh&amp;ocirc;ng phải tốn k&amp;eacute;m chi ph&amp;iacute; sửa chữa ch&amp;uacute;ng v&amp;igrave; tuổi thọ c&amp;oacute; thể k&amp;eacute;o d&amp;agrave;i đến v&amp;agrave;i chục năm.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;5. Kh&amp;ocirc;ng bị ảnh hưởng bởi thời tiết&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Nếu như một số vật liệu như gỗ, inox, sắt th&amp;eacute;p c&amp;oacute; thể bị hư hỏng nếu như thời tiết kh&amp;iacute; hậu kh&amp;ocirc;ng thuận lợi th&amp;igrave; lan can bằng k&amp;iacute;nh cường lực c&amp;oacute; thể vượt qua những điều ấy một c&amp;aacute;ch tốt nhất. N&amp;oacute; vẫn giữ được độ bền, sự chắc chắn của m&amp;igrave;nh trước thời tiết. D&amp;ugrave; nắng n&amp;oacute;ng, mưa bụi cũng kh&amp;ocirc;ng l&amp;agrave;m ảnh đến chất lượng v&amp;agrave; tuổi thọ k&amp;iacute;nh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;6. Ph&amp;ugrave; hợp với diện t&amp;iacute;ch nhỏ&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng cầu thang k&amp;iacute;nh cường lực v&amp;agrave; cả lan can l&amp;agrave;m bằng k&amp;iacute;nh sẽ rất ph&amp;ugrave; hợp với những căn hộ c&amp;oacute; diện t&amp;iacute;ch nhỏ v&amp;agrave; n&amp;oacute; gi&amp;uacute;p kh&amp;ocirc;ng gian thanh tho&amp;aacute;t, ấn tượng hơn. Nhờ khả năng phản chiếu &amp;aacute;nh s&amp;aacute;ng n&amp;ecirc;n kh&amp;ocirc;ng gian trong nh&amp;agrave; sẽ s&amp;aacute;ng v&amp;agrave; tho&amp;aacute;ng hơn rất nhiều.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;7. T&amp;iacute;nh thẩm mỹ cao&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sự an to&amp;agrave;n của lan can k&amp;iacute;nh lu&amp;ocirc;n được đặt l&amp;ecirc;n h&amp;agrave;ng đầu nhưng t&amp;iacute;nh thẩm mỹ của sản phẩm vẫn được ch&amp;uacute; trọng nhiều. Một chiếc lan can bằng k&amp;iacute;nh sẽ g&amp;oacute;p phần l&amp;agrave;m đẹp hơn cho ng&amp;ocirc;i nh&amp;agrave; của bạn cũng như tăng th&amp;ecirc;m gi&amp;aacute; trị cho kh&amp;ocirc;ng gian&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;p&gt;K&amp;iacute;nh : Cường Lực 8mm &amp;ndash; 12mm&lt;/p&gt;

&lt;p&gt;K&amp;iacute;ch thước: theo y&amp;ecirc;u cầu&lt;/p&gt;

&lt;p&gt;Thiết kế theo mẫu c&amp;oacute; sẵn hoặc theo &amp;yacute; tưởng của kh&amp;aacute;ch h&amp;agrave;ng.&lt;/p&gt;
', 1, CAST(N'2020-06-27 17:53:20.197' AS DateTime), NULL, CAST(N'2020-06-30 17:24:37.900' AS DateTime), NULL, NULL, N'lan-can-kinh-cau-thang-tay-vin-go', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (28, NULL, N'CỬA ĐI MỞ QUAY NHÔM PMA', N'Nhôm PMA được nhập khẩu từ Trung Quốc chỉ có một hệ duy nhất là hệ 55, thanh nhôm định hình có độ dày từ 1.2 – 1.4mm.  Mặc dù chỉ có duy nhẩt một hệ 55, song được chia ra thành nhiều thanh profile có cấu tạo mặt cắt nhôm khác nhau, mục đích để quy định các kiểu thiết kế cửa sao cho phù hợp ví dụ như cửa đi mở quay, mở lùa, cửa sổ mở quay, mở hất và mở lùa.', N'~/Upload/Product/27055516cuanhomquaymo1.jpg', N'<Images><Image>~/Upload/Product/27055516cuanhomquaymo1.jpg</Image><Image>~/Upload/Product/27055516cuanhomquaymo2.jpg</Image></Images>', 15, N'&lt;h1&gt;&lt;strong&gt;Ưu điểm nổi bật cửa nh&amp;ocirc;m PMA&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Nh&amp;ocirc;m PMA&amp;nbsp;chỉ c&amp;oacute; một hệ duy nhất l&amp;agrave; hệ 55, độ d&amp;agrave;y thanh nh&amp;ocirc;m từ 1.2 &amp;ndash; 1.4mm, thanh nh&amp;ocirc;m c&amp;oacute; c&amp;aacute;c&amp;nbsp;&amp;nbsp;&amp;nbsp; g&amp;acirc;n trợ lực tăng khả năng chống m&amp;oacute;c m&amp;eacute;o bởi ngoại lực t&amp;aacute;c động từ b&amp;ecirc;n ngo&amp;agrave;i.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đặc biệt khung bao cửa sổ mở quay, mở hất d&amp;ugrave;ng được chung lu&amp;ocirc;n cho khung bao cửa đi mở quay, c&amp;aacute;ch cửa mở l&amp;ugrave;a chỉ c&amp;oacute; 1 thanh duy nhất kh&amp;ocirc;ng cần nhiều thanh như nh&amp;ocirc;m xingfa n&amp;ecirc;n DC nh&amp;ocirc;m dư thừa l&amp;agrave; &amp;iacute;t nhất.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Do được l&amp;agrave;m từ khung nh&amp;ocirc;m v&amp;agrave; k&amp;iacute;nh n&amp;ecirc;n kh&amp;ocirc;ng bị cong v&amp;ecirc;nh, mối mọt, hoen gỉ như cửa gỗ, cửa sắt.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng c&amp;ocirc;ng nghệ sơn tĩnh điện cao cấp c&amp;oacute; khả năng chống trầy xước v&amp;agrave; b&amp;aacute;m bụi, kh&amp;ocirc;ng bị oxi h&amp;oacute;a.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Ngo&amp;agrave;i m&amp;agrave;u trắng sứ, qu&amp;yacute; kh&amp;aacute;ch c&amp;oacute; thể lựa chọn c&amp;aacute;c m&amp;agrave;u sắc kh&amp;aacute;c như m&amp;agrave;u ghi, m&amp;agrave;u n&amp;acirc;u c&amp;aacute;t, m&amp;agrave;u v&amp;acirc;n gỗ sao cho ph&amp;ugrave; hợp với m&amp;agrave;u sắc kh&amp;ocirc;ng gian của ng&amp;ocirc;i nh&amp;agrave;.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Kiểu d&amp;aacute;ng sang trọng, phong c&amp;aacute;ch hiện đại, ph&amp;ugrave; hợp với nhiều kiểu kiến tr&amp;uacute;c kh&amp;aacute;c nhau như biệt thự, chung cư, nh&amp;agrave; tầng,&amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;Độ d&amp;agrave;y: 1.2 &amp;ndash; 1.4mm&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh : Cường Lực 8mm-12mm&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;M&amp;agrave;u sắc: Trắng, Ghi, N&amp;acirc;u, V&amp;acirc;n Gỗ&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Phụ kiện : PMA&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Bảo h&amp;agrave;nh nh&amp;ocirc;m 10 năm bền m&amp;agrave;u&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:55:16.433' AS DateTime), NULL, NULL, NULL, NULL, N'cua-di-mo-quay-nhom-pma', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (29, NULL, N'CỬA SỔ HẤT NHÔM PMA', N'Nhôm PMA được nhập khẩu từ Trung Quốc chỉ có một hệ duy nhất là hệ 55, thanh nhôm định hình có độ dày từ 1.2 – 1.4mm.  Mặc dù chỉ có duy nhẩt một hệ 55, song được chia ra thành nhiều thanh profile có cấu tạo mặt cắt nhôm khác nhau, mục đích để quy định các kiểu thiết kế cửa sao cho phù hợp ví dụ như cửa đi mở quay, mở lùa, cửa sổ mở quay, mở hất và mở lùa.', N'~/Upload/Product/27055653cuapma1.jpg', N'<Images><Image>~/Upload/Product/27055653cuapma1.jpg</Image><Image>~/Upload/Product/27055653cuapma2.jpg</Image><Image>~/Upload/Product/27055653cuapma3.jpg</Image></Images>', 15, N'&lt;h1&gt;&lt;strong&gt;Ưu điểm nổi bật cửa nh&amp;ocirc;m PMA&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Nh&amp;ocirc;m PMA&amp;nbsp;chỉ c&amp;oacute; một hệ duy nhất l&amp;agrave; hệ 55, độ d&amp;agrave;y thanh nh&amp;ocirc;m từ 1.2 &amp;ndash; 1.4mm, thanh nh&amp;ocirc;m c&amp;oacute; c&amp;aacute;c&amp;nbsp;&amp;nbsp;&amp;nbsp; g&amp;acirc;n trợ lực tăng khả năng chống m&amp;oacute;c m&amp;eacute;o bởi ngoại lực t&amp;aacute;c động từ b&amp;ecirc;n ngo&amp;agrave;i.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đặc biệt khung bao cửa sổ mở quay, mở hất d&amp;ugrave;ng được chung lu&amp;ocirc;n cho khung bao cửa đi mở quay, c&amp;aacute;ch cửa mở l&amp;ugrave;a chỉ c&amp;oacute; 1 thanh duy nhất kh&amp;ocirc;ng cần nhiều thanh như nh&amp;ocirc;m xingfa n&amp;ecirc;n DC nh&amp;ocirc;m dư thừa l&amp;agrave; &amp;iacute;t nhất.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Do được l&amp;agrave;m từ khung nh&amp;ocirc;m v&amp;agrave; k&amp;iacute;nh n&amp;ecirc;n kh&amp;ocirc;ng bị cong v&amp;ecirc;nh, mối mọt, hoen gỉ như cửa gỗ, cửa sắt.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng c&amp;ocirc;ng nghệ sơn tĩnh điện cao cấp c&amp;oacute; khả năng chống trầy xước v&amp;agrave; b&amp;aacute;m bụi, kh&amp;ocirc;ng bị oxi h&amp;oacute;a.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Ngo&amp;agrave;i m&amp;agrave;u trắng sứ, qu&amp;yacute; kh&amp;aacute;ch c&amp;oacute; thể lựa chọn c&amp;aacute;c m&amp;agrave;u sắc kh&amp;aacute;c như m&amp;agrave;u ghi, m&amp;agrave;u n&amp;acirc;u c&amp;aacute;t, m&amp;agrave;u v&amp;acirc;n gỗ sao cho ph&amp;ugrave; hợp với m&amp;agrave;u sắc kh&amp;ocirc;ng gian của ng&amp;ocirc;i nh&amp;agrave;.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Kiểu d&amp;aacute;ng sang trọng, phong c&amp;aacute;ch hiện đại, ph&amp;ugrave; hợp với nhiều kiểu kiến tr&amp;uacute;c kh&amp;aacute;c nhau như biệt thự, chung cư, nh&amp;agrave; tầng,&amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;Độ d&amp;agrave;y: 1.2 &amp;ndash; 1.4mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm-12mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng, Ghi, N&amp;acirc;u, V&amp;acirc;n Gỗ&lt;/li&gt;
	&lt;li&gt;Phụ kiện : PMA&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh nh&amp;ocirc;m 10 năm bền m&amp;agrave;u&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:56:53.377' AS DateTime), NULL, NULL, NULL, NULL, N'cua-so-hat-nhom-pma', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (30, NULL, N'CỬA MỞ TRƯỢT NHÔM PMA', N'Nhôm PMA được nhập khẩu từ Trung Quốc chỉ có một hệ duy nhất là hệ 55, thanh nhôm định hình có độ dày từ 1.2 – 1.4mm.  Mặc dù chỉ có duy nhẩt một hệ 55, song được chia ra thành nhiều thanh profile có cấu tạo mặt cắt nhôm khác nhau, mục đích để quy định các kiểu thiết kế cửa sao cho phù hợp ví dụ như cửa đi mở quay, mở lùa, cửa sổ mở quay, mở hất và mở lùa.', N'~/Upload/Product/27055846cuamotruotpma.jpg', N'<Images><Image>~/Upload/Product/27055846cuamotruotpma.jpg</Image><Image>~/Upload/Product/27055846cuamotruotpma2.jpg</Image><Image>~/Upload/Product/27055846cuamotruotpma3.jpg</Image></Images>', 15, N'&lt;h1&gt;&lt;strong&gt;Ưu điểm nổi bật cửa nh&amp;ocirc;m PMA&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Nh&amp;ocirc;m PMA&amp;nbsp;chỉ c&amp;oacute; một hệ duy nhất l&amp;agrave; hệ 55, độ d&amp;agrave;y thanh nh&amp;ocirc;m từ 1.2 &amp;ndash; 1.4mm, thanh nh&amp;ocirc;m c&amp;oacute; c&amp;aacute;c&amp;nbsp;&amp;nbsp;&amp;nbsp; g&amp;acirc;n trợ lực tăng khả năng chống m&amp;oacute;c m&amp;eacute;o bởi ngoại lực t&amp;aacute;c động từ b&amp;ecirc;n ngo&amp;agrave;i.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đặc biệt khung bao cửa sổ mở quay, mở hất d&amp;ugrave;ng được chung lu&amp;ocirc;n cho khung bao cửa đi mở quay, c&amp;aacute;ch cửa mở l&amp;ugrave;a chỉ c&amp;oacute; 1 thanh duy nhất kh&amp;ocirc;ng cần nhiều thanh như nh&amp;ocirc;m xingfa n&amp;ecirc;n DC nh&amp;ocirc;m dư thừa l&amp;agrave; &amp;iacute;t nhất.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Do được l&amp;agrave;m từ khung nh&amp;ocirc;m v&amp;agrave; k&amp;iacute;nh n&amp;ecirc;n kh&amp;ocirc;ng bị cong v&amp;ecirc;nh, mối mọt, hoen gỉ như cửa gỗ, cửa sắt.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng c&amp;ocirc;ng nghệ sơn tĩnh điện cao cấp c&amp;oacute; khả năng chống trầy xước v&amp;agrave; b&amp;aacute;m bụi, kh&amp;ocirc;ng bị oxi h&amp;oacute;a.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Ngo&amp;agrave;i m&amp;agrave;u trắng sứ, qu&amp;yacute; kh&amp;aacute;ch c&amp;oacute; thể lựa chọn c&amp;aacute;c m&amp;agrave;u sắc kh&amp;aacute;c như m&amp;agrave;u ghi, m&amp;agrave;u n&amp;acirc;u c&amp;aacute;t, m&amp;agrave;u v&amp;acirc;n gỗ sao cho ph&amp;ugrave; hợp với m&amp;agrave;u sắc kh&amp;ocirc;ng gian của ng&amp;ocirc;i nh&amp;agrave;.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Kiểu d&amp;aacute;ng sang trọng, phong c&amp;aacute;ch hiện đại, ph&amp;ugrave; hợp với nhiều kiểu kiến tr&amp;uacute;c kh&amp;aacute;c nhau như biệt thự, chung cư, nh&amp;agrave; tầng,&amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;Độ d&amp;agrave;y: 1.2 &amp;ndash; 1.4mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm-12mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng, Ghi, N&amp;acirc;u, V&amp;acirc;n Gỗ&lt;/li&gt;
	&lt;li&gt;Phụ kiện : PMA&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh nh&amp;ocirc;m 10 năm bền m&amp;agrave;u&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 17:58:46.693' AS DateTime), NULL, NULL, NULL, NULL, N'cua-mo-truot-nhom-pma', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (31, NULL, N'VÁCH KÍNH PHÒNG HỌP', N'Với cuộc sống ngày càng hiện đại, các vật liệu xây dựng cũ đã không còn chiếm lợi thế như xưa. Thay vì sử dụng xi măng, gỗ và các vật liệu xây dựng thông thường vào các công trình thi công nhà cửa, căn hộ thì nay kính cường lực đã chiếm ưu thế nhiều trong thị trường xây dựng. Kính cường lực mang lại vẻ đẹp hiện đại, sang trọng và giúp cho không gian ngôi nhà rộng rãi hơn.', N'~/Upload/Product/27060038vachkinh_1.jpg', N'<Images><Image>~/Upload/Product/27060038vachkinh11.jpg</Image><Image>~/Upload/Product/27060038vachkinh12.jpg</Image><Image>~/Upload/Product/27060038vachkinh13.jpg</Image></Images>', 16, N'&lt;h1&gt;&lt;strong&gt;Những lợi &amp;iacute;ch của k&amp;iacute;nh cường lực mang lại&lt;/strong&gt;&lt;/h1&gt;

&lt;h3&gt;&lt;strong&gt;1. Sử dụng được hầu hết c&amp;aacute;c vị tr&amp;iacute;&amp;nbsp;&lt;/strong&gt;&lt;/h3&gt;

&lt;p&gt;&lt;strong&gt;K&amp;iacute;nh cường lực c&amp;oacute; thiết kế ph&amp;ugrave; hợp với hầu hết tất cả c&amp;aacute;c vị tr&amp;iacute; trong khu vực l&amp;agrave;m việc của bạn, nhằm tạo sự ri&amp;ecirc;ng tư như: v&amp;aacute;ch ngăn, cầu thang, giếng trời, ốp tường bếp, v&amp;aacute;ch ngăn ph&amp;ograve;ng ngủ, lan can, b&amp;agrave;n k&amp;iacute;nh cường lực,... đều đảm bảo sự an to&amp;agrave;n v&amp;agrave; mang lại vẻ đẹp hiện đại.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;D&amp;ugrave;ng vật liệu k&amp;iacute;nh thay cho c&amp;aacute;c khối b&amp;ecirc; t&amp;ocirc;ng đang l&amp;agrave; xu hướng tất yếu của cuộc sống hiện đại, tạo cho nơi ở, kh&amp;ocirc;ng gian sống đỡ cứng nhắc, đ&amp;oacute;ng khung song vừa đẹp, lại c&amp;oacute; lợi cho sức khỏe.&lt;/strong&gt;&lt;/p&gt;

&lt;h3&gt;&lt;strong&gt;2. Độ bền với thời gian v&amp;agrave; an to&amp;agrave;n khi sử dụng&lt;/strong&gt;&lt;/h3&gt;

&lt;p&gt;&lt;strong&gt;Được l&amp;agrave;m từ loại k&amp;iacute;nh nung luyện dưới nhiệt độ l&amp;ecirc;n đến 650 độ C, vậy n&amp;ecirc;n cửa k&amp;iacute;nh cường lực c&amp;oacute; khả năng chịu đựng gấp 4 đến 5 lần so với c&amp;aacute;c loại k&amp;iacute;nh th&amp;ocirc;ng thường c&amp;oacute; độ d&amp;agrave;y tương đương. Sở dĩ k&amp;iacute;nh cường lực c&amp;oacute; độ bền như vậy l&amp;agrave; do ứng suất l&amp;ecirc;n bề mặt k&amp;iacute;nh được &amp;eacute;p lại l&amp;agrave;m cho mạch li&amp;ecirc;n kết cực nhỏ kết hợp với nhau để tạo th&amp;agrave;nh li&amp;ecirc;n kết vững chắc hơn, n&amp;oacute; gi&amp;uacute;p k&amp;iacute;nh chịu được rung chấn, sức gi&amp;oacute; lớn v&amp;agrave; va đập mạnh.&lt;/strong&gt;&lt;/p&gt;

&lt;h3&gt;&lt;strong&gt;3. T&amp;iacute;nh thẩm mỹ cao&lt;/strong&gt;&lt;/h3&gt;

&lt;p&gt;&lt;strong&gt;Sự ph&amp;aacute;t triển mạnh mẽ của khoa học c&amp;ocirc;ng nghệ kh&amp;ocirc;ng chỉ khắc phục được ho&amp;agrave;n to&amp;agrave;n những e ngại về sự mong manh của vật liệu k&amp;iacute;nh trước kia, m&amp;agrave; c&amp;ograve;n ph&amp;aacute;t triển k&amp;iacute;nh l&amp;ecirc;n đẳng cấp mới với loại k&amp;iacute;nh cường lực c&amp;oacute; độ bền vững cao, c&amp;oacute; khả năng c&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt hiệu quả. K&amp;iacute;nh cường lực giờ đ&amp;acirc;y lu&amp;ocirc;n được c&amp;aacute;c kiến tr&amp;uacute;c sư lựa chọn như một giải ph&amp;aacute;p tối ưu, để l&amp;agrave;m tăng gi&amp;aacute; trị thẩm mỹ v&amp;agrave; hiệu quả c&amp;ocirc;ng năng cho c&amp;ocirc;ng tr&amp;igrave;nh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;K&amp;iacute;nh cường lực kết hợp c&amp;ugrave;ng những mẫu cửa nh&amp;ocirc;m k&amp;iacute;nh tấm lớn hiện đại đang dần thế chỗ những bức tường gạch nặng nề trong c&amp;aacute;c c&amp;ocirc;ng tr&amp;igrave;nh kiến tr&amp;uacute;c d&amp;acirc;n dụng v&amp;agrave; v&amp;ocirc; c&amp;ugrave;ng th&amp;iacute;ch hợp cho văn ph&amp;ograve;ng, ph&amp;ograve;ng họp v&amp;agrave; c&amp;aacute;c khu vực c&amp;ocirc;ng sở.&lt;/strong&gt;&lt;/p&gt;

&lt;h3&gt;&lt;strong&gt;4. Dễ d&amp;agrave;ng vệ sinh v&amp;agrave; sửa chữa&lt;/strong&gt;&lt;/h3&gt;

&lt;p&gt;&lt;strong&gt;Nếu v&amp;ocirc; t&amp;igrave;nh &amp;ocirc; cửa n&amp;agrave;o đ&amp;oacute; bị vỡ th&amp;igrave; bạn cũng dễ d&amp;agrave;ng sửa chữa n&amp;oacute; bằng c&amp;aacute;ch thay &amp;ocirc; cửa đ&amp;oacute; m&amp;agrave; kh&amp;ocirc;ng cần phải thay to&amp;agrave;n bộ. Ngo&amp;agrave;i ra để thay đổi m&amp;agrave;u sắc cửa k&amp;iacute;nh bạn c&amp;oacute; thể sơn sửa ch&amp;uacute;ng lại để kh&amp;ocirc;ng gian được mới hơn.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Do thiết kế l&amp;agrave; k&amp;iacute;nh n&amp;ecirc;n khối lượng của k&amp;iacute;nh cường lực cũng kh&amp;aacute; tương đối, kh&amp;ocirc;ng nặng như cửa gỗ hay cửa sắt, v&amp;igrave; vậy khi lắp đặt, sửa chữa thay thế cửa cũng kh&amp;aacute; tiện lợi v&amp;agrave; kh&amp;ocirc;ng mất nhiều c&amp;ocirc;ng sức.&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;V&amp;aacute;ch k&amp;iacute;nh cường lực&lt;/li&gt;
	&lt;li&gt;V&amp;aacute;ch k&amp;iacute;nh nh&amp;ocirc;m&lt;/li&gt;
	&lt;li&gt;V&amp;aacute;ch k&amp;iacute;nh nhựa&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;nh: Cường lực 8mm &amp;ndash; 12mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;ch thước: theo y&amp;ecirc;u cầu&lt;/li&gt;
	&lt;li&gt;Thiết kế theo mẫu c&amp;oacute; sẵn hoặc theo &amp;yacute; tưởng của kh&amp;aacute;ch h&amp;agrave;ng&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 18:00:38.370' AS DateTime), NULL, NULL, NULL, NULL, N'vach-kinh-phong-hop', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (32, NULL, N'VÁCH KÍNH NHỰA', N'Sản phẩm cửa uPVC (hay còn gọi là cửa nhựa lõi thép gia cường) tuy mới ra đời ở các nước châu Âu khoảng 60 năm trước đây nhưng đã chiếm hơn 60% thị phần cửa ở những quốc gia này. Hiện nay, sản phẩm cửa uPVC đã được sử dụng rộng rãi ở nhiều nước trên thế giới. Tại Việt Nam hiện nay, cửa nhựa uPVC đang trở nên thông dụng và được nhiều khách hàng quan tâm tìm hiểu và sử dụng.', N'~/Upload/Product/27060153vachkinhnhua.jpg', N'<Images><Image>~/Upload/Product/27060153vachkinh12.jpg</Image><Image>~/Upload/Product/27060153vachkinh13.jpg</Image><Image>~/Upload/Product/27060153vachkinhnhua.jpg</Image></Images>', 16, N'&lt;h2&gt;&lt;strong&gt;Ưu điểm của cửa nhựa UPVC.&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;1. C&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt tốt:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Căn ph&amp;ograve;ng nằm s&amp;aacute;t trục đường giao th&amp;ocirc;ng, nơi c&amp;oacute; cường độ tiếng ồn b&amp;ecirc;n ngo&amp;agrave;i l&amp;ecirc;n đến 85 dB, song nhờ cửa nhựa uPVC c&amp;oacute; độ c&amp;aacute;ch &amp;acirc;m tốt n&amp;ecirc;n cường độ tiếng ồn trong ph&amp;ograve;ng chỉ c&amp;ograve;n khoảng 40 - 45 dB.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đi k&amp;egrave;m với khả năng c&amp;aacute;ch &amp;acirc;m gi&amp;uacute;p n&amp;acirc;ng cao chất lượng cuộc sống, cửa nhựa uPVC c&amp;ograve;n c&amp;oacute; khả năng c&amp;aacute;ch nhiệt gấp từ 2 - 4 lần so với c&amp;aacute;c loại cửa th&amp;ocirc;ng thường, gi&amp;uacute;p tiết kiệm điện năng sưởi ấm v&amp;agrave; l&amp;agrave;m m&amp;aacute;t căn ph&amp;ograve;ng, mang lại hiệu quả kinh tế cao cho người sử dụng.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;2. T&amp;iacute;nh ổn định cao, kh&amp;ocirc;ng cong v&amp;ecirc;nh, co ng&amp;oacute;t:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Lu&amp;ocirc;n bền bỉ trước kh&amp;iacute; hậu nhiệt đới n&amp;oacute;ng, ẩm, mưa nhiều&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Đặc t&amp;iacute;nh qu&amp;yacute; b&amp;aacute;u nổi bật của vật liệu uPVC l&amp;agrave; tuổi thọ rất cao do vật liệu n&amp;agrave;y kh&amp;ocirc;ng bị &amp;ocirc;xy h&amp;oacute;a, kh&amp;ocirc;ng bị l&amp;atilde;o h&amp;oacute;a hay ố v&amp;agrave;ng trong điều kiện bức xạ mặt trời v&amp;agrave; mưa axit.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Việc sử dụng c&amp;aacute;c chất phụ gia (Additives) v&amp;agrave; chất ổn định (Stabilizers) trong c&amp;ocirc;ng thức phối liệu đ&amp;atilde; tạo ra sự th&amp;iacute;ch ứng của vật liệu trong điều kiện nhiệt độ v&amp;agrave; độ ẩm cao.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;3. Chống ch&amp;aacute;y:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với nhiệt độ gần 100oC của đ&amp;egrave;n kh&amp;ograve;, thanh uPVC chỉ biến dạng m&amp;agrave; kh&amp;ocirc;ng b&amp;eacute;n ch&amp;aacute;y, loại bỏ hẳn qu&amp;aacute; tr&amp;igrave;nh ngọn lửa ph&amp;aacute;t t&amp;aacute;n qua cửa.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;4. Hiệu quả kinh tế cao trong qu&amp;aacute; tr&amp;igrave;nh sử dụng:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cửa nhựa uPVC c&amp;aacute;ch &amp;acirc;m, c&amp;aacute;ch nhiệt, kh&amp;ocirc;ng đ&amp;ograve;i hỏi tu bổ định kỳ, duy tr&amp;igrave; chất lượng sử dụng cao trong thời gian h&amp;agrave;ng chục năm&amp;hellip; Hơn thế nữa, cửa uPVC gi&amp;uacute;p hạn chế sự truyền nhiệt, điều đ&amp;oacute; đồng nghĩa với việc tiết kiệm điện năng để l&amp;agrave;m m&amp;aacute;t hoặc sưởi ấm căn ph&amp;ograve;ng. Chỉ sau v&amp;agrave;i năm sử dụng, cửa sổ từ uPVC sẽ b&amp;ugrave; đắp lại to&amp;agrave;n bộ chi ph&amp;iacute; đầu tư ban đầu.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;So với một số loại cửa th&amp;ocirc;ng thường, chi ph&amp;iacute; đầu tư ban đầu cho cửa uPVC cao hơn, song theo thời gian, hiệu quả kinh tế nhờ tiết kiệm chi ph&amp;iacute; ph&amp;aacute;t sinh trong qu&amp;aacute; tr&amp;igrave;nh sử dụng m&amp;agrave; cửa uPVC đem lại sẽ ng&amp;agrave;y c&amp;agrave;ng được thể hiện r&amp;otilde; rệt hơn.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Những ưu điểm ri&amp;ecirc;ng kh&amp;aacute;c như t&amp;iacute;nh tiện dụng của bộ phụ kiện kim kh&amp;iacute;, c&amp;aacute;nh cửa&amp;nbsp;đ&amp;oacute;ng kh&amp;iacute;t v&amp;agrave; ổn định, cửa&amp;nbsp;kh&amp;ocirc;ng cong v&amp;ecirc;nh hoặc co d&amp;atilde;n, bề mặt khung cửa&amp;nbsp;giữ m&amp;agrave;u sắc tươi mới như ban đầu&amp;hellip;cũng l&amp;agrave; những luận cứ kh&amp;aacute;ch quan khẳng định t&amp;iacute;nh kinh tế trước mắt cũng như l&amp;acirc;u d&amp;agrave;i của việc lựa chọn cửa sổ từ thanh profile định h&amp;igrave;nh uPVC.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;5. Đa dạng k&amp;iacute;ch thước, kiểu d&amp;aacute;ng:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cửa nhựa uPVC ph&amp;ugrave; hợp với mọi kiểu kiến tr&amp;uacute;c: T&amp;ograve;a nh&amp;agrave;, biệt thự, văn ph&amp;ograve;ng, nh&amp;agrave; ở,&amp;hellip;&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với của nhựa uPVC bạn c&amp;oacute; thể lựa chọn kiểu d&amp;aacute;ng sản phẩm ph&amp;ugrave; hợp với nhu cầu sử dụng v&amp;agrave; tiết kiệm kh&amp;ocirc;ng gian, tiện lợi trong sử dụng.&lt;/strong&gt;&lt;/p&gt;

&lt;h2&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 8mm -12mm&lt;/li&gt;
	&lt;li&gt;L&amp;otilde;i Th&amp;eacute;p : 1,2mm - 1,5mm&lt;/li&gt;
	&lt;li&gt;M&amp;agrave;u sắc: Trắng&lt;/li&gt;
	&lt;li&gt;Phụ Kiện GQ&lt;/li&gt;
	&lt;li&gt;Bảo h&amp;agrave;nh phụ kiện 3 năm thay mới&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 18:01:53.900' AS DateTime), NULL, NULL, NULL, NULL, N'vach-kinh-nhua', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (33, NULL, N'VÁCH KÍNH NHÀ TẮM', N'Với sự phát triển kinh tế hiện nay, thì những gia chủ ngày càng muốn có sự độc đáo hơn trong căn nhà của mình. Và kính cường lực đã nổi lên như là một trong những thiết kế nổi bật nhất. Sự sang trọng và độc đáo của chúng đã thu hút được nhiều người tiêu dùng. Với sự xuất hiện của dòng sản phẩm vách kính cường lực, đây hiện đang là sự lựa chọn hàng đầu của các công trình nhà ở, chung cư v..v... khi muốn thay đổi diện mạo cho căn phòng tắm.', N'~/Upload/Product/27060320vachkinhtam1.jpg', N'<Images><Image>~/Upload/Product/27060320vachkinhtam1.jpg</Image><Image>~/Upload/Product/27060320vachkinhtam2.jpg</Image><Image>~/Upload/Product/27060320vachkinhtam3.jpg</Image><Image>~/Upload/Product/27060320vachkinhtam4.jpg</Image></Images>', 17, N'&lt;h1&gt;&lt;strong&gt;Lợi &amp;iacute;ch của v&amp;aacute;ch k&amp;iacute;nh nh&amp;agrave; tắm&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Vậy đ&amp;acirc;u l&amp;agrave; ưu điểm khiến ch&amp;uacute;ng được sử dụng rộng r&amp;atilde;i như vậy?&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;1. Tạo kh&amp;ocirc;ng gian thoải m&amp;aacute;i&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;V&amp;aacute;ch tắm k&amp;iacute;nh&amp;nbsp;sẽ tạo n&amp;ecirc;n kh&amp;ocirc;ng gian thoải m&amp;aacute;i cho người sử dụng. Với thiết kế hiện đại c&amp;ugrave;ng chất liệu&amp;nbsp;k&amp;iacute;nh cường lực&amp;nbsp;đầy chắc chắn, an to&amp;agrave;n khi c&amp;oacute; khả năng chịu lực v&amp;agrave; nhiệt cực kỳ tốt. Tạo n&amp;ecirc;n n&amp;eacute;t sang trọng v&amp;agrave; sạch sẽ cho kh&amp;ocirc;ng gian ph&amp;ograve;ng tắm. Ch&amp;uacute;ng chắc chắn sẽ khiến cho người sử dụng cảm thấy h&amp;agrave;i l&amp;ograve;ng.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;2. Tăng vẻ đẹp cho ng&amp;ocirc;i nh&amp;agrave;&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;V&amp;aacute;ch tắm k&amp;iacute;nh cường lực&amp;nbsp;sẽ l&amp;agrave;m tăng vẻ đẹp cho căn nh&amp;agrave; của bạn, phong c&amp;aacute;ch ri&amp;ecirc;ng của chủ nh&amp;agrave;. Với thiết kế đầy độc đ&amp;aacute;o như vậy, ch&amp;uacute;ng c&amp;ograve;n thể hưởng được &amp;aacute;nh s&amp;aacute;ng từ b&amp;ecirc;n ngo&amp;agrave;i rọi v&amp;agrave;o. Tạo điểm nhấn cho căn nh&amp;agrave;, thể hiện sự sang trọng cho cả một kh&amp;ocirc;ng gian ph&amp;ograve;ng tắm.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;3. Sự chắc chắn&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Chắc hẳn bạn sẽ tự hỏi nếu sử dụng vật liệu bằng k&amp;iacute;nh th&amp;igrave; liệu c&amp;oacute; chắc chắn hay kh&amp;ocirc;ng. H&amp;atilde;y y&amp;ecirc;n t&amp;acirc;m, v&amp;igrave; ch&amp;uacute;ng đều l&amp;agrave; những tấm k&amp;iacute;nh Việt Nhật&amp;nbsp;chất lượng cao, với độ bền gấp 4 đến 5 lần so với loại k&amp;iacute;nh thường. Ngo&amp;agrave;i ra ch&amp;uacute;ng c&amp;ograve;n c&amp;oacute; thể c&amp;aacute;ch &amp;acirc;m rất tốt, tạo n&amp;ecirc;n kh&amp;ocirc;ng gian y&amp;ecirc;n tĩnh cho người sử dụng&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;K&amp;iacute;nh cũng c&amp;oacute; khả năng c&amp;aacute;ch nhiệt c&amp;aacute;ch nhiệt cực kỳ tốt. Khi sử dụng nh&amp;agrave; tắm v&amp;agrave;o m&amp;ugrave;a đ&amp;ocirc;ng, k&amp;iacute;nh sẽ ngăn gi&amp;oacute; từ b&amp;ecirc;n ngo&amp;agrave;i v&amp;agrave;o nhưng vẫn đảm bảo sự th&amp;ocirc;ng tho&amp;aacute;ng cho ph&amp;ograve;ng tắm.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;4. Ph&amp;ugrave; hợp với nh&amp;agrave; tắm diện t&amp;iacute;ch nhỏ&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;V&amp;aacute;ch tắm k&amp;iacute;nh&amp;nbsp;l&amp;agrave; một giải ph&amp;aacute;p hợp l&amp;yacute; gi&amp;uacute;p khắc phục cho những nh&amp;agrave; tắm c&amp;oacute; diện t&amp;iacute;ch bị hạn chế. Sử dụng k&amp;iacute;nh sẽ tạo n&amp;ecirc;n một kh&amp;ocirc;ng gian tho&amp;aacute;ng đ&amp;atilde;ng, cảm gi&amp;aacute;c nh&amp;agrave; tắm sẽ rộng r&amp;atilde;i hơn so với th&amp;ocirc;ng thường. Tạo sự ngăn c&amp;aacute;ch giữa khu vực ph&amp;ograve;ng tắm v&amp;agrave; b&amp;ecirc;n ngo&amp;agrave;i, điều n&amp;agrave;y sẽ gi&amp;uacute;p cho ph&amp;ograve;ng tắm th&amp;ecirc;m sạch sẽ, kh&amp;ocirc; r&amp;aacute;o v&amp;igrave; hạn chế được nước bắn ra ngo&amp;agrave;i.&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;K&amp;iacute;nh : Cường Lực 10mm-12mm&lt;/li&gt;
	&lt;li&gt;K&amp;iacute;ch thước: theo y&amp;ecirc;u cầu&lt;/li&gt;
	&lt;li&gt;Thiết kế theo mẫu c&amp;oacute; sẵn hoặc theo &amp;yacute; tưởng của Kh&amp;aacute;ch H&amp;agrave;ng&lt;/li&gt;
&lt;/ul&gt;
', 1, CAST(N'2020-06-27 18:03:20.477' AS DateTime), NULL, NULL, NULL, NULL, N'vach-kinh-nha-tam', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (34, NULL, N'LAN CAN KÍNH BAN CÔNG', N'Những tấm kính cường lực với độ bền chắc hiện nay không chỉ xuất hiện trong các tòa nhà cao tầng mà dần được người dân sử dụng nhiều hơn để thiết kế nội thất cho ngôi nhà của mình.', N'~/Upload/Product/27060501lancanhkinh1.jpg', N'<Images><Image>~/Upload/Product/27060501lancanhkinh1.jpg</Image><Image>~/Upload/Product/27060501lancanhkinh2.jpg</Image><Image>~/Upload/Product/27060501lancanhkinh4.jpg</Image><Image>~/Upload/Product/27060501lancankinh31.jpg</Image></Images>', 18, N'&lt;h1&gt;&lt;strong&gt;Lợi &amp;iacute;ch khi sử dụng lan canh k&amp;iacute;nh:&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;1. Kh&amp;ocirc;ng gian sống trở n&amp;ecirc;n rộng r&amp;atilde;i v&amp;agrave; thoải m&amp;aacute;i hơn&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Ưu điểm nổi bật của hầu hết mọi loại k&amp;iacute;nh l&amp;agrave; n&amp;oacute; mang đến sự rộng r&amp;atilde;i v&amp;agrave; v&amp;agrave; tho&amp;aacute;ng cho kh&amp;ocirc;ng gian. Việc sử dụng k&amp;iacute;nh cường lực để l&amp;agrave;m lan can cũng sẽ mang đến cho bạn những kh&amp;ocirc;ng gian rộng v&amp;agrave; hết sức th&amp;ocirc;ng tho&amp;aacute;ng. Nếu sử dụng sắt, inox hay nh&amp;ocirc;m l&amp;agrave;m lan can chắc hẳn bạn sẽ kh&amp;ocirc;ng thể n&amp;agrave;o cảm nhận được kh&amp;ocirc;ng gian b&amp;ecirc;n ngo&amp;agrave;i như vật liệu k&amp;iacute;nh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;2. Vệ sinh dễ d&amp;agrave;ng&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Với những lan can cầu thang ngo&amp;agrave;i trời ch&amp;uacute;ng rất dễ bị b&amp;aacute;m nhiều bụi bẩn nếu l&amp;agrave; c&amp;aacute;c vật liệu kh&amp;aacute;c sẽ dễ bị hư hỏng, oxy h&amp;oacute;a v&amp;agrave; kh&amp;oacute; khăn cho việc vệ sinh. Nhưng với chất liệu k&amp;iacute;nh việc vệ sinh trở n&amp;ecirc;n dễ d&amp;agrave;ng hơn rất nhiều v&amp;agrave; mang đến vẻ đẹp, sự s&amp;aacute;ng b&amp;oacute;ng cho ng&amp;ocirc;i nh&amp;agrave;.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;4. Bền đẹp&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Chất liệu k&amp;iacute;nh cường lực c&amp;oacute; độ bền rất cao, khả năng chịu t&amp;aacute;c động lớn n&amp;ecirc;n khi sử dụng để l&amp;agrave;m lan can quả thật l&amp;agrave; một lựa chọn ho&amp;agrave;n hảo. Bạn sẽ kh&amp;ocirc;ng phải tốn k&amp;eacute;m chi ph&amp;iacute; sửa chữa ch&amp;uacute;ng v&amp;igrave; tuổi thọ c&amp;oacute; thể k&amp;eacute;o d&amp;agrave;i đến v&amp;agrave;i chục năm.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;5. Kh&amp;ocirc;ng bị ảnh hưởng bởi thời tiết&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Nếu như một số vật liệu như gỗ, inox, sắt th&amp;eacute;p c&amp;oacute; thể bị hư hỏng nếu như thời tiết kh&amp;iacute; hậu kh&amp;ocirc;ng thuận lợi th&amp;igrave; lan can bằng k&amp;iacute;nh cường lực c&amp;oacute; thể vượt qua những điều ấy một c&amp;aacute;ch tốt nhất. N&amp;oacute; vẫn giữ được độ bền, sự chắc chắn của m&amp;igrave;nh trước thời tiết. D&amp;ugrave; nắng n&amp;oacute;ng, mưa bụi cũng kh&amp;ocirc;ng l&amp;agrave;m ảnh đến chất lượng v&amp;agrave; tuổi thọ k&amp;iacute;nh.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;6. Ph&amp;ugrave; hợp với diện t&amp;iacute;ch nhỏ&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sử dụng cầu thang k&amp;iacute;nh cường lực v&amp;agrave; cả lan can l&amp;agrave;m bằng k&amp;iacute;nh sẽ rất ph&amp;ugrave; hợp với những căn hộ c&amp;oacute; diện t&amp;iacute;ch nhỏ v&amp;agrave; n&amp;oacute; gi&amp;uacute;p kh&amp;ocirc;ng gian thanh tho&amp;aacute;t, ấn tượng hơn. Nhờ khả năng phản chiếu &amp;aacute;nh s&amp;aacute;ng n&amp;ecirc;n kh&amp;ocirc;ng gian trong nh&amp;agrave; sẽ s&amp;aacute;ng v&amp;agrave; tho&amp;aacute;ng hơn rất nhiều.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;7. T&amp;iacute;nh thẩm mỹ cao&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sự an to&amp;agrave;n của lan can k&amp;iacute;nh lu&amp;ocirc;n được đặt l&amp;ecirc;n h&amp;agrave;ng đầu nhưng t&amp;iacute;nh thẩm mỹ của sản phẩm vẫn được ch&amp;uacute; trọng nhiều. Một chiếc lan can bằng k&amp;iacute;nh sẽ g&amp;oacute;p phần l&amp;agrave;m đẹp hơn cho ng&amp;ocirc;i nh&amp;agrave; của bạn cũng như tăng th&amp;ecirc;m gi&amp;aacute; trị cho kh&amp;ocirc;ng gian&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h1&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;p&gt;K&amp;iacute;nh : Cường Lực 8mm &amp;ndash; 12mm&lt;/p&gt;

&lt;p&gt;K&amp;iacute;ch thước: theo y&amp;ecirc;u cầu&lt;/p&gt;

&lt;p&gt;Thiết kế theo mẫu c&amp;oacute; sẵn hoặc theo &amp;yacute; tưởng của kh&amp;aacute;ch h&amp;agrave;ng&lt;/p&gt;
', 1, CAST(N'2020-06-27 18:05:01.990' AS DateTime), NULL, NULL, NULL, NULL, N'lan-can-kinh-ban-cong', NULL)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Image], [MoreImages], [ProductCategoryId], [Detail], [Specifications], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaTitle], [MetaDescription]) VALUES (35, NULL, N'sp test', N'Sản phẩm cửa uPVC (hay còn gọi là cửa nhựa lõi thép gia cường) tuy mới ra đời ở các nước châu Âu khoảng 60 năm trước đây nhưng đã chiếm hơn 60% thị phần cửa ở những quốc gia này. Hiện nay, sản phẩm cửa uPVC đã được sử dụng rộng rãi ở nhiều nước trên thế giới. Tại Việt Nam hiện nay, cửa nhựa uPVC đang trở nên thông dụng và được nhiều khách hàng quan tâm tìm hiểu và sử dụng.', N'~/Upload/Product/27072316cauthangkinh1.jpg', N'<Images><Image>~/Upload/Product/27072316cauthangkinh1.jpg</Image><Image>~/Upload/Product/27072316cauthangkinh2.jpg</Image><Image>~/Upload/Product/27072316cauthangkinh3.jpg</Image></Images>', 18, N'&lt;h2&gt;&lt;strong&gt;Ưu điểm khi sử dụng cầu thang k&amp;iacute;nh cường lực:&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;1. Mang đến sự tinh tế cho mỗi c&amp;ocirc;ng tr&amp;igrave;nh&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;Cầu thang k&amp;iacute;nh đẹp được sử dụng rất phổ biến tr&amp;ecirc;n thị trường,đặc biệt l&amp;agrave; được sử dụng nhiều ở c&amp;aacute;c trung t&amp;acirc;m thương mại lớn v&amp;agrave; cao ốc to&amp;agrave; nh&amp;agrave; cao tầng v&amp;igrave;&amp;nbsp;cầu thang k&amp;iacute;nh đẹp&amp;nbsp;mang đến một phong c&amp;aacute;ch ri&amp;ecirc;ng v&amp;agrave; n&amp;eacute;t độc đ&amp;aacute;o cho c&amp;ocirc;ng tr&amp;igrave;nh của bạn.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Khi bạn quyết định thay thế những chiếc cầu thang truyền thống bằng chiếc cầu thang k&amp;iacute;nh l&amp;agrave; bạn đang tạo ra cho c&amp;ocirc;ng tr&amp;igrave;nh của m&amp;igrave;nh kh&amp;ocirc;ng gian tho&amp;aacute;ng m&amp;aacute;t dễ chịu v&amp;agrave; s&amp;aacute;ng sủa cũng như những n&amp;eacute;t sang trọng v&amp;agrave; lịch sự.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Mẫu m&amp;atilde; đa dạng, phong ph&amp;uacute; về chủng loại&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;&amp;nbsp;Mẫu m&amp;atilde; đa dạng bao gồm: cầu thang k&amp;iacute;nh đẹp, cầu thang k&amp;iacute;nh đẹp h&amp;agrave; nội, cầu thang k&amp;iacute;nh gi&amp;aacute; rẻ,cầu thang k&amp;iacute;nh kh&amp;ocirc;ng trụ, cầu thang k&amp;iacute;nh inox, cầu thang k&amp;iacute;nh cường lực, cầu thang k&amp;iacute;nh cong&amp;nbsp;với rất nhiều mẫu m&amp;atilde; v&amp;agrave; kiểu d&amp;aacute;ng kh&amp;aacute;c nhau ph&amp;ugrave; hợp với kiến tr&amp;uacute;c của qu&amp;yacute; kh&amp;aacute;ch.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;2. An to&amp;agrave;n tuyệt đối&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;&amp;nbsp;Việc sử dụng k&amp;iacute;nh cường lực cho cầu thang k&amp;iacute;nh l&amp;agrave; v&amp;ocirc; c&amp;ugrave;ng an to&amp;agrave;n.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Sản phẩm k&amp;iacute;nh cường lực l&amp;agrave; sản phẩm si&amp;ecirc;u bền v&amp;agrave; chất lượng chịu được lực v&amp;agrave; chống trầy xước hơn những loại kh&amp;aacute;c.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;Sử dụng k&amp;iacute;nh cường lực nếu trường hợp rủi ro xảy ra k&amp;iacute;nh vỡ th&amp;igrave; cũng kh&amp;ocirc;ng nguy hiểm cho người sử dụng.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;3. Khả năng chịu sốc nhiệt cao, chống rung, chịu lực tốt&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh chịu lực rất tốt,khả năng va đập mạnh cũng kh&amp;ocirc;ng sao,chịu được tải trọng lớn.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh c&amp;oacute; khả năng chống rung từ những t&amp;aacute;c động mạnh từ b&amp;ecirc;n ngo&amp;agrave;i t&amp;aacute;c động v&amp;agrave;o.&lt;/strong&gt;&lt;/li&gt;
	&lt;li&gt;&lt;strong&gt;K&amp;iacute;nh cường lực c&amp;oacute; khả năng chịu sốc nhiệt rất cao&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;4. Độ bền cao, sử dụng l&amp;acirc;u d&amp;agrave;i&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;strong&gt;Tuổi thọ của cầu thang k&amp;iacute;nh cường lực rất cao,v&amp;agrave; bạn c&amp;oacute; thể y&amp;ecirc;n t&amp;acirc;m sử dụng rất l&amp;acirc;u d&amp;agrave;i.&lt;/strong&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;h2&gt;&lt;strong&gt;Li&amp;ecirc;n hệ thi c&amp;ocirc;ng&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;strong&gt;Để c&amp;oacute; gi&amp;aacute; tốt nhất qu&amp;yacute; kh&amp;aacute;ch vui l&amp;ograve;ng li&amp;ecirc;n hệ&amp;nbsp;Minh Ho&amp;agrave;ng DL&amp;nbsp;tại&amp;nbsp;&lt;a href="http://minhhoangdl.vn/home/contact"&gt;L&amp;ocirc; G26 - Trần Anh T&amp;ocirc;ng - KQH Nguy&amp;ecirc;n Tử Lực - Phường 8 - Đ&amp;agrave; Lạt - L&amp;acirc;m Đồng&lt;/a&gt;&lt;br /&gt;
Hoặc Hotline:&amp;nbsp;&lt;a href="tel:0931222775"&gt;0931.222.775&lt;/a&gt;&amp;nbsp;-&amp;nbsp;&lt;a href="tel:0986909997"&gt;0986.909.997&lt;/a&gt;&amp;nbsp;để được hỗ trợ tư vấn v&amp;agrave; nhận b&amp;aacute;o gi&amp;aacute; chi tiết.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch!&lt;/strong&gt;&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;
	&lt;h3&gt;&lt;strong&gt;K&amp;iacute;nh : Cường Lực 8mm-12mm&lt;/strong&gt;&lt;/h3&gt;
	&lt;/li&gt;
	&lt;li&gt;
	&lt;h3&gt;&lt;strong&gt;K&amp;iacute;ch thước: theo y&amp;ecirc;u cầu&lt;/strong&gt;&lt;/h3&gt;
	&lt;/li&gt;
	&lt;li&gt;
	&lt;h3&gt;&lt;strong&gt;Thiết kế theo mẫu c&amp;oacute; sẵn hoặc theo &amp;yacute; tưởng của Kh&amp;aacute;ch H&amp;agrave;ng&lt;/strong&gt;&lt;/h3&gt;
	&lt;/li&gt;
&lt;/ul&gt;
', NULL, CAST(N'2020-06-27 19:23:16.337' AS DateTime), NULL, NULL, NULL, NULL, N'sp-test', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (11, N'Cửa lưới chống muỗi', N'cua-luoi-chong-muoi', NULL, 1, NULL, CAST(N'2020-06-27 13:05:10.597' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (12, N'Cửa nhựa lõi thép', N'cua-nhua-loi-thep', NULL, 2, NULL, CAST(N'2020-06-27 13:05:32.493' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (13, N'Cửa nhôm Xingfa nhập Quảng Đông', N'cua-nhom-xingfa-nhap-quang-dong', NULL, 3, NULL, CAST(N'2020-06-27 13:05:48.430' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (14, N'Cầu thang kính', N'cau-thang-kinh', NULL, 4, NULL, CAST(N'2020-06-27 13:06:07.217' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (15, N'Cửa nhôm PMA', N'cua-nhom-pma', NULL, 5, NULL, CAST(N'2020-06-27 13:06:21.447' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (16, N'Vách kính', N'vach-kinh', NULL, 7, NULL, CAST(N'2020-06-27 13:06:36.320' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (17, N'Vách kính tắm', N'vach-kinh-tam', NULL, 8, NULL, CAST(N'2020-06-27 13:06:50.947' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (18, N'Lan can kính', N'lan-can-kinh', NULL, 9, NULL, CAST(N'2020-06-27 13:07:01.300' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ALL_ROLE', N'Tất cả các quyền')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_ROLE', N'Xóa thông tin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'EDIT_ROLE', N'Chỉnh sửa thông tin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'INSERT_ROLE', N'Thêm thông tin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_ROLE', N'Xem thông tin')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([Id], [Image], [DisplayOrder], [Name], [Descripstion], [CreatedBy], [ModifiedDate], [ModifileBy], [CreatedDate], [Status]) VALUES (5, N'~/Upload/Slide/29045648br1.jpg', 1, N'MINH HOÀNG DL1', N'Nơi tạo dựng vẻ đẹp ngôi nhà', NULL, CAST(N'2020-06-29 17:12:22.173' AS DateTime), NULL, CAST(N'2020-06-29 16:56:48.863' AS DateTime), 1)
INSERT [dbo].[Slide] ([Id], [Image], [DisplayOrder], [Name], [Descripstion], [CreatedBy], [ModifiedDate], [ModifileBy], [CreatedDate], [Status]) VALUES (6, N'~/Upload/Slide/29045804banner.png', 2, N'MINH HOÀNG DL', N'Nơi tạo dựng vẻ đẹp ngôi nhà test', NULL, NULL, NULL, CAST(N'2020-06-29 16:58:04.430' AS DateTime), 1)
INSERT [dbo].[Slide] ([Id], [Image], [DisplayOrder], [Name], [Descripstion], [CreatedBy], [ModifiedDate], [ModifileBy], [CreatedDate], [Status]) VALUES (7, N'~/Upload/Slide/29045911high-rise-building.jpg', 3, N'Cửa lưới chống muỗi', N'Nơi tạo dựng vẻ đẹp ngôi nhà test123', NULL, CAST(N'2020-06-30 18:22:42.717' AS DateTime), NULL, CAST(N'2020-06-29 16:59:11.733' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [Status], [GroupId], [ResetCodePassword], [UserGroup_Id]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'Pham Minh Yen', N'nha trang', N'0922912138', N'phamminhyen2d@gmail.com', NULL, NULL, NULL, NULL, 1, N'ADMIN', NULL, NULL)
INSERT [dbo].[User] ([Id], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifileBy], [Status], [GroupId], [ResetCodePassword], [UserGroup_Id]) VALUES (2, N'minhyen', N'68c7f78d53fc6cb65ba5aae6f44c4036', N'Hello', N'nha trang', N'0922912138', N'phamminhyen97@gmail.com', NULL, NULL, CAST(N'2020-06-30 20:56:35.347' AS DateTime), NULL, 0, N'MOD', N'', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MOD', N'MOD')
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Content_dbo.Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_dbo.Content_dbo.Category_CategoryId]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Permission_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_dbo.Permission_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Permission_dbo.UserGroup_UserGroupId] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_dbo.Permission_dbo.UserGroup_UserGroupId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.ProductCategory_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.ProductCategory_ProductCategoryId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.UserGroup_UserGroup_Id] FOREIGN KEY([UserGroup_Id])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.UserGroup_UserGroup_Id]
GO
