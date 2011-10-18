/****** Object:  Table [dbo].[Colors]    Script Date: 08/01/2011 00:09:51 ******/
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
/****** Object:  Table [dbo].[Actions]    Script Date: 08/01/2011 00:09:53 ******/
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
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 08/01/2011 00:09:56 ******/
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
/****** Object:  Table [dbo].[Priorities]    Script Date: 08/01/2011 00:09:59 ******/
SET IDENTITY_INSERT [dbo].[Priorities] ON
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (0, N'Low', N'Green')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (1, N'Normal', N'White')
INSERT [dbo].[Priorities] ([PriorityID], [Name], [Color]) VALUES (2, N'High', N'Red')
SET IDENTITY_INSERT [dbo].[Priorities] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 08/01/2011 00:10:01 ******/
INSERT [dbo].[Users] ([ID], [Name], [Password], [Email]) VALUES (N'cb8e65eb-dced-4c5e-985f-005b140448c1', N'foo', N'bar', N'foo@bar.com')
INSERT [dbo].[Users] ([ID], [Name], [Password], [Email]) VALUES (N'a6391275-982f-4e59-9b5a-959658e043fc', N'ogazitt@gmail.com', N'bar', N'ogazitt@gmail.com')
/****** Object:  Table [dbo].[Tags]    Script Date: 08/01/2011 00:10:03 ******/
INSERT [dbo].[Tags] ([ID], [Name], [UserID], [Color]) VALUES (N'b0593f20-6b3c-4dae-84a0-62284f05a040', N'Personal', N'a6391275-982f-4e59-9b5a-959658e043fc', N'Blue')
INSERT [dbo].[Tags] ([ID], [Name], [UserID], [Color]) VALUES (N'46e640f5-29c1-4204-8887-cd560517e0d7', N'Work', N'a6391275-982f-4e59-9b5a-959658e043fc', N'Red')
/****** Object:  Table [dbo].[ListTypes]    Script Date: 08/01/2011 00:10:04 ******/
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'14cda248-4116-4e51-ac13-00096b43418c', N'To Do', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'dc1c6243-e510-4297-9df8-75babd237fbe', N'Freeform', NULL)
INSERT [dbo].[ListTypes] ([ID], [Name], [UserID]) VALUES (N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'Shopping', NULL)
/****** Object:  Table [dbo].[Fields]    Script Date: 08/01/2011 00:10:06 ******/
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
/****** Object:  Table [dbo].[TaskLists]    Script Date: 08/01/2011 00:10:09 ******/
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'cf49fbfa-eaa8-4386-8598-0ee27f974611', N'Shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'a6391275-982f-4e59-9b5a-959658e043fc', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'77ed92a9-25e2-4740-92f3-4416a13ac561', N'To Do', N'14cda248-4116-4e51-ac13-00096b43418c', N'cb8e65eb-dced-4c5e-985f-005b140448c1', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'4b20f2d8-cd46-435e-9877-5318fd5e76d9', N'Recurring shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'a6391275-982f-4e59-9b5a-959658e043fc', 1)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'df5956ef-7f3a-4159-b192-7667c1a56d18', N'Shopping', N'1788a0c4-96e8-4b95-911a-75e1519d7259', N'cb8e65eb-dced-4c5e-985f-005b140448c1', 0)
INSERT [dbo].[TaskLists] ([ID], [Name], [ListTypeID], [UserID], [Template]) VALUES (N'40168c99-d394-47e3-8d52-83c9ee2a6ed2', N'To Do', N'14cda248-4116-4e51-ac13-00096b43418c', N'a6391275-982f-4e59-9b5a-959658e043fc', 0)
/****** Object:  Table [dbo].[Tasks]    Script Date: 08/01/2011 00:10:12 ******/
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'88b9aa47-c0db-4087-9679-060dccb1158f', N'4b20f2d8-cd46-435e-9877-5318fd5e76d9', N'Apples', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F2E002CE230 AS DateTime), CAST(0x00009F2E002CE230 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'15c48bc2-c5a8-43e3-a3cb-5fa579083c8f', N'40168c99-d394-47e3-8d52-83c9ee2a6ed2', N'Send marriage certificate ', 0, N'', CAST(0x8B340B00 AS Date), 1, NULL, NULL, N'www.taskstore.com/welcome', NULL, CAST(0x00009F30012815EF AS DateTime), CAST(0x00009F3100089209 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'ea1f32f8-320b-42cc-a0a7-6b0022be50ca', N'77ed92a9-25e2-4740-92f3-4416a13ac561', N'Welcome to TaskStore!', NULL, NULL, NULL, 0, NULL, NULL, N'http://taskstore.cloudapp.net:8080', NULL, CAST(0x00009F320054B8F9 AS DateTime), CAST(0x00009F320054B8F9 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'e76d0e2f-beab-4cef-8a34-7630decd75c7', N'4b20f2d8-cd46-435e-9877-5318fd5e76d9', N'Bread', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F2E002CD97D AS DateTime), CAST(0x00009F2E002CD97D AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'b8426272-51d3-46b6-ae9c-9628c4975a5e', N'4b20f2d8-cd46-435e-9877-5318fd5e76d9', N'Coke', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F2E002CE8AB AS DateTime), CAST(0x00009F2E002CE8AB AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'373705b7-4e1c-4ef4-b089-979903fb0bf8', N'40168c99-d394-47e3-8d52-83c9ee2a6ed2', N'Book: the gaping void', NULL, N'', NULL, 0, NULL, NULL, N'amazon.com', NULL, CAST(0x00009F2E00431DC0 AS DateTime), CAST(0x00009F3001287A9F AS DateTime), N'4b20f2d8-cd46-435e-9877-5318fd5e76d9')
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'2aa4df75-79cf-4fef-88c9-a901becd526f', N'4b20f2d8-cd46-435e-9877-5318fd5e76d9', N'OJ', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F2E002CD3F8 AS DateTime), CAST(0x00009F2E002CD3F8 AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'9fe8e841-e3f6-4acc-9f00-b5fca3aa68ed', N'4b20f2d8-cd46-435e-9877-5318fd5e76d9', N'Milk ', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F2E002CCE3E AS DateTime), CAST(0x00009F2E002CCE3E AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'd7cc4e66-5789-4d3b-94b9-d0ccb6b2d498', N'40168c99-d394-47e3-8d52-83c9ee2a6ed2', N'Book: todo lists', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, CAST(0x00009F2B018453C6 AS DateTime), CAST(0x00009F30006B709C AS DateTime), NULL)
INSERT [dbo].[Tasks] ([ID], [TaskListID], [Name], [PriorityID], [Description], [Due], [Complete], [Location], [Phone], [Website], [Email], [Created], [LastModified], [LinkedTaskListID]) VALUES (N'1e791e6d-698a-4cc3-a0b0-e42ad19bee1e', N'40168c99-d394-47e3-8d52-83c9ee2a6ed2', N'Marc assignment ', 2, N'', CAST(0x8A340B00 AS Date), 0, NULL, NULL, NULL, NULL, CAST(0x00009F2B0056106D AS DateTime), CAST(0x00009F30006ADA16 AS DateTime), NULL)
/****** Object:  Table [dbo].[TaskTags]    Script Date: 08/01/2011 00:10:17 ******/
INSERT [dbo].[TaskTags] ([ID], [TaskID], [TagID]) VALUES (N'4121f4b0-34d3-4efe-b733-6ba62dfa98f3', N'1e791e6d-698a-4cc3-a0b0-e42ad19bee1e', N'46e640f5-29c1-4204-8887-cd560517e0d7')
INSERT [dbo].[TaskTags] ([ID], [TaskID], [TagID]) VALUES (N'4e760e79-a791-4296-9913-9b5585f7edea', N'd7cc4e66-5789-4d3b-94b9-d0ccb6b2d498', N'46e640f5-29c1-4204-8887-cd560517e0d7')
INSERT [dbo].[TaskTags] ([ID], [TaskID], [TagID]) VALUES (N'eb36c186-0ca4-42d8-9623-cd2316a94411', N'15c48bc2-c5a8-43e3-a3cb-5fa579083c8f', N'b0593f20-6b3c-4dae-84a0-62284f05a040')
