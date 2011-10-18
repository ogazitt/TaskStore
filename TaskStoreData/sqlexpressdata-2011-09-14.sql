/****** Object:  Table [dbo].[Users]    Script Date: 09/14/2011 20:07:22 ******/
INSERT [dbo].[Users] ([ID], [Name], [Password], [Email]) VALUES (N'a6391275-982f-4e59-9b5a-959658e043fc', N'ogazitt@gmail.com', N'bar', N'ogazitt@gmail.com')
INSERT [dbo].[Users] ([ID], [Name], [Password], [Email]) VALUES (N'26bdb734-b100-49fe-943c-d36c83966812', N'ogazitt', N'zrc022..', N'ogazitt@gmail.com')
INSERT [dbo].[Users] ([ID], [Name], [Password], [Email]) VALUES (N'f639aa1c-df32-457c-ba2a-eefe0de1533a', N'og', N'zrc022', N'foo')
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 09/14/2011 20:07:22 ******/
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
/****** Object:  Table [dbo].[Actions]    Script Date: 09/14/2011 20:07:22 ******/
SET IDENTITY_INSERT [dbo].[Actions] ON
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (1, N'LinkedTaskListID', N'navigate', N'Navigate', 1)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (2, N'Due', N'postpone', N'Postpone', 2)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (3, N'Due', N'add reminder', N'AddToCalendar', 3)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (4, N'Address', N'map', N'Map', 4)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (5, N'Phone', N'call', N'Phone', 5)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (6, N'Phone', N'text', N'TextMessage', 6)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (7, N'Website', N'browse', N'Browse', 7)
INSERT [dbo].[Actions] ([ActionID], [FieldName], [DisplayName], [ActionType], [SortOrder]) VALUES (8, N'Email', N'email', N'Email', 8)
SET IDENTITY_INSERT [dbo].[Actions] OFF
/****** Object:  Table [dbo].[Colors]    Script Date: 09/14/2011 20:07:22 ******/
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
/****** Object:  Table [dbo].[Priorities]    Script Date: 09/14/2011 20:07:22 ******/
SET IDENTITY_INSERT [dbo].[Priorities] ON
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (0, N'Low', N'Green')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (1, N'Normal', N'White')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (2, N'High', N'Red')
SET IDENTITY_INSERT [dbo].[Priorities] OFF
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 09/14/2011 20:07:22 ******/
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 09/14/2011 20:07:24 ******/
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 09/14/2011 20:07:24 ******/
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'2b89ecf6-03b8-4565-829b-c8fcbc21408d', NULL)
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 09/14/2011 20:07:24 ******/
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/14/2011 20:07:24 ******/
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 09/14/2011 20:07:24 ******/
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2b89ecf6-03b8-4565-829b-c8fcbc21408d', N'f639aa1c-df32-457c-ba2a-eefe0de1533a', N'og', N'og', NULL, 0, CAST(0x00009F5E018A7F72 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2b89ecf6-03b8-4565-829b-c8fcbc21408d', N'26bdb734-b100-49fe-943c-d36c83966812', N'ogazitt', N'ogazitt', NULL, 0, CAST(0x00009F5E01888825 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2b89ecf6-03b8-4565-829b-c8fcbc21408d', N'06b4b09e-3ae3-4a1e-814a-8f68e57a7a99', N'ogazittrc', N'ogazittrc', NULL, 0, CAST(0x00009F5700607252 AS DateTime))
/****** Object:  Table [dbo].[ListTypes]    Script Date: 09/14/2011 20:07:24 ******/
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'14cda248-4116-4e51-ac13-00096b43418c', N'To Do List', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'dc1c6243-e510-4297-9df8-75babd237fbe', N'Freeform List', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'Shopping List', NULL)
/****** Object:  Table [dbo].[Tags]    Script Date: 09/14/2011 20:07:24 ******/
/****** Object:  Table [dbo].[Fields]    Script Date: 09/14/2011 20:07:25 ******/
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'f5391480-1675-4d5c-9f4b-0887227afda5', 6, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 6)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'82957b93-67d9-4e4a-a522-08d18b4b5a1f', 8, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 8)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'1448b7e7-f876-46ec-8e5b-0b9a1de7ea74', 12, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 10)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'2848af68-26f7-4abb-8b9e-1da74ee4ec73', 4, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 4)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'4e304cca-561f-4cb3-889b-1f5d022c4364', 9, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 9)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'fe0cfc57-0a1c-4e3e-add3-225e2c062de0', 10, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 11)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7ffd95db-fe46-49b4-b5ee-2863938cd687', 11, N'dc1c6243-e510-4297-9df8-75babd237fbe', 1, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'4054f093-3f7f-4894-a2c2-5924098dbb29', 6, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 6)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5f33c018-f0ed-4c8d-af96-5b5c4b78c843', 4, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 4)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'da356e6e-a484-47a3-9c95-7618bcbb39ef', 7, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 7)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'1c01e1b0-c14a-4ce9-81b9-868a13aae045', 1, N'dc1c6243-e510-4297-9df8-75babd237fbe', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'9ebb9cba-277a-4462-b205-959520eb88c5', 5, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 5)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'ea7a11ad-e842-40ea-8a50-987427e69845', 5, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 5)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'32ee3561-226a-4dad-922a-9ed93099c457', 10, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 11)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'9f9b9fdb-3403-4dcd-a139-a28487c1832c', 8, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 8)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8f0915de-e77f-4b63-8b22-a4ff4afc99ff', 7, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 7)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7e7eaeb4-562b-481c-9a38-aee216b8b4a0', 9, N'1788a0c4-96e8-4b95-911a-75e1519d7259', 0, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'8f96e751-417f-489e-8be2-b9a2babf05d1', 3, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 3)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'5b934dc3-983c-4f05-aa48-c26b43464bbf', 2, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 2)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'dea2ecad-1e53-4616-8ee9-c399d4223ffb', 1, N'1788a0c4-96e8-4b95-911a-75e1519d7259', 1, 1)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'261950f7-7fda-4432-a280-d0373cc8cadf', 9, N'14cda248-4116-4e51-ac13-00096b43418c', 0, 9)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'6b3e6603-3bab-4994-a69c-df0f4310fa95', 3, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 3)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'7715234d-a60e-4336-9af1-f05c36add1c8', 12, N'dc1c6243-e510-4297-9df8-75babd237fbe', 0, 10)
INSERT [dbo].[Fields] ([ID], [FieldTypeID], [ListTypeID], [IsPrimary], [SortOrder]) VALUES (N'3f6f8964-fccd-47c6-8595-fbb0d5cab5c2', 1, N'14cda248-4116-4e51-ac13-00096b43418c', 1, 1)
/****** Object:  Table [dbo].[TaskLists]    Script Date: 09/14/2011 20:07:25 ******/
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'Shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'a6391275-982f-4e59-9b5a-959658e043fc', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'a5ec7c8b-e0af-487c-ae2b-428efa02b68b', N'To Do', N'14cda248-4116-4e51-ac13-00096b43418c', N'f639aa1c-df32-457c-ba2a-eefe0de1533a', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'c2a8556f-8c02-429a-976a-49c8262d1904', N'Books', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'a6391275-982f-4e59-9b5a-959658e043fc', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'0c0d6e3b-432c-4cff-a600-51989fd40933', N'To Do', N'14cda248-4116-4e51-ac13-00096b43418c', N'a6391275-982f-4e59-9b5a-959658e043fc', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'ce23d57e-0bf0-49cb-ac21-bb3b97cce155', N'Shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'f639aa1c-df32-457c-ba2a-eefe0de1533a', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'dd5651af-15c7-4c82-9a48-be5376368ccd', N'Shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'26bdb734-b100-49fe-943c-d36c83966812', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'fd6a1556-5457-4e44-852c-fe487f718fb1', N'To Do', N'14cda248-4116-4e51-ac13-00096b43418c', N'26bdb734-b100-49fe-943c-d36c83966812', 0)
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/14/2011 20:07:25 ******/
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 09/14/2011 20:07:25 ******/
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 09/14/2011 20:07:25 ******/
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 09/14/2011 20:07:25 ******/
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'2b89ecf6-03b8-4565-829b-c8fcbc21408d', N'f639aa1c-df32-457c-ba2a-eefe0de1533a', N'hxiiEcyh09/5jLOuT0MEDd6QvNw=', 1, N'gFSC551GDzWrKmJEZbi6Mg==', NULL, N'foo', N'foo', NULL, NULL, 1, 0, CAST(0x00009F5E0182E230 AS DateTime), CAST(0x00009F5E018A7F72 AS DateTime), CAST(0x00009F5E0182E230 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'2b89ecf6-03b8-4565-829b-c8fcbc21408d', N'06b4b09e-3ae3-4a1e-814a-8f68e57a7a99', N'N9wlJ4xjfdcQYkSDH0cZkD+a0KE=', 1, N'MFGe67H8Mci3mQs7iq8gpQ==', NULL, N'ogazitt@gmail.com', N'ogazitt@gmail.com', NULL, NULL, 1, 0, CAST(0x00009F57006015A8 AS DateTime), CAST(0x00009F57006015A8 AS DateTime), CAST(0x00009F57006015A8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'2b89ecf6-03b8-4565-829b-c8fcbc21408d', N'26bdb734-b100-49fe-943c-d36c83966812', N'u+HkDHywZprMhGnP0Q1cSdblDKQ=', 1, N'MTJmgtOaz91m0ZDtDPG6WA==', NULL, N'ogazitt@gmail.com', N'ogazitt@gmail.com', NULL, NULL, 1, 0, CAST(0x00009F570067FD7C AS DateTime), CAST(0x00009F5E0182773B AS DateTime), CAST(0x00009F570067FD7C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 09/14/2011 20:07:25 ******/
/****** Object:  Table [dbo].[Tasks]    Script Date: 09/14/2011 20:07:25 ******/
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'aa8a6f9d-2331-437c-8042-14a3d571d5a1', N'0c0d6e3b-432c-4cff-a600-51989fd40933', N'ping qi', 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F530189CDB1 AS DateTime), CAST(0x00009F5301219F29 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'9755a1a4-a325-401b-84fe-307133a30d22', N'c2a8556f-8c02-429a-976a-49c8262d1904', N'ignore everybody', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x00009F540008AB3D AS DateTime), CAST(0x00009F530122E823 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'a8f45090-1d32-43db-a67d-309b4a7f52dc', N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'milk', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F530164173C AS DateTime), CAST(0x00009F5300F2A1AA AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'53e14699-2957-457f-bcee-35318a92f729', N'fd6a1556-5457-4e44-852c-fe487f718fb1', N'set up time with stas', 2, NULL, CAST(0x070000000000B2340B0000 AS DateTimeOffset), 0, NULL, NULL, NULL, NULL, CAST(0x00009F57008909E9 AS DateTime), CAST(0x00009F560180DCCC AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'1849cdba-7ece-4fb2-a878-468ef5fbfe23', N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'cereal', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F47015432F2 AS DateTime), CAST(0x00009F47015432F2 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'43cb7cee-7a20-47b7-968b-4a905084f5af', N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'fruit', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F4B005E37A6 AS DateTime), CAST(0x00009F4B005E37A6 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'd726147d-9d23-4e8c-b8fd-542489bec2e7', N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'bread', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F47013860BD AS DateTime), CAST(0x00009F47013860BD AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'a03c676a-906f-4d76-8822-6b93d14d49ac', N'70d36af8-42a0-4397-8f3e-257c1609bb7e', N'oj', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x00009F470137E41F AS DateTime), CAST(0x00009F53010382EC AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'978aea7d-c0d6-4d10-8e10-6ce313280328', N'a5ec7c8b-e0af-487c-ae2b-428efa02b68b', N'Hi', NULL, NULL, CAST(0x0780C24520C5BA340B0000 AS DateTimeOffset), 0, NULL, NULL, NULL, NULL, CAST(0x00009F5E018388B9 AS DateTime), CAST(0x00009F5E018396D9 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'0a65f306-3a5e-4c2c-9696-7540c4628312', N'dd5651af-15c7-4c82-9a48-be5376368ccd', N'fruit', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F570067BF48 AS DateTime), CAST(0x00009F570067BF48 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'8efae302-af89-446e-a384-7b505c2397a7', N'dd5651af-15c7-4c82-9a48-be5376368ccd', N'cereal', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F570067B936 AS DateTime), CAST(0x00009F570067B936 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'e50ae74a-f5d9-420c-9d7b-8670e5b6608c', N'fd6a1556-5457-4e44-852c-fe487f718fb1', N'follow up with qi', 1, NULL, CAST(0x070000000000BE340B0000 AS DateTimeOffset), 0, NULL, NULL, NULL, NULL, CAST(0x00009F57008902C3 AS DateTime), CAST(0x00009F560180F6FC AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'd054af85-c2d2-4a8c-947d-8ae3b3c5459c', N'0c0d6e3b-432c-4cff-a600-51989fd40933', N'respond to stas', 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F54000109DD AS DateTime), CAST(0x00009F5301219B54 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'462c751e-b1bc-4e41-878f-8e4fe70b0b5d', N'fd6a1556-5457-4e44-852c-fe487f718fb1', N'follow up with brad', 2, NULL, CAST(0x070000000000B1340B0000 AS DateTimeOffset), 0, NULL, NULL, NULL, NULL, CAST(0x00009F570089060B AS DateTime), CAST(0x00009F5601810360 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'1165f1c9-a71c-4bb6-9807-a5610527aaa0', N'dd5651af-15c7-4c82-9a48-be5376368ccd', N'milk', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F570067AC6A AS DateTime), CAST(0x00009F570067AC6A AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'3aa67551-38d7-4e72-98c5-c1fb7a05e636', N'dd5651af-15c7-4c82-9a48-be5376368ccd', N'oj', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F570067B5EE AS DateTime), CAST(0x00009F570067B5EE AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'c670ef91-88e7-4622-970f-ceaef3014f6b', N'c2a8556f-8c02-429a-976a-49c8262d1904', N'the innovator''s solution', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x00009F5400082468 AS DateTime), CAST(0x00009F530122E9DD AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'bfae4ab0-4a2d-470e-b36d-db7186472353', N'a5ec7c8b-e0af-487c-ae2b-428efa02b68b', N'Welcome to TaskStore!', 0, N'Tap the browse button below to discover more about the TaskStore application.', CAST(0x070000000000B9340B0000 AS DateTimeOffset), 0, NULL, NULL, N'http://localhost:49489/Home/WelcomeWP7', NULL, CAST(0x00009F5E0182942F AS DateTime), CAST(0x00009F5E0182942F AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'68336a58-ce3e-4a2c-b50b-dcc7a10dfb8d', N'0c0d6e3b-432c-4cff-a600-51989fd40933', N'check out splunk', 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F5301891130 AS DateTime), CAST(0x00009F53012196D4 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'45a389a2-9853-4ff7-9ef9-df0fbfb72a68', N'dd5651af-15c7-4c82-9a48-be5376368ccd', N'bread', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F570067BB9D AS DateTime), CAST(0x00009F570067BB9D AS DateTime), NULL)
/****** Object:  Table [dbo].[TaskTags]    Script Date: 09/14/2011 20:07:25 ******/
