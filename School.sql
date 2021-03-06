USE [18ip29]
GO
/****** Object:  Table [dbo].[dolznest]    Script Date: 29.11.2021 10:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dolznest](
	[ID_Dolz] [int] NOT NULL,
	[ID_Sotr] [int] NOT NULL,
	[nazvanie] [nchar](50) NULL,
	[kolichestvo chasov] [nchar](50) NULL,
 CONSTRAINT [PK_dolznest] PRIMARY KEY CLUSTERED 
(
	[ID_Dolz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOMRAB]    Script Date: 29.11.2021 10:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOMRAB](
	[ID_dz] [int] NOT NULL,
	[ID_Predmeta] [int] NOT NULL,
	[ID_Sotr] [int] NOT NULL,
	[ID_Kategoriya] [int] NOT NULL,
	[Zadanie] [nchar](100) NOT NULL,
	[data] [date] NOT NULL,
 CONSTRAINT [PK_DOMRAB] PRIMARY KEY CLUSTERED 
(
	[ID_dz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kabineti]    Script Date: 29.11.2021 10:22:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kabineti](
	[ID_kab] [int] NOT NULL,
	[nomer] [nchar](50) NULL,
	[kategoriya_kab] [nchar](50) NULL,
 CONSTRAINT [PK_kabineti] PRIMARY KEY CLUSTERED 
(
	[ID_kab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kategoriya]    Script Date: 29.11.2021 10:22:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategoriya](
	[ID_Kategoriya] [int] NOT NULL,
	[ID_kab] [int] NOT NULL,
	[Kategoriya_kab] [nchar](50) NULL,
 CONSTRAINT [PK_kategoriya] PRIMARY KEY CLUSTERED 
(
	[ID_Kategoriya] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 29.11.2021 10:22:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predmet](
	[ID_Predmeta] [int] NOT NULL,
	[Nazvanie] [nchar](50) NULL,
	[ID_sotr] [int] NOT NULL,
	[ID_Kab] [int] NOT NULL,
 CONSTRAINT [PK_Predmet] PRIMARY KEY CLUSTERED 
(
	[ID_Predmeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raspisanie]    Script Date: 29.11.2021 10:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raspisanie](
	[ID_Rasp] [int] NOT NULL,
	[ID_Predmeta] [int] NOT NULL,
	[Nazvanie_pred] [nchar](50) NULL,
 CONSTRAINT [PK_Raspisanie] PRIMARY KEY CLUSTERED 
(
	[ID_Rasp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotr]    Script Date: 29.11.2021 10:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotr](
	[ID_Sotr] [int] NOT NULL,
	[Name] [nchar](50) NULL,
	[Sname] [nchar](50) NULL,
	[Oname] [nchar](50) NULL,
	[adres] [nchar](20) NULL,
	[Nphone] [nchar](50) NULL,
	[kategoriya] [nchar](50) NULL,
	[ID_Dolz] [int] NOT NULL,
 CONSTRAINT [PK_Sotr] PRIMARY KEY CLUSTERED 
(
	[ID_Sotr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dolznest]  WITH CHECK ADD  CONSTRAINT [FK_dolznest_Sotr] FOREIGN KEY([ID_Sotr])
REFERENCES [dbo].[Sotr] ([ID_Sotr])
GO
ALTER TABLE [dbo].[dolznest] CHECK CONSTRAINT [FK_dolznest_Sotr]
GO
ALTER TABLE [dbo].[DOMRAB]  WITH CHECK ADD  CONSTRAINT [FK_DOMRAB_kategoriya] FOREIGN KEY([ID_Kategoriya])
REFERENCES [dbo].[kategoriya] ([ID_Kategoriya])
GO
ALTER TABLE [dbo].[DOMRAB] CHECK CONSTRAINT [FK_DOMRAB_kategoriya]
GO
ALTER TABLE [dbo].[DOMRAB]  WITH CHECK ADD  CONSTRAINT [FK_DOMRAB_Predmet] FOREIGN KEY([ID_Predmeta])
REFERENCES [dbo].[Predmet] ([ID_Predmeta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DOMRAB] CHECK CONSTRAINT [FK_DOMRAB_Predmet]
GO
ALTER TABLE [dbo].[DOMRAB]  WITH CHECK ADD  CONSTRAINT [FK_DOMRAB_Sotr] FOREIGN KEY([ID_Sotr])
REFERENCES [dbo].[Sotr] ([ID_Sotr])
GO
ALTER TABLE [dbo].[DOMRAB] CHECK CONSTRAINT [FK_DOMRAB_Sotr]
GO
ALTER TABLE [dbo].[kategoriya]  WITH CHECK ADD  CONSTRAINT [FK_kategoriya_kabineti] FOREIGN KEY([ID_kab])
REFERENCES [dbo].[kabineti] ([ID_kab])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[kategoriya] CHECK CONSTRAINT [FK_kategoriya_kabineti]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [FK_Predmet_kabineti] FOREIGN KEY([ID_Kab])
REFERENCES [dbo].[kabineti] ([ID_kab])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [FK_Predmet_kabineti]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [FK_Predmet_Sotr] FOREIGN KEY([ID_sotr])
REFERENCES [dbo].[Sotr] ([ID_Sotr])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [FK_Predmet_Sotr]
GO
ALTER TABLE [dbo].[Raspisanie]  WITH CHECK ADD  CONSTRAINT [FK_Raspisanie_Predmet] FOREIGN KEY([ID_Predmeta])
REFERENCES [dbo].[Predmet] ([ID_Predmeta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Raspisanie] CHECK CONSTRAINT [FK_Raspisanie_Predmet]
GO
ALTER TABLE [dbo].[Sotr]  WITH CHECK ADD  CONSTRAINT [FK_Sotr_dolznest] FOREIGN KEY([ID_Dolz])
REFERENCES [dbo].[dolznest] ([ID_Dolz])
GO
ALTER TABLE [dbo].[Sotr] CHECK CONSTRAINT [FK_Sotr_dolznest]
GO
