/****** Object:  Table [dbo].[Users]    Script Date: 07/10/2011 18:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserID], [Name], [Password]) VALUES (1, N'ogazitt@gmail.com', N'bar')
INSERT [dbo].[Users] ([UserID], [Name], [Password]) VALUES (2, N'Omri', N'bar')
INSERT [dbo].[Users] ([UserID], [Name], [Password]) VALUES (3, N'foo', N'baz')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[ListTypes]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTypes](
	[ListTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ListTypes] PRIMARY KEY CLUSTERED 
(
	[ListTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[ListTypes] ON
INSERT [dbo].[ListTypes] ([ListTypeID], [Name], [UserID]) VALUES (1, N'Todo', 0)
INSERT [dbo].[ListTypes] ([ListTypeID], [Name], [UserID]) VALUES (2, N'Shopping', 0)
SET IDENTITY_INSERT [dbo].[ListTypes] OFF
/****** Object:  Table [dbo].[Tags]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priorities](
	[PriorityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Priorities] PRIMARY KEY CLUSTERED 
(
	[PriorityID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[Priorities] ON
INSERT [dbo].[Priorities] ([PriorityID], [Name]) VALUES (1, N'High')
INSERT [dbo].[Priorities] ([PriorityID], [Name]) VALUES (2, N'Medium')
INSERT [dbo].[Priorities] ([PriorityID], [Name]) VALUES (3, N'Low')
INSERT [dbo].[Priorities] ([PriorityID], [Name]) VALUES (4, N'None')
SET IDENTITY_INSERT [dbo].[Priorities] OFF
/****** Object:  Table [dbo].[MoreFields]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoreFields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[ListTypeID] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_MoreFields] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[MoreFields] ON
INSERT [dbo].[MoreFields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (1, N'Location', N'Location', 1, 1)
INSERT [dbo].[MoreFields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (2, N'Phone', N'Phone Number', 1, 2)
INSERT [dbo].[MoreFields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (3, N'Website', N'Website', 1, 3)
INSERT [dbo].[MoreFields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (4, N'Email', N'Email', 1, 4)
SET IDENTITY_INSERT [dbo].[MoreFields] OFF
/****** Object:  Table [dbo].[Fields]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[ListTypeID] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[Fields] ON
INSERT [dbo].[Fields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (1, N'Name', N'Name', 1, 1)
INSERT [dbo].[Fields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (2, N'PriorityID', N'Priority', 1, 2)
INSERT [dbo].[Fields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (3, N'Description', N'Description', 1, 3)
INSERT [dbo].[Fields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (4, N'Due', N'Due', 1, 4)
INSERT [dbo].[Fields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (5, N'Complete', N'Complete', 1, 5)
INSERT [dbo].[Fields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (6, N'Name', N'Name', 2, 1)
INSERT [dbo].[Fields] ([FieldID], [Name], [DisplayName], [ListTypeID], [SortOrder]) VALUES (7, N'Complete', N'Complete', 2, 2)
SET IDENTITY_INSERT [dbo].[Fields] OFF
/****** Object:  Table [dbo].[TaskLists]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskLists](
	[TaskListID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ListTypeID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Template] [bit] NOT NULL,
 CONSTRAINT [PK_TaskLists] PRIMARY KEY CLUSTERED 
(
	[TaskListID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[TaskLists] ON
INSERT [dbo].[TaskLists] ([TaskListID], [Name], [ListTypeID], [UserID], [Template]) VALUES (1, N'To do', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[TaskLists] OFF
/****** Object:  Table [dbo].[Tasks]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskListID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PriorityID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Due] [date] NULL,
	[Complete] [bit] NOT NULL,
	[Location] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Website] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT [dbo].[Tasks] ([TaskID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email]) VALUES (1, 1, N'Code TaskStore', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tasks] ([TaskID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email]) VALUES (2, 1, N'Cancel vonage', 1, N'Cancel vonage', CAST(0x63340B00 AS Date), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tasks] ([TaskID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email]) VALUES (3, 1, N'Rebate for contacts', 2, N'', CAST(0x63340B00 AS Date), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tasks] ([TaskID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email]) VALUES (7, 1, N'foo', 2, N'bar', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tasks] ([TaskID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email]) VALUES (8, 1, N'work', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
/****** Object:  Table [dbo].[TaskTags]    Script Date: 07/10/2011 18:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTags](
	[TaskTagID] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskID] [bigint] NOT NULL,
	[TagID] [int] NOT NULL,
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
/****** Object:  ForeignKey [FK_MoreFields_ListTypes]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[MoreFields]  WITH CHECK ADD  CONSTRAINT [FK_MoreFields_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ListTypeID])
GO
ALTER TABLE [dbo].[MoreFields] CHECK CONSTRAINT [FK_MoreFields_ListTypes]
GO
/****** Object:  ForeignKey [FK_Fields_ListTypes]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ListTypeID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_ListTypes]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ListTypeID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_Users]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_Users]
GO
/****** Object:  ForeignKey [FK_Tasks_Priorities]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Priorities] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[Priorities] ([PriorityID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Priorities]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists] FOREIGN KEY([TaskListID])
REFERENCES [dbo].[TaskLists] ([TaskListID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tags]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tags]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tasks]    Script Date: 07/10/2011 18:22:47 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tasks]
GO
