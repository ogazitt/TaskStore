/****** Object:  Table [dbo].[Users]    Script Date: 07/15/2011 14:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[Users] ([UserID], [Name], [Password]) VALUES (N'a6391275-982f-4e59-9b5a-959658e043fc', N'ogazitt@gmail.com', N'bar')
/****** Object:  Table [dbo].[Tags]    Script Date: 07/15/2011 14:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 07/15/2011 14:30:56 ******/
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
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[Priorities] ON
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (0, N'None', N'White')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (1, N'Low', N'Green')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (2, N'Medium', N'Yellow')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (3, N'High', N'Red')
SET IDENTITY_INSERT [dbo].[Priorities] OFF
/****** Object:  Table [dbo].[ListTypes]    Script Date: 07/15/2011 14:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTypes](
	[ListTypeID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ListTypes] PRIMARY KEY CLUSTERED 
(
	[ListTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[ListTypes] ([ListTypeID], [Name], [UserID]) VALUES (N'14cda248-4116-4e51-ac13-00096b43418c', N'To Do', NULL)
INSERT [dbo].[ListTypes] ([ListTypeID], [Name], [UserID]) VALUES (N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'Shopping', NULL)
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 07/15/2011 14:30:56 ******/
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
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
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
/****** Object:  Table [dbo].[Fields]    Script Date: 07/15/2011 14:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[FieldID] [uniqueidentifier] NOT NULL,
	[FieldTypeID] [int] NOT NULL,
	[ListTypeID] [uniqueidentifier] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'f5391480-1675-4d5c-9f4b-0887227afda5', 5, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 5)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'82957b93-67d9-4e4a-a522-08d18b4b5a1f', 7, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 7)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5f33c018-f0ed-4c8d-af96-5b5c4b78c843', 4, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 4)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'da356e6e-a484-47a3-9c95-7618bcbb39ef', 6, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 6)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'32ee3561-226a-4dad-922a-9ed93099c457', 9, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 9)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7e7eaeb4-562b-481c-9a38-aee216b8b4a0', 5, N'1788a0c4-96e8-4b95-911a-75e1519d7259', 1, 2)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8f96e751-417f-489e-8be2-b9a2babf05d1', 3, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 3)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5b934dc3-983c-4f05-aa48-c26b43464bbf', 2, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 2)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'dea2ecad-1e53-4616-8ee9-c399d4223ffb', 1, N'1788a0c4-96e8-4b95-911a-75e1519d7259', 1, 1)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'261950f7-7fda-4432-a280-d0373cc8cadf', 8, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 8)
INSERT [dbo].[Fields] ([FieldID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'3f6f8964-fccd-47c6-8595-fbb0d5cab5c2', 1, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 1)
/****** Object:  Table [dbo].[TaskLists]    Script Date: 07/15/2011 14:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskLists](
	[TaskListID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ListTypeID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Template] [bit] NOT NULL,
 CONSTRAINT [PK_TaskLists] PRIMARY KEY CLUSTERED 
(
	[TaskListID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[TaskLists] ([TaskListID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'Shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'a6391275-982f-4e59-9b5a-959658e043fc', 1)
INSERT [dbo].[TaskLists] ([TaskListID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'40168c99-d394-47e3-8d52-83c9ee2a6ed2', N'To Do', N'14cda248-4116-4e51-ac13-00096b43418c', N'a6391275-982f-4e59-9b5a-959658e043fc', 0)
/****** Object:  Table [dbo].[Tasks]    Script Date: 07/15/2011 14:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [uniqueidentifier] NOT NULL,
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
	[TaskID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[TaskTags]    Script Date: 07/15/2011 14:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTags](
	[TaskTagID] [uniqueidentifier] NOT NULL,
	[TaskID] [uniqueidentifier] NOT NULL,
	[TagID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TaskTags] PRIMARY KEY CLUSTERED 
(
	[TaskTagID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TaskTags] ON [dbo].[TaskTags] 
(
	[TaskTagID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Default [DF_Users_UserID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserID]  DEFAULT (newid()) FOR [UserID]
GO
/****** Object:  Default [DF_Tags_TagID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_TagID]  DEFAULT (newid()) FOR [TagID]
GO
/****** Object:  Default [DF_ListTypes_ListTypeID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[ListTypes] ADD  CONSTRAINT [DF_ListTypes_ListTypeID]  DEFAULT (newid()) FOR [ListTypeID]
GO
/****** Object:  Default [DF_Fields_FieldID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Fields] ADD  CONSTRAINT [DF_Fields_FieldID]  DEFAULT (newid()) FOR [FieldID]
GO
/****** Object:  Default [DF_TaskLists_TaskListID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[TaskLists] ADD  CONSTRAINT [DF_TaskLists_TaskListID]  DEFAULT (newid()) FOR [TaskListID]
GO
/****** Object:  Default [DF_Tasks_TaskID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_TaskID]  DEFAULT (newid()) FOR [TaskID]
GO
/****** Object:  Default [DF_Tasks_PriorityID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_PriorityID]  DEFAULT ((0)) FOR [PriorityID]
GO
/****** Object:  Default [DF_TaskTags_TaskTagID]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[TaskTags] ADD  CONSTRAINT [DF_TaskTags_TaskTagID]  DEFAULT (newid()) FOR [TaskTagID]
GO
/****** Object:  ForeignKey [FK_Fields_FieldTypes]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldTypes] FOREIGN KEY([FieldTypeID])
REFERENCES [dbo].[FieldTypes] ([FieldTypeID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_FieldTypes]
GO
/****** Object:  ForeignKey [FK_Fields_ListTypes]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ListTypeID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_ListTypes]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ListTypeID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_Users]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_Users]
GO
/****** Object:  ForeignKey [FK_Tasks_Priorities]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Priorities] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[Priorities] ([PriorityID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Priorities]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists] FOREIGN KEY([TaskListID])
REFERENCES [dbo].[TaskLists] ([TaskListID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tags]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tags]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tasks]    Script Date: 07/15/2011 14:30:56 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tasks]
GO
