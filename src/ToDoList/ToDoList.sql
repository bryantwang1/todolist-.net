USE [ToDoList]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/7/2017 4:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoriesItems]    Script Date: 2/7/2017 4:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_CategoriesItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 2/7/2017 4:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemsPriorities]    Script Date: 2/7/2017 4:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsPriorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[PriorityId] [int] NOT NULL,
 CONSTRAINT [PK_ItemsPriorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 2/7/2017 4:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Priorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Description]) VALUES (1, N'Stuff to do')
INSERT [dbo].[Categories] ([Id], [Description]) VALUES (2, N'Stuffer to do')
INSERT [dbo].[Categories] ([Id], [Description]) VALUES (3, N'Stuffiest to do')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[CategoriesItems] ON 

INSERT [dbo].[CategoriesItems] ([Id], [CategoryId], [ItemId]) VALUES (1, 1, 1)
INSERT [dbo].[CategoriesItems] ([Id], [CategoryId], [ItemId]) VALUES (2, 1, 2)
INSERT [dbo].[CategoriesItems] ([Id], [CategoryId], [ItemId]) VALUES (3, 1, 3)
INSERT [dbo].[CategoriesItems] ([Id], [CategoryId], [ItemId]) VALUES (4, 2, 1)
INSERT [dbo].[CategoriesItems] ([Id], [CategoryId], [ItemId]) VALUES (5, 3, 1)
SET IDENTITY_INSERT [dbo].[CategoriesItems] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [Description]) VALUES (1, N'Something to be done')
INSERT [dbo].[Items] ([Id], [Description]) VALUES (2, N'Thing')
INSERT [dbo].[Items] ([Id], [Description]) VALUES (3, N'Thingy')
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[ItemsPriorities] ON 

INSERT [dbo].[ItemsPriorities] ([Id], [ItemId], [PriorityId]) VALUES (1, 1, 1)
INSERT [dbo].[ItemsPriorities] ([Id], [ItemId], [PriorityId]) VALUES (2, 1, 2)
INSERT [dbo].[ItemsPriorities] ([Id], [ItemId], [PriorityId]) VALUES (3, 1, 3)
SET IDENTITY_INSERT [dbo].[ItemsPriorities] OFF
SET IDENTITY_INSERT [dbo].[Priorities] ON 

INSERT [dbo].[Priorities] ([Id], [Rating]) VALUES (1, 1)
INSERT [dbo].[Priorities] ([Id], [Rating]) VALUES (2, 2)
INSERT [dbo].[Priorities] ([Id], [Rating]) VALUES (3, 3)
INSERT [dbo].[Priorities] ([Id], [Rating]) VALUES (4, 4)
INSERT [dbo].[Priorities] ([Id], [Rating]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[Priorities] OFF
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[CategoriesItems]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesItems_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoriesItems] CHECK CONSTRAINT [FK_CategoriesItems_Categories]
GO
ALTER TABLE [dbo].[CategoriesItems]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesItems_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoriesItems] CHECK CONSTRAINT [FK_CategoriesItems_Items]
GO
ALTER TABLE [dbo].[ItemsPriorities]  WITH CHECK ADD  CONSTRAINT [FK_ItemsPriorities_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[ItemsPriorities] CHECK CONSTRAINT [FK_ItemsPriorities_Items]
GO
ALTER TABLE [dbo].[ItemsPriorities]  WITH CHECK ADD  CONSTRAINT [FK_ItemsPriorities_Priorities] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[Priorities] ([Id])
GO
ALTER TABLE [dbo].[ItemsPriorities] CHECK CONSTRAINT [FK_ItemsPriorities_Priorities]
GO
