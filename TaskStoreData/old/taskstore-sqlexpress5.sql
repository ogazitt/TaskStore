USE [master]
GO
/****** Object:  Database [TaskStore]    Script Date: 07/14/2011 16:56:28 ******/
CREATE DATABASE [TaskStore] ON  PRIMARY 
( NAME = N'TaskStore', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\TaskStore.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TaskStore_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\TaskStore_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TaskStore] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskStore] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TaskStore] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TaskStore] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TaskStore] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TaskStore] SET ARITHABORT OFF
GO
ALTER DATABASE [TaskStore] SET AUTO_CLOSE ON
GO
ALTER DATABASE [TaskStore] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TaskStore] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TaskStore] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TaskStore] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TaskStore] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TaskStore] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TaskStore] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TaskStore] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TaskStore] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TaskStore] SET  ENABLE_BROKER
GO
ALTER DATABASE [TaskStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TaskStore] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TaskStore] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TaskStore] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TaskStore] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TaskStore] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TaskStore] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TaskStore] SET  READ_WRITE
GO
ALTER DATABASE [TaskStore] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TaskStore] SET  MULTI_USER
GO
ALTER DATABASE [TaskStore] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TaskStore] SET DB_CHAINING OFF
GO
USE [TaskStore]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Users] ([ID], [Name], [Password]) VALUES (N'A6391275-982F-4E59-9B5A-959658E043FC', N'ogazitt@gmail.com', N'bar')
/****** Object:  Table [dbo].[Tags]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priorities](
	[PriorityID] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Priorities] PRIMARY KEY CLUSTERED 
(
	[PriorityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Priorities] ON
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (0, N'None', N'White')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (1, N'Low', N'Green')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (2, N'Medium', N'Yellow')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (3, N'High', N'Red')
SET IDENTITY_INSERT [dbo].[Priorities] OFF
/****** Object:  Table [dbo].[ListTypes]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTypes](
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ListTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'14cda248-4116-4e51-ac13-00096b43418c', N'To Do', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'1788A0C4-96E8-4B95-911A-75E1519D7259', N'Shopping', NULL)
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldTypes](
	[FieldTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[DisplayType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FieldTypes] PRIMARY KEY CLUSTERED 
(
	[FieldTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FieldTypes] ON
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (1, N'Name', N'Name', N'String')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (2, N'PriorityID', N'Priority', N'Priority')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (3, N'Description', N'Description', N'String')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (4, N'Due', N'Due', N'Date')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (5, N'Complete', N'Complete', N'Boolean')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (6, N'Location', N'Location', N'Address')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (7, N'Phone', N'Phone', N'PhoneNumber')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (8, N'Website', N'Website', N'Website')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (9, N'Email', N'Email', N'Email')
SET IDENTITY_INSERT [dbo].[FieldTypes] OFF
/****** Object:  Table [dbo].[Fields]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL,
	[FieldTypeID] [int] NOT NULL,
	[ListTypeID] [uniqueidentifier] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'3F6F8964-FCCD-47C6-8595-FBB0D5CAB5C2', 1, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5B934DC3-983C-4F05-AA48-C26B43464BBF', 2, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8F96E751-417F-489E-8BE2-B9A2BABF05D1', 3, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 3)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5F33C018-F0ED-4C8D-AF96-5B5C4B78C843', 4, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 4)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'F5391480-1675-4D5C-9F4B-0887227AFDA5', 5, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 5)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'DA356E6E-A484-47A3-9C95-7618BCBB39EF', 6, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 6)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'82957B93-67D9-4E4A-A522-08D18B4B5A1F', 7, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 7)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'261950F7-7FDA-4432-A280-D0373CC8CADF', 8, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 8)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'32EE3561-226A-4DAD-922A-9ED93099C457', 9, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 9)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'DEA2ECAD-1E53-4616-8EE9-C399D4223FFB', 1, N'1788A0C4-96E8-4B95-911A-75E1519D7259', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7E7EAEB4-562B-481C-9A38-AEE216B8B4A0', 5, N'1788A0C4-96E8-4B95-911A-75E1519D7259', 1, 2)
/****** Object:  Table [dbo].[TaskLists]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskLists](
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ListTypeID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Template] [bit] NOT NULL,
 CONSTRAINT [PK_TaskLists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'40168C99-D394-47E3-8D52-83C9EE2A6ED2', N'To Do', N'14CDA248-4116-4E51-AC13-00096B43418C', N'A6391275-982F-4E59-9B5A-959658E043FC', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'70D36AF8-42A0-4397-8F3E-257C1609BB7E', N'Shopping', N'1788A0C4-96E8-4B95-911A-75E1519D7259', N'A6391275-982F-4E59-9B5A-959658E043FC', 1)
/****** Object:  Table [dbo].[Tasks]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL,
	[TaskListID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PriorityID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Due] [date] NULL,
	[Complete] [bit] NOT NULL,
	[Location] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Website] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[LinkedTaskListID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskTags]    Script Date: 07/14/2011 16:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTags](
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL,
	[TaskID] [uniqueidentifier] NOT NULL,
	[TagID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TaskTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TaskTags] ON [dbo].[TaskTags] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_Fields_ID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Fields] ADD  CONSTRAINT [DF_Fields_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_ListTypes_ID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[ListTypes] ADD  CONSTRAINT [DF_ListTypes_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tags_ID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tasks_PriorityID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_PriorityID]  DEFAULT ((0)) FOR [PriorityID]
GO
/****** Object:  Default [DF_Tasks_ID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_TaskLists_ID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[TaskLists] ADD  CONSTRAINT [DF_TaskLists_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_TaskTags_ID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[TaskTags] ADD  CONSTRAINT [DF_TaskTags_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Users_ID]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  ForeignKey [FK_Fields_FieldTypes]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldTypes] FOREIGN KEY([FieldTypeID])
REFERENCES [dbo].[FieldTypes] ([FieldTypeID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_FieldTypes]
GO
/****** Object:  ForeignKey [FK_Fields_ListTypes]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_ListTypes]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_Users]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_Users]
GO
/****** Object:  ForeignKey [FK_Tasks_Priorities]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Priorities] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[Priorities] ([PriorityID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Priorities]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists] FOREIGN KEY([TaskListID])
REFERENCES [dbo].[TaskLists] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists2]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists2] FOREIGN KEY([LinkedTaskListID])
REFERENCES [dbo].[TaskLists] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tags]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tags]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tasks]    Script Date: 07/14/2011 16:56:30 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tasks]
GO
