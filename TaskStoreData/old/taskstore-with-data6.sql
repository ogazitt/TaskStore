/****** Object:  Table [dbo].[Users]    Script Date: 07/15/2011 21:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[Users] ([ID], [Name], [Password]) VALUES (N'a6391275-982f-4e59-9b5a-959658e043fc', N'ogazitt@gmail.com', N'bar')
/****** Object:  Table [dbo].[Tags]    Script Date: 07/15/2011 21:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 07/15/2011 21:06:34 ******/
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
/****** Object:  Table [dbo].[ListTypes]    Script Date: 07/15/2011 21:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ListTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'14cda248-4116-4e51-ac13-00096b43418c', N'To Do', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'Shopping', NULL)
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 07/15/2011 21:06:34 ******/
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
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (2, N'Description', N'Description', N'String')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (3, N'PriorityID', N'Priority', N'Priority')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (4, N'Due', N'Due', N'Date')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (5, N'Location', N'Location', N'Address')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (6, N'Phone', N'Phone', N'PhoneNumber')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (7, N'Website', N'Website', N'Website')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (8, N'Email', N'Email', N'Email')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (9, N'Complete', N'Complete', N'Boolean')
INSERT [dbo].[FieldTypes] ([FieldTypeID], [Name], [DisplayName], [DisplayType]) VALUES (10, N'Description', N'Description', N'TextBox')
SET IDENTITY_INSERT [dbo].[FieldTypes] OFF
/****** Object:  Table [dbo].[Fields]    Script Date: 07/15/2011 21:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[ID] [uniqueidentifier] NOT NULL,
	[FieldTypeID] [int] NOT NULL,
	[ListTypeID] [uniqueidentifier] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'3F6F8964-FCCD-47C6-8595-FBB0D5CAB5C2', 1, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5B934DC3-983C-4F05-AA48-C26B43464BBF', 2, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8F96E751-417F-489E-8BE2-B9A2BABF05D1', 3, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 3)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5F33C018-F0ED-4C8D-AF96-5B5C4B78C843', 4, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 4)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'F5391480-1675-4D5C-9F4B-0887227AFDA5', 5, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 5)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'DA356E6E-A484-47A3-9C95-7618BCBB39EF', 6, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 6)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'82957B93-67D9-4E4A-A522-08D18B4B5A1F', 7, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 7)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'261950F7-7FDA-4432-A280-D0373CC8CADF', 8, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 8)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'32EE3561-226A-4DAD-922A-9ED93099C457', 9, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 9)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'DEA2ECAD-1E53-4616-8EE9-C399D4223FFB', 1, N'1788A0C4-96E8-4B95-911A-75E1519D7259', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7E7EAEB4-562B-481C-9A38-AEE216B8B4A0', 9, N'1788A0C4-96E8-4B95-911A-75E1519D7259', 0, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'1C01E1B0-C14A-4CE9-81B9-868A13AAE045', 1, N'dc1c6243-e510-4297-9df8-75babd237fbe', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7FFD95DB-FE46-49B4-B5EE-2863938CD687', 10, N'dc1c6243-e510-4297-9df8-75babd237fbe', 1, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'6B3E6603-3BAB-4994-A69C-DF0F4310FA95', 3, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 3)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'2848AF68-26F7-4ABB-8B9E-1DA74EE4EC73', 4, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 4)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'4054F093-3F7F-4894-A2C2-5924098DBB29', 5, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 5)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8F0915DE-E77F-4B63-8B22-A4FF4AFC99FF', 6, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 6)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'9F9B9FDB-3403-4DCD-A139-A28487C1832C', 7, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 7)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'4E304CCA-561F-4CB3-889B-1F5D022C4364', 8, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 8)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'FE0CFC57-0A1C-4E3E-ADD3-225E2C062DE0', 9, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 9)
/****** Object:  Table [dbo].[TaskLists]    Script Date: 07/15/2011 21:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskLists](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ListTypeID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Template] [bit] NOT NULL,
 CONSTRAINT [PK_TaskLists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'Shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'a6391275-982f-4e59-9b5a-959658e043fc', 1)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'40168c99-d394-47e3-8d52-83c9ee2a6ed2', N'To Do', N'14cda248-4116-4e51-ac13-00096b43418c', N'a6391275-982f-4e59-9b5a-959658e043fc', 0)
/****** Object:  Table [dbo].[Tasks]    Script Date: 07/15/2011 21:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [uniqueidentifier] NOT NULL,
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
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[TaskTags]    Script Date: 07/15/2011 21:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTags](
	[ID] [uniqueidentifier] NOT NULL,
	[TaskID] [uniqueidentifier] NOT NULL,
	[TagID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TaskTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TaskTags] ON [dbo].[TaskTags] 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Default [DF_Users_ID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tags_ID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_ListTypes_ID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[ListTypes] ADD  CONSTRAINT [DF_ListTypes_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Fields_ID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Fields] ADD  CONSTRAINT [DF_Fields_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_TaskLists_ID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[TaskLists] ADD  CONSTRAINT [DF_TaskLists_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tasks_ID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_Tasks_PriorityID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_PriorityID]  DEFAULT ((0)) FOR [PriorityID]
GO
/****** Object:  Default [DF_TaskTags_ID]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[TaskTags] ADD  CONSTRAINT [DF_TaskTags_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  ForeignKey [FK_Fields_FieldTypes]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldTypes] FOREIGN KEY([FieldTypeID])
REFERENCES [dbo].[FieldTypes] ([FieldTypeID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_FieldTypes]
GO
/****** Object:  ForeignKey [FK_Fields_ListTypes]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_ListTypes]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_ListTypes] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[ListTypes] ([ID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_ListTypes]
GO
/****** Object:  ForeignKey [FK_TaskLists_Users]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[TaskLists]  WITH CHECK ADD  CONSTRAINT [FK_TaskLists_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TaskLists] CHECK CONSTRAINT [FK_TaskLists_Users]
GO
/****** Object:  ForeignKey [FK_Tasks_Priorities]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Priorities] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[Priorities] ([PriorityID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Priorities]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists] FOREIGN KEY([TaskListID])
REFERENCES [dbo].[TaskLists] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists]
GO
/****** Object:  ForeignKey [FK_Tasks_TaskLists2]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskLists2] FOREIGN KEY([LinkedTaskListID])
REFERENCES [dbo].[TaskLists] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskLists2]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tags]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tags]
GO
/****** Object:  ForeignKey [FK_TaskTags_Tasks]    Script Date: 07/15/2011 21:06:34 ******/
ALTER TABLE [dbo].[TaskTags]  WITH CHECK ADD  CONSTRAINT [FK_TaskTags_Tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[TaskTags] CHECK CONSTRAINT [FK_TaskTags_Tasks]
GO
