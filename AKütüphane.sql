USE [master]
GO
/****** Object:  Database [AKütüphane]    Script Date: 13.04.2023 12:34:58 ******/
CREATE DATABASE [AKütüphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AKütüphane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AKütüphane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AKütüphane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AKütüphane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AKütüphane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AKütüphane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AKütüphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AKütüphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AKütüphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AKütüphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AKütüphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [AKütüphane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AKütüphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AKütüphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AKütüphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AKütüphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AKütüphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AKütüphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AKütüphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AKütüphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AKütüphane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AKütüphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AKütüphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AKütüphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AKütüphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AKütüphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AKütüphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AKütüphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AKütüphane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AKütüphane] SET  MULTI_USER 
GO
ALTER DATABASE [AKütüphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AKütüphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AKütüphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AKütüphane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AKütüphane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AKütüphane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AKütüphane] SET QUERY_STORE = ON
GO
ALTER DATABASE [AKütüphane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AKütüphane]
GO
/****** Object:  Table [dbo].[Kitap]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitap](
	[KitapNo] [int] IDENTITY(1,1) NOT NULL,
	[KitapAd] [varchar](50) NULL,
	[Yazar] [varchar](50) NULL,
	[Turu] [varchar](50) NULL,
	[RafKodu] [varchar](50) NULL,
	[BaskiYili] [varchar](50) NULL,
	[Sayfa] [int] NULL,
	[Yayinevi] [varchar](50) NULL,
	[Dil] [varchar](50) NULL,
 CONSTRAINT [PK_Kitap] PRIMARY KEY CLUSTERED 
(
	[KitapNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAd] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[AdSoyad] [varchar](50) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uye]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uye](
	[UyeNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
 CONSTRAINT [PK_Uye] PRIMARY KEY CLUSTERED 
(
	[UyeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerilenKitap]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerilenKitap](
	[İslemNo] [int] IDENTITY(1,1) NOT NULL,
	[UNo] [int] NULL,
	[KNo] [int] NULL,
	[KisiAd] [varchar](50) NULL,
	[KitapAd] [varchar](50) NULL,
	[RafKodu] [varchar](50) NULL,
	[VerilisT] [datetime] NULL,
	[İadeT] [datetime] NULL,
	[KitapDurumu] [varchar](50) NULL,
 CONSTRAINT [PK_VerilenKitap] PRIMARY KEY CLUSTERED 
(
	[İslemNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kitap] ON 

INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (2, N'Ayşe Tatilde', N'Ayşe Gül', N'Roman', N'A3', N'2001', 75, N'çiçekli bahçe', N'Türkçe')
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (3, N'Son Ada', N'Zülfü Livaneli', N'Roman', N'A5', N'2020', 168, N'İnkilap', N'Türkçe')
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (4, N'Fareler ve İnsanlar', N'John Steinbeck', N'Roman', N'A6', N'2012', 111, N'Sel', NULL)
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (5, N'Doğu Ekspresi''nde Cinayet', N'Agatha Christie', N'Roman', N'A3', N'2007', 90, N'Altın', N'Türkçe')
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (6, N'1984', N'George Orwell', N'Roman', N'A4', N'2000', 352, N'can', N'türkçe')
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (7, N'Kürk Mantolu Madonna', N'Sabahattin Ali', N'Roman', N'A2', N'1998', 160, N'YKY', NULL)
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (8, N'Bilinmeyen Bir Kadının Mektubu', N'Stefan Zweig', N'Roman', N'A4', N'2022', 56, N'Türkiye İş Bankası', N'Türkçe')
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (9, N'Şeker Portakalı', N'Jose Mauro De Vasconcelos', N'Roman', N'A6', N'2000', 200, N'Can', N'Türkçe')
INSERT [dbo].[Kitap] ([KitapNo], [KitapAd], [Yazar], [Turu], [RafKodu], [BaskiYili], [Sayfa], [Yayinevi], [Dil]) VALUES (10, N'ghfjk', N'fjkf', N'fjh', N'hj', N'4524', 45, N'bhlşb', N'bklş')
SET IDENTITY_INSERT [dbo].[Kitap] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad]) VALUES (1, N'admin', N'1234', N'aleyna')
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad]) VALUES (2, N'admin1', N'123', N'mustf')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Uye] ON 

INSERT [dbo].[Uye] ([UyeNo], [AdSoyad], [Mail], [Adres], [Tel]) VALUES (1, N'Aleyna', N'aleyna.ari@hotmail.com', N'şile', N'535915531')
INSERT [dbo].[Uye] ([UyeNo], [AdSoyad], [Mail], [Adres], [Tel]) VALUES (2, N'Mustafa', N'mustafa@gmail.com', N'beyolu', N'5165651')
INSERT [dbo].[Uye] ([UyeNo], [AdSoyad], [Mail], [Adres], [Tel]) VALUES (5, N'ece', N'ece@gmail.com', N'üsküdar', N'535151')
INSERT [dbo].[Uye] ([UyeNo], [AdSoyad], [Mail], [Adres], [Tel]) VALUES (6, N'Elif', N'elif@gmail', N'şile', N'58645515')
SET IDENTITY_INSERT [dbo].[Uye] OFF
GO
SET IDENTITY_INSERT [dbo].[VerilenKitap] ON 

INSERT [dbo].[VerilenKitap] ([İslemNo], [UNo], [KNo], [KisiAd], [KitapAd], [RafKodu], [VerilisT], [İadeT], [KitapDurumu]) VALUES (1, 1, 1, N'yyyyyy', N'kjlş', N'78', CAST(N'2010-02-02T00:00:00.000' AS DateTime), CAST(N'2010-04-03T00:00:00.000' AS DateTime), N'hasarlı')
SET IDENTITY_INSERT [dbo].[VerilenKitap] OFF
GO
/****** Object:  StoredProcedure [dbo].[Giris]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Giris] 
@kad varchar(50),
@sifre varchar(50)
as begin 
select * from Kullanici where 
	KullaniciAd = @kad and Sifre = @sifre
end
GO
/****** Object:  StoredProcedure [dbo].[KAra]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KAra]
@KitapAd varchar(50)
as begin
select * from Kitap where KitapAd=@KitapAd
end
GO
/****** Object:  StoredProcedure [dbo].[KEkle]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KEkle]
@KitapAd varchar(50),
@Yazar varchar(50),
@Turu varchar(50),
@RafKodu varchar(50),
@BaskiYili varchar(50),
@Sayfa int,
@Yayinevi varchar(50),
@Dil varchar(50)
as begin 
insert into Kitap (KitapAd, Yazar, Turu, RafKodu,BaskiYili,Sayfa,Yayinevi,Dil)
	values (@KitapAd, @Yazar, @Turu, @RafKodu,@BaskiYili,@Sayfa,@Yayinevi,@Dil)
end
GO
/****** Object:  StoredProcedure [dbo].[KGuncelle]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KGuncelle]
@KitapNo int,
@KitapAd varchar(50),
@Yazar varchar(50),
@Turu varchar(50),
@RafKodu varchar(50),
@BaskiYili varchar(50),
@Sayfa int,
@Yayinevi varchar(50),
@Dil varchar(50)
as begin 
update Kitap set 
	KitapAd=@KitapAd, Yazar=@Yazar, Turu=@Turu, RafKodu=@RafKodu,BaskiYili=@BaskiYili,Sayfa=@Sayfa,Yayinevi=@Yayinevi,Dil=@Dil where KitapNo=@KitapNo
end
GO
/****** Object:  StoredProcedure [dbo].[KListele]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KListele]
as begin 
select * from Kitap
end
GO
/****** Object:  StoredProcedure [dbo].[KSil]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KSil]
@KitapNo int
as begin 
delete from Kitap where KitapNo=@KitapNo
end
GO
/****** Object:  StoredProcedure [dbo].[KulaniciEkle]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KulaniciEkle]
@KullaniciAd varchar(50),
@Sifre varchar(50),
@AdSoyad varchar(50)
as begin
insert into Kullanici (KullaniciAd,Sifre,AdSoyad)
	values (@KullaniciAd,@Sifre,@AdSoyad)
end
GO
/****** Object:  StoredProcedure [dbo].[UAra]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UAra]
@AdSoyad varchar(50)
as begin
select * from Uye where AdSoyad=@AdSoyad
end
GO
/****** Object:  StoredProcedure [dbo].[UEkle]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UEkle]
@AdSoyad varchar(50),
@Mail varchar(50),
@Adres varchar(50),
@Tel varchar(50)
as begin
insert into Uye (AdSoyad, Mail, Adres,Tel)
	values (@AdSoyad, @Mail, @Adres,@Tel)
end
GO
/****** Object:  StoredProcedure [dbo].[UGuncelle]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UGuncelle]
@UyeNo int,
@AdSoyad varchar(50),
@Mail varchar(50),
@Adres varchar(50),
@Tel varchar(50)
as begin
update Uye set
	 AdSoyad=@AdSoyad, Mail=@Mail, Adres=@Adres,Tel=@Tel where UyeNo=@UyeNo
end
GO
/****** Object:  StoredProcedure [dbo].[UListele]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UListele]
as begin
select * from Uye
end 
GO
/****** Object:  StoredProcedure [dbo].[USil]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USil]
@UyeNo int
as begin 
delete from Uye where UyeNo=@UyeNo
end
GO
/****** Object:  StoredProcedure [dbo].[VAra]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[VAra]
@KisiAd varchar(50)
as begin
select * from VerilenKitap where KisiAd=@KisiAd
end
GO
/****** Object:  StoredProcedure [dbo].[VEkle]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VEkle]
@UNo int,
@KNo int,
@KisiAd varchar(50),
@KitapAd varchar(50),
@RafKodu varchar(50),
@VerilisT datetime,
@İadeT datetime,
@KitapDurumu varchar(50)
as begin 
insert into VerilenKitap (UNo, KNo, KisiAd, KitapAd, RafKodu, VerilisT, İadeT,KitapDurumu)
	values (@UNo, @KNo, @KisiAd, @KitapAd, @RafKodu, @VerilisT, @İadeT,@KitapDurumu)
end
GO
/****** Object:  StoredProcedure [dbo].[VGuncelle]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VGuncelle]
@İslemNo int,
@UNo int,
@KNo int,
@KisiAd varchar(50),
@KitapAd varchar(50),
@RafKodu varchar(50),
@VerilisT datetime,
@İadeT datetime,
@KitapDurumu varchar(50)
as begin 
update VerilenKitap set 
	UNo=@UNo, KNo=@KNo, KisiAd=@KisiAd, KitapAd=@KitapAd, RafKodu=@RafKodu, VerilisT=@VerilisT, İadeT=@İadeT, KitapDurumu=@KitapDurumu where İslemNo=@İslemNo
end
GO
/****** Object:  StoredProcedure [dbo].[VListele]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[VListele]
as begin 
select * from VerilenKitap
end
GO
/****** Object:  StoredProcedure [dbo].[VSil]    Script Date: 13.04.2023 12:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VSil]
@İslemNo int
as begin 
delete from VerilenKitap where İslemNo=@İslemNo
end
GO
USE [master]
GO
ALTER DATABASE [AKütüphane] SET  READ_WRITE 
GO
