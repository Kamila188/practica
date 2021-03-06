USE [master]
GO
/****** Object:  Database [Аренда]    Script Date: 18.01.2022 13:37:35 ******/
CREATE DATABASE [Аренда]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Аренда', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Аренда.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Аренда_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Аренда_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Аренда] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Аренда].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Аренда] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Аренда] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Аренда] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Аренда] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Аренда] SET ARITHABORT OFF 
GO
ALTER DATABASE [Аренда] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Аренда] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Аренда] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Аренда] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Аренда] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Аренда] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Аренда] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Аренда] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Аренда] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Аренда] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Аренда] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Аренда] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Аренда] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Аренда] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Аренда] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Аренда] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Аренда] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Аренда] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Аренда] SET  MULTI_USER 
GO
ALTER DATABASE [Аренда] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Аренда] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Аренда] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Аренда] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Аренда] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Аренда] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Аренда] SET QUERY_STORE = OFF
GO
USE [Аренда]
GO
/****** Object:  Table [dbo].[Arenda]    Script Date: 18.01.2022 13:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arenda](
	[RentID] [int] NOT NULL,
	[RenterID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SC] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[EmployeeID] [int] NOT NULL,
	[Pavilion] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[StartRent] [date] NOT NULL,
	[EndRent] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arendators]    Script Date: 18.01.2022 13:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arendators](
	[RenterID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [decimal](18, 0) NULL,
	[Address] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 18.01.2022 13:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Image] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pavilions]    Script Date: 18.01.2022 13:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pavilions](
	[Name] [nvarchar](50) NOT NULL,
	[Pavilion] [nvarchar](50) NOT NULL,
	[Floor] [decimal](18, 0) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Square] [decimal](18, 0) NOT NULL,
	[PriceMeter] [money] NOT NULL,
	[AddedValue] [decimal](5, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC]    Script Date: 18.01.2022 13:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC](
	[Name] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[QuantityPavilion] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[AddedValue] [decimal](5, 2) NOT NULL,
	[Floor] [decimal](18, 0) NOT NULL,
	[Image] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (1, 2, N'Мега', N'Белая', N'Дача', 2, N'88А', N'Открыт', CAST(N'2019-01-24' AS Date), CAST(N'2020-11-17' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (2, 2, N'Авиапарк', N'', N'', 7, N'40А', N'Ожидание', CAST(N'2019-11-21' AS Date), CAST(N'2020-04-18' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (3, 5, N'Рио', N'', N'', 11, N'61А', N'Закрыт', CAST(N'2018-11-12' AS Date), CAST(N'2019-06-28' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (4, 1, N'Гранд', N'', N'', 2, N'58В', N'Закрыт', CAST(N'2018-10-18' AS Date), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (5, 5, N'Лужайка', N'', N'', 7, N'7А', N'Ожидание', CAST(N'2019-12-19' AS Date), CAST(N'2020-06-26' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (6, 2, N'Кунцево', N'Плаза', N'', 11, N'13Б', N'Ожидание', CAST(N'2019-12-16' AS Date), CAST(N'2020-05-12' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (7, 4, N'Мозаика', N'', N'', 2, N'60В', N'Ожидание', CAST(N'2019-12-06' AS Date), CAST(N'2020-10-16' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (8, 2, N'Гранд', N'', N'', 11, N'56А', N'Закрыт', CAST(N'2018-09-03' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (9, 2, N'Гранд', N'', N'', 2, N'63Г', N'Ожидание', CAST(N'2019-11-04' AS Date), CAST(N'2020-06-27' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (10, 4, N'Бутово', N'Молл', N'', 7, N'8Г', N'Закрыт', CAST(N'2018-11-08' AS Date), CAST(N'2019-01-16' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (11, 1, N'Гранд', N'', N'', 2, N'94В', N'Открыт', CAST(N'2019-06-07' AS Date), CAST(N'2020-03-18' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (12, 1, N'Шоколад', N'', N'', 2, N'87Г', N'Ожидание', CAST(N'2019-11-15' AS Date), CAST(N'2020-06-20' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (13, 5, N'АфиМолл', N'Сити', N'', 11, N'93В', N'Закрыт', CAST(N'2018-10-09' AS Date), CAST(N'2019-09-22' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (14, 5, N'Европейский', N'', N'', 7, N'10А', N'Ожидание', CAST(N'2019-11-24' AS Date), CAST(N'2020-07-17' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (15, 1, N'Шереметьевский', N'', N'', 7, N'53Г', N'Закрыт', CAST(N'2018-07-20' AS Date), CAST(N'2019-06-07' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (17, 2, N'Мега', N'Химки', N'', 2, N'89Б', N'Открыт', CAST(N'2019-08-06' AS Date), CAST(N'2020-08-20' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (18, 1, N'Золотой', N'Вавилон', N'Ростокино', 7, N'61Б', N'Открыт', CAST(N'2019-05-23' AS Date), CAST(N'2020-05-13' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (19, 3, N'Шереметьевский', N'', N'', 2, N'34Б', N'Ожидание', CAST(N'2019-12-16' AS Date), CAST(N'2020-03-16' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (20, 3, N'Шереметьевский', N'', N'', 11, N'91Г', N'Закрыт', CAST(N'2018-08-24' AS Date), CAST(N'2019-08-04' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (21, 5, N'Ашан', N'Сити', N'Капитолий', 2, N'70Г', N'Ожидание', CAST(N'2019-11-09' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (22, 4, N'Европейский', N'', N'', 7, N'10А', N'Ожидание', CAST(N'2019-12-02' AS Date), CAST(N'2020-07-24' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (23, 2, N'Филион', N'', N'', 11, N'80Г', N'Ожидание', CAST(N'2019-11-23' AS Date), CAST(N'2020-08-06' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (24, 4, N'Гудзон', N'', N'', 7, N'41А', N'Открыт', CAST(N'2019-05-02' AS Date), CAST(N'2020-06-24' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (25, 3, N'Кунцево', N'Плаза', N'', 2, N'13Б', N'Ожидание', CAST(N'2019-12-08' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (26, 3, N'Хорошо', N'', N'', 7, N'83Г', N'Закрыт', CAST(N'2018-11-14' AS Date), CAST(N'2019-04-19' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (27, 4, N'Щука', N'', N'', 11, N'9Г', N'Ожидание', CAST(N'2019-12-26' AS Date), CAST(N'2020-09-13' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (28, 1, N'Атриум', N'', N'', 2, N'49Г', N'Закрыт', CAST(N'2018-09-16' AS Date), CAST(N'2019-02-12' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (29, 3, N'Золотой', N'Вавилон', N'Ростокино', 2, N'37А', N'Закрыт', CAST(N'2018-10-18' AS Date), CAST(N'2019-06-22' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (30, 4, N'Золотой', N'Вавилон', N'Ростокино', 2, N'38Г', N'Закрыт', CAST(N'2018-06-23' AS Date), CAST(N'2019-08-26' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (31, 3, N'Реутов', N'Парк', N'', 11, N'27В', N'Ожидание', CAST(N'2019-12-18' AS Date), CAST(N'2020-05-23' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (32, 5, N'ГУМ', N'', N'', 7, N'86Г', N'Открыт', CAST(N'2019-04-01' AS Date), CAST(N'2020-12-19' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (33, 4, N'Райкин', N'Плаза', N'', 11, N'98А', N'Ожидание', CAST(N'2019-11-22' AS Date), CAST(N'2020-08-15' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (34, 3, N'Новинский', N'пассаж', N'', 11, N'11Г', N'Закрыт', CAST(N'2018-10-08' AS Date), CAST(N'2019-07-21' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (35, 2, N'Фестиваль', N'', N'', 2, N'42В', N'Открыт', CAST(N'2019-04-07' AS Date), CAST(N'2020-03-05' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (36, 1, N'Красный', N'Кит', N'', 7, N'55А', N'Ожидание', CAST(N'2019-11-07' AS Date), CAST(N'2020-03-08' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (37, 3, N'Фестиваль', N'', N'', 2, N'6Б', N'Открыт', CAST(N'2019-07-15' AS Date), CAST(N'2020-04-25' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (39, 4, N'Фестиваль', N'', N'', 11, N'27Б', N'Закрыт', CAST(N'2018-08-05' AS Date), CAST(N'2019-06-14' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (40, 2, N'Времена', N'Года', N'', 11, N'26А', N'Открыт', CAST(N'2019-08-19' AS Date), CAST(N'2020-09-02' AS Date))
INSERT [dbo].[Arenda] ([RentID], [RenterID], [Name], [SC], [Location], [EmployeeID], [Pavilion], [Status], [StartRent], [EndRent]) VALUES (41, 4, N'Времена', N'Года', N'', 7, N'53В', N'Закрыт', CAST(N'2018-09-20' AS Date), CAST(N'2019-02-12' AS Date))
GO
INSERT [dbo].[Arendators] ([RenterID], [Name], [Phone], [Address]) VALUES (1, N'AG Marine', NULL, N'Москва, Бабаевская улица д.16')
INSERT [dbo].[Arendators] ([RenterID], [Name], [Phone], [Address]) VALUES (2, N'Art-elle', NULL, N'Санкт-Петербург, Амбарная улица д.25 корп.1')
INSERT [dbo].[Arendators] ([RenterID], [Name], [Phone], [Address]) VALUES (3, N'Atlantis', NULL, N'Новосибирск, Улица Каменская д.16')
INSERT [dbo].[Arendators] ([RenterID], [Name], [Phone], [Address]) VALUES (4, N'Corporate Travel', NULL, N'Екатеринбург, Улица Антона Валека д.56')
INSERT [dbo].[Arendators] ([RenterID], [Name], [Phone], [Address]) VALUES (5, N'GallaDance', NULL, N'Нижний Новгород, Улица Ларина д. 34')
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (1, N'Чашин Елизар Михеевич', N'Elizor@gmai.com', N'yntiRS', N'Администратор', N'+7(1070)628 29 16', N'Мужской', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (2, N'Филенкова Владлена Олеговна', N'Vladlena@gmai.com', N'07i7Lb', N'Менеджер А', N'+7(334)1460151', N'Женский', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (3, N'Ломовцев Адам Владимирович', N'Adam@gmai.com', N'7SP9CV', N'Менеджер С', N'+7(8560)519-32-99', N'Мужской', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (4, N'Тепляков Кир Федосиевич', N'Kar@gmai.com', N'6QF1WB', N'Удален', N'+7(824)893-24-03', N'Мужской', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (5, N'Рюриков Юлий Глебович', N'Yli@gmai.com', N'GwffgE', N'Администратор', N'+7(6402)701-31-09', N'Мужской', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (6, N'Беломестина Василиса Тимофеевна', N'Vasilisa@gmai.com', N'd7iKKV', N'Администратор', N'+7(92)920-74-47', N'Женский', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (7, N'Панькива Галина Якововна', N'Galina@gmai.com', N'8KC7wJ', N'Менеджер А', N'+7 (405) 088 73 89', N'Женский', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (8, N'Зарубин Мирон Мечиславович', N'Miron@gmai.com', N'x58OAN', N'Администратор', N'+7(6010)195-02-09', N'Мужской', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (9, N'Веточкина Всеслава Андрияновна', N'Vseslava@gmai.com', N'fhDSBf', N'Менеджер С', N'+7(078)429-57-86', N'Женский', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (10, N'Рябова Виктория Елизаровна', N'Victoria@gmai.com', N'9mlPQJ', N'Удален', N'+7(6394)904-01-61', N'Женский', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (11, N'Федотов Леон Фёдорович', N'Anisa@gmai.com', N'Wh4OYm', N'Менеджер А', N'+7(22)3264959', N'Мужской', NULL)
INSERT [dbo].[Employee] ([ID], [FullName], [Login], [Password], [Position], [Phone], [Gender], [Image]) VALUES (12, N'Шарапов Феофан Кириллович', N'Feafan@gmai.com', N'Kc1PeS', N'Менеджер С', N'+7(789)762-30-28', N'Мужской', NULL)
GO
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Мега Белая Дача', N'88А', CAST(1 AS Decimal(18, 0)), N'Свободен', CAST(75 AS Decimal(18, 0)), 3308.0000, CAST(0.10 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Авиапарк', N'40А', CAST(3 AS Decimal(18, 0)), N'Забронировано', CAST(96 AS Decimal(18, 0)), 690.0000, CAST(1.10 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Мега Белая Дача', N'76Б', CAST(2 AS Decimal(18, 0)), N'Удален', CAST(199 AS Decimal(18, 0)), 4938.0000, CAST(0.90 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Рио', N'61А', CAST(1 AS Decimal(18, 0)), N'Арендован', CAST(186 AS Decimal(18, 0)), 2115.0000, CAST(0.90 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Гранд', N'58В', CAST(4 AS Decimal(18, 0)), N'Арендован', CAST(98 AS Decimal(18, 0)), 1306.0000, CAST(1.90 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Лужайка', N'7А', CAST(2 AS Decimal(18, 0)), N'Забронировано', CAST(187 AS Decimal(18, 0)), 2046.0000, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Кунцево Плаза', N'13Б', CAST(1 AS Decimal(18, 0)), N'Забронировано', CAST(141 AS Decimal(18, 0)), 1131.0000, CAST(0.10 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Мозаика', N'60В', CAST(2 AS Decimal(18, 0)), N'Забронировано', CAST(94 AS Decimal(18, 0)), 361.0000, CAST(0.30 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Гранд', N'56А', CAST(1 AS Decimal(18, 0)), N'Арендован', CAST(148 AS Decimal(18, 0)), 1163.0000, CAST(0.60 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Гранд', N'63Г', CAST(2 AS Decimal(18, 0)), N'Забронировано', CAST(153 AS Decimal(18, 0)), 3486.0000, CAST(0.70 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Бутово Молл', N'8Г', CAST(1 AS Decimal(18, 0)), N'Арендован', CAST(122 AS Decimal(18, 0)), 2451.0000, CAST(1.50 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Гранд', N'94В', CAST(3 AS Decimal(18, 0)), N'Свободен', CAST(132 AS Decimal(18, 0)), 4825.0000, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Шоколад', N'87Г', CAST(1 AS Decimal(18, 0)), N'Забронировано', CAST(174 AS Decimal(18, 0)), 793.0000, CAST(1.50 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'АфиМолл Сити', N'93В', CAST(1 AS Decimal(18, 0)), N'Арендован', CAST(165 AS Decimal(18, 0)), 4937.0000, CAST(0.80 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Европейский', N'10А', CAST(3 AS Decimal(18, 0)), N'Забронировано', CAST(168 AS Decimal(18, 0)), 1353.0000, CAST(1.70 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Шереметьевский', N'53Г', CAST(1 AS Decimal(18, 0)), N'Арендован', CAST(99 AS Decimal(18, 0)), 3924.0000, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Шереметьевский', N'73В', CAST(2 AS Decimal(18, 0)), N'Свободен', CAST(116 AS Decimal(18, 0)), 3418.0000, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Мега Химки', N'89Б', CAST(1 AS Decimal(18, 0)), N'Свободен', CAST(92 AS Decimal(18, 0)), 562.0000, CAST(0.40 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Вегас Кунцево', N'65А', CAST(2 AS Decimal(18, 0)), N'Забронирован', CAST(95 AS Decimal(18, 0)), 1381.0000, CAST(1.70 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Город Лефортово', N'16Г', CAST(2 AS Decimal(18, 0)), N'Удален', CAST(150 AS Decimal(18, 0)), 747.0000, CAST(0.80 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Золотой Вавилон Ростокино', N'61Б', CAST(1 AS Decimal(18, 0)), N'Свободен', CAST(58 AS Decimal(18, 0)), 1032.0000, CAST(1.70 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Шереметьевский', N'34Б', CAST(4 AS Decimal(18, 0)), N'Забронировано', CAST(102 AS Decimal(18, 0)), 4715.0000, CAST(0.30 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Шереметьевский', N'91Г', CAST(3 AS Decimal(18, 0)), N'Арендован', CAST(171 AS Decimal(18, 0)), 1021.0000, CAST(1.20 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Ашан Сити Капитолий', N'70Г', CAST(1 AS Decimal(18, 0)), N'Забронировано', CAST(83 AS Decimal(18, 0)), 2246.0000, CAST(1.40 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Черемушки', N'10А', CAST(1 AS Decimal(18, 0)), N'Забронирован', CAST(187 AS Decimal(18, 0)), 2067.0000, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Филион', N'80Г', CAST(1 AS Decimal(18, 0)), N'Забронировано', CAST(117 AS Decimal(18, 0)), 1049.0000, CAST(1.30 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Весна', N'2Б', CAST(1 AS Decimal(18, 0)), N'Удален', CAST(176 AS Decimal(18, 0)), 1673.0000, CAST(1.70 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Гудзон', N'41А', CAST(1 AS Decimal(18, 0)), N'Свободен', CAST(108 AS Decimal(18, 0)), 344.0000, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Калейдоскоп', N'16Г', CAST(2 AS Decimal(18, 0)), N'Арендован', CAST(125 AS Decimal(18, 0)), 1037.0000, CAST(1.30 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Щука', N'9Г', CAST(1 AS Decimal(18, 0)), N'Забронировано', CAST(131 AS Decimal(18, 0)), 2477.0000, CAST(1.50 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Атриум', N'49Г', CAST(1 AS Decimal(18, 0)), N'Арендован', CAST(164 AS Decimal(18, 0)), 2728.0000, CAST(0.90 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Принц Плаза', N'1Г', CAST(1 AS Decimal(18, 0)), N'Удален', CAST(157 AS Decimal(18, 0)), 1963.0000, CAST(1.60 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Золотой Вавилон Ростокино', N'37А', CAST(3 AS Decimal(18, 0)), N'Арендован', CAST(187 AS Decimal(18, 0)), 3173.0000, CAST(0.30 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Золотой Вавилон Ростокино', N'38Г', CAST(4 AS Decimal(18, 0)), N'Арендован', CAST(97 AS Decimal(18, 0)), 1364.0000, CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Реутов Парк', N'27В', CAST(1 AS Decimal(18, 0)), N'Забронировано', CAST(96 AS Decimal(18, 0)), 3134.0000, CAST(0.10 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'ЕвроПарк', N'67Б', CAST(1 AS Decimal(18, 0)), N'Удален', CAST(55 AS Decimal(18, 0)), 4442.0000, CAST(0.80 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'ГУМ', N'86Г', CAST(1 AS Decimal(18, 0)), N'Свободен', CAST(58 AS Decimal(18, 0)), 3707.0000, CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Райкин Плаза', N'98А', CAST(3 AS Decimal(18, 0)), N'Забронировано', CAST(173 AS Decimal(18, 0)), 4951.0000, CAST(1.10 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Новинский пассаж', N'11Г', CAST(2 AS Decimal(18, 0)), N'Арендован', CAST(194 AS Decimal(18, 0)), 827.0000, CAST(0.60 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Фестиваль', N'42В', CAST(1 AS Decimal(18, 0)), N'Свободен', CAST(166 AS Decimal(18, 0)), 4216.0000, CAST(0.70 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Красный Кит', N'55А', CAST(2 AS Decimal(18, 0)), N'Забронировано', CAST(127 AS Decimal(18, 0)), 703.0000, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Фестиваль', N'6Б', CAST(2 AS Decimal(18, 0)), N'Свободен', CAST(119 AS Decimal(18, 0)), 3262.0000, CAST(1.90 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Отрада', N'15А', CAST(1 AS Decimal(18, 0)), N'Забронировано', CAST(90 AS Decimal(18, 0)), 1569.0000, CAST(1.30 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Фестиваль', N'27Б', CAST(3 AS Decimal(18, 0)), N'Арендован', CAST(132 AS Decimal(18, 0)), 627.0000, CAST(0.40 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Фестиваль', N'65Б', CAST(4 AS Decimal(18, 0)), N'Удален', CAST(60 AS Decimal(18, 0)), 3052.0000, CAST(0.60 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Времена Года', N'26А', CAST(1 AS Decimal(18, 0)), N'Свободен', CAST(95 AS Decimal(18, 0)), 670.0000, CAST(1.70 AS Decimal(5, 2)))
INSERT [dbo].[Pavilions] ([Name], [Pavilion], [Floor], [Status], [Square], [PriceMeter], [AddedValue]) VALUES (N'Времена Года', N'53В', CAST(3 AS Decimal(18, 0)), N'Арендован', CAST(132 AS Decimal(18, 0)), 510.0000, CAST(1.20 AS Decimal(5, 2)))
GO
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Ривьера', N'План', 0, N'Москва', 8260042.0000, CAST(0.50 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Авиапарк', N'Строительсто', 9, N'Санкт-Петербург', 3297976.0000, CAST(0.10 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Мега Белая Дача', N'Удален', 16, N'Новосибирск', 9006645.0000, CAST(1.70 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Рио', N'Реализация', 5, N'Екатеринбург', 1888653.0000, CAST(0.50 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Лужайка', N'Строительсто', 10, N'Казань', 4603336.0000, CAST(0.80 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Кунцево Плаза', N'Строительсто', 8, N'Челябинск', 6797653.0000, CAST(1.10 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Мозаика', N'Строительсто', 20, N'Самара', 1429419.0000, CAST(0.00 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Океания', N'План', 0, N'Самара', 5192089.0000, CAST(1.80 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Гранд', N'Строительсто', 20, N'Ростов-на-Дону ', 2573981.0000, CAST(0.10 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Бутово Молл', N'План', 0, N'Москва', 5327641.0000, CAST(1.70 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Шоколад', N'Строительсто', 12, N'Челябинск', 2217279.0000, CAST(1.10 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'АфиМолл Сити', N'Реализация', 9, N'Санкт-Петербург', 8729160.0000, CAST(0.90 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Европейский', N'Строительсто', 9, N'Москва', 5690500.0000, CAST(0.70 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Гагаринский', N'План', 0, N'Екатеринбург', 1508807.0000, CAST(1.60 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Метрополис', N'План', 0, N'Санкт-Петербург', 8117913.0000, CAST(0.00 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Мега Химки', N'Реализация', 3, N'Нижний Новгород', 3373234.0000, CAST(0.40 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Москва', N'Реализация', 12, N'Москва', 4226505.0000, CAST(0.30 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Вегас Кунцево', N'Реализация', 12, N'Москва', 3878254.0000, CAST(0.20 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Город Лефортово', N'Удален', 12, N'Новосибирск', 1966214.0000, CAST(1.70 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Золотой Вавилон Ростокино', N'Реализация', 16, N'Екатеринбург', 1632702.0000, CAST(1.80 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Шереметьевский', N'Строительсто', 16, N'Новосибирск', 2941379.0000, CAST(1.00 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Ханой-Москва', N'План', 0, N'Самара', 9580221.0000, CAST(0.30 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Ашан Сити Капитолий', N'Строительсто', 4, N'Екатеринбург', 5309117.0000, CAST(1.90 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Черемушки', N'Реализация', 15, N'Новосибирск', 7344604.0000, CAST(1.00 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Филион', N'Строительсто', 8, N'Москва', 5343904.0000, CAST(0.30 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N' Весна', N'Удален', 3, N'Нижний Новгород', 4687701.0000, CAST(0.80 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N' Гудзон', N'Реализация', 3, N'Екатеринбург', 7414460.0000, CAST(0.00 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Калейдоскоп', N'Реализация', 10, N'Новосибирск', 7847659.0000, CAST(0.70 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Новомосковский', N'План', 0, N'Казань', 7161962.8500, CAST(0.40 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Щука', N'Строительсто', 5, N'Нижний Новгород', 5428485.0000, CAST(0.40 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Атриум', N'Реализация', 4, N'г. Казань', 5059779.0000, CAST(0.20 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Принц Плаза', N'Реализация', 8, N'Самара', 1786688.0000, CAST(1.50 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Облака', N'План', 0, N'Санкт-Петербург', 1688905.0000, CAST(0.60 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Три Кита', N'План', 0, N'Казань', 3089700.0000, CAST(1.70 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Реутов Парк', N'Строительсто', 4, N'Ростов-на-Дону ', 1995904.0000, CAST(1.50 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'ЕвроПарк', N'Удален', 20, N'Новосибирск', 9391338.0000, CAST(0.70 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'ГУМ', N'Реализация', 5, N'Санкт-Петербург', 6731491.0000, CAST(1.90 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Райкин Плаза', N'Строительсто', 12, N'Санкт-Петербург', 8498470.0000, CAST(1.80 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Новинский пассаж', N'Реализация', 8, N'Екатеринбург', 3158957.0000, CAST(1.70 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Наш Гипермаркет', N'План', 0, N'Ростов-на-Дону ', 1088735.0000, CAST(1.20 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Красный Кит', N'Строительсто', 9, N'Казань', 1912149.0000, CAST(1.10 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Мегаполис', N'План', 0, N'Челябинск', 2175218.5000, CAST(0.50 AS Decimal(5, 2)), CAST(2 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Отрада', N'Строительсто', 4, N'Санкт-Петербург', 6760316.0000, CAST(0.90 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Твой дом', N'План', 0, N'Челябинск', 6810865.0000, CAST(1.70 AS Decimal(5, 2)), CAST(4 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N'Времена Года', N'Реализация', 15, N'Екатеринбург', 2650484.0000, CAST(1.70 AS Decimal(5, 2)), CAST(3 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SC] ([Name], [Status], [QuantityPavilion], [City], [Price], [AddedValue], [Floor], [Image]) VALUES (N' Армада', N'План', 0, N'Ростов-на-Дону ', 9172489.0000, CAST(0.90 AS Decimal(5, 2)), CAST(1 AS Decimal(18, 0)), NULL)
GO
USE [master]
GO
ALTER DATABASE [Аренда] SET  READ_WRITE 
GO
