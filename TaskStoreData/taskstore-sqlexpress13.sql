USE [master]
GO
/****** Object:  Database [TaskStore]    Script Date: 07/22/2011 14:26:26 ******/
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
/****** Object:  Table [dbo].[Actions]    Script Date: 07/22/2011 14:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ActionID] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[ActionType] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actions] ON
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (1, N'LinkedTaskListID', N'navigate', N'Navigate', 1)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (2, N'Due', N'postpone', N'Postpone', 2)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (3, N'Due', N'add reminder', N'AddToCalendar', 3)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (4, N'Location', N'map', N'Map', 4)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (5, N'Phone', N'call', N'Phone', 5)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (6, N'Phone', N'text', N'TextMessage', 6)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (7, N'Website', N'browse', N'Browse', 7)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (8, N'Email', N'email', N'Email', 8)
SET IDENTITY_INSERT [dbo].[Actions] OFF
/****** Object:  Table [dbo].[Colors]    Script Date: 07/22/2011 14:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Colors] ON
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (0, N'White')
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (1, N'Blue')
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (2, N'Brown')
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (3, N'Green')
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (4, N'Orange')
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (5, N'Purple')
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (6, N'Red')
INSERT [dbo].[Colors] ([ColorID], [Name]) VALUES (7, N'Yellow')
SET IDENTITY_INSERT [dbo].[Colors] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 07/22/2011 14:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 07/22/2011 14:26:28 ******/
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
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (2, N'Description', N'Description', N'String')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (3, N'PriorityID', N'Priority', N'Priority')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (4, N'Due', N'Due', N'Date')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (5, N'TaskTags', N'Tags (separated by commas)', N'TagList')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (6, N'Location', N'Location', N'Address')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (7, N'Phone', N'Phone', N'PhoneNumber')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (8, N'Website', N'Website', N'Website')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (9, N'Email', N'Email', N'Email')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (10, N'Complete', N'Complete', N'Boolean')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (11, N'Description', N'Details', N'TextBox')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (12, N'LinkedTaskListID', N'Link to another list', N'ListPointer')
SET IDENTITY_INSERT [dbo].[FieldTypes] OFF
/****** Object:  Table [dbo].[Priorities]    Script Date: 07/22/2011 14:26:28 ******/
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
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (0, N'Low', N'Green')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (1, N'Normal', N'White')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (2, N'High', N'Red')
SET IDENTITY_INSERT [dbo].[Priorities] OFF
/****** Object:  Table [dbo].[ListTypes]    Script Date: 07/22/2011 14:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTypes](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ListTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'14cda248-4116-4e51-ac13-00096b43418c', N'To Do List', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'Shopping List', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'dc1c6243-e510-4297-9df8-75babd237fbe', N'Freeform List', NULL)
/****** Object:  Table [dbo].[Tags]    Script Date: 07/22/2011 14:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Color] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fields]    Script Date: 07/22/2011 14:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
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
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'3f6f8964-fccd-47c6-8595-fbb0d5cab5c2', 1, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5b934dc3-983c-4f05-aa48-c26b43464bbf', 2, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8f96e751-417f-489e-8be2-b9a2babf05d1', 3, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 3)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5f33c018-f0ed-4c8d-af96-5b5c4b78c843', 4, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 4)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'ea7a11ad-e842-40ea-8a50-987427e69845', 5, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 5)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'f5391480-1675-4d5c-9f4b-0887227afda5', 6, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 6)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'da356e6e-a484-47a3-9c95-7618bcbb39ef', 7, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 7)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'82957b93-67d9-4e4a-a522-08d18b4b5a1f', 8, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 8)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'261950f7-7fda-4432-a280-d0373cc8cadf', 9, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 9)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'1448b7e7-f876-46ec-8e5b-0b9a1de7ea74', 12, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 10)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'32ee3561-226a-4dad-922a-9ed93099c457', 10, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 11)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'dea2ecad-1e53-4616-8ee9-c399d4223ffb', 1, N'1788a0c4-96e8-4b95-911a-75e1519d7259', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7e7eaeb4-562b-481c-9a38-aee216b8b4a0', 10, N'1788a0c4-96e8-4b95-911a-75e1519d7259', 0, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'1c01e1b0-c14a-4ce9-81b9-868a13aae045', 1, N'dc1c6243-e510-4297-9df8-75babd237fbe', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7ffd95db-fe46-49b4-b5ee-2863938cd687', 11, N'dc1c6243-e510-4297-9df8-75babd237fbe', 1, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'6b3e6603-3bab-4994-a69c-df0f4310fa95', 3, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 3)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'2848af68-26f7-4abb-8b9e-1da74ee4ec73', 4, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 4)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'9ebb9cba-277a-4462-b205-959520eb88c5', 5, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 5)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'4054f093-3f7f-4894-a2c2-5924098dbb29', 6, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 6)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8f0915de-e77f-4b63-8b22-a4ff4afc99ff', 7, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 7)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'9f9b9fdb-3403-4dcd-a139-a28487c1832c', 8, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 8)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'4e304cca-561f-4cb3-889b-1f5d022c4364', 9, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 9)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7715234d-a60e-4336-9af1-f05c36add1c8', 12, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 10)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'fe0cfc57-0a1c-4e3e-add3-225e2c062de0', 10, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 11)
/****** Object:  Table [dbo].[TaskLists]    Script Date: 07/22/2011 14:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskLists](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
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
/****** Object:  Table [dbo].[Tasks]    Script Date: 07/22/2011 14:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TaskListID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PriorityID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[DueDate] [nchar](10) NULL,
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
/****** Object:  Table [dbo].[TaskTags]    Script Date: 07/22/2011 14:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTags](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
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
/****** Object:  Default [DF_Users_ID]    Script Date: 07/22/2011 14:26:28 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_ListTypes_ID]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[ListTypes] ADD  CONSTRAINT [DF_ListTypes_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tags_ID]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tags_Color]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_Color]  DEFAULT (N'White') FOR [Color]
GO
/****** Object:  Default [DF_Fields_ID]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Fields] ADD  CONSTRAINT [DF_Fields_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_TaskLists_ID]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[TaskLists] ADD  CONSTRAINT [DF_TaskLists_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tasks_ID]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tasks_PriorityID]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_PriorityID]  DEFAULT ((1)) FOR [PriorityID]
GO
/****** Object:  Default [DF_TaskTags_ID]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[TaskTags] ADD  CONSTRAINT [DF_TaskTags_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  ForeignKey [FK_ListTypes_Users]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[ListTypes]  WITH CHECK ADD  CONSTRAINT [FK_ListTypes_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[ListTypes] CHECK CONSTRAINT [FK_ListTypes_Users]
GO
/****** Object:  ForeignKey [FK_Tags_Users]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_Users]
GO
/****** Object:  ForeignKey [FK_Fields_FieldTypes]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldTypes] FOREIGN KEY([FieldTypeID])
REFERENCES [dbo].[FieldTypes] ([FieldTypeID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_FieldTypes]
GO
/****** Object:  ForeignKey [FK_Fields_ListTypes]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_ListTypes]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_Users]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_Users]
GO
/****** Object:  ForeignKey [FK_Tasks_Priorities]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Priorities] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[Priorities] ([PriorityID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Priorities]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists] FOREIGN KEY([TaskListID])
REFERENCES [dbo].[TaskLists] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists2]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists2] FOREIGN KEY([LinkedTaskListID])
REFERENCES [dbo].[TaskLists] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists2]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tags]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tags]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tasks]    Script Date: 07/22/2011 14:26:29 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tasks]
GO
