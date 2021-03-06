USE [Assignment]
GO
/****** Object:  Table [dbo].[Security]    Script Date: 01/06/2020 14:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security](
	[Security_id] [int] IDENTITY(1,1) NOT NULL,
	[Security Questions] [nvarchar](max) NULL,
 CONSTRAINT [PK_Security] PRIMARY KEY CLUSTERED 
(
	[Security_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Security] ON
INSERT [dbo].[Security] ([Security_id], [Security Questions]) VALUES (1, N'What is your nick name?')
INSERT [dbo].[Security] ([Security_id], [Security Questions]) VALUES (2, N'What is your favourite place')
INSERT [dbo].[Security] ([Security_id], [Security Questions]) VALUES (3, N'What is your native?')
SET IDENTITY_INSERT [dbo].[Security] OFF
/****** Object:  Table [dbo].[Country]    Script Date: 01/06/2020 14:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Country_id] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Country_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (1, N'India')
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (2, N'Australia')
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (3, N'Germany')
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (4, N'US')
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (5, N'Canada')
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (6, N'France')
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (7, N'Malaysia')
INSERT [dbo].[Country] ([Country_id], [Country_Name]) VALUES (8, N'Japan')
SET IDENTITY_INSERT [dbo].[Country] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 01/06/2020 14:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[EmailID] [nvarchar](max) NULL,
	[PhoneNumer] [int] NULL,
	[Password] [nvarchar](max) NULL,
	[Retype Password] [nvarchar](max) NULL,
	[Security Questions] [nvarchar](max) NULL,
	[Security Answers] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_Update]    Script Date: 01/06/2020 14:25:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Update]
(
@UserID int,
@FullName varchar(max),
@EmailID varchar(max),
@City varchar(max),
@Country varchar(max),
@Status bit
)
as
begin
update users set FullName=@FullName,EmailID=@EmailID,City=@City, Country=@Country,Status=@Status where UserID=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Select]    Script Date: 01/06/2020 14:25:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Select]
as
begin

select * from users
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdate]    Script Date: 01/06/2020 14:25:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_InsertUpdate]
(
@UserID int,
@Name nvarchar(max),
@EmailID nvarchar(max),
@City nvarchar(max),
@Country nvarchar(max),
@Status bit,
@Action varchar(max)
)
as
begin
if @Action='Insert'
begin
insert into Users (FullName,EmailID,City,Country,Status) values(@Name,@EmailID,@City,@Country,@Status)
end
else
if @Action='Update'
begin
update users set FullName=@Name,EmailID=@EmailID,City=@City, Country=@Country,Status=@Status where UserID=@UserID
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert]    Script Date: 01/06/2020 14:25:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Insert]
(
@ID int,
@Name nvarchar(max),
@EmailID nvarchar(max),
@PhoneNumer nvarchar(max),
@City nvarchar(max),
@Country nvarchar(max),
@Status bit
)
as
begin
insert into Users (FullName,EmailID,City,Country,Status) values(@Name,@EmailID,@City,@Country,@Status)
end
GO
