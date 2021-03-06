USE [Invoice System]
GO
/****** Object:  StoredProcedure [dbo].[updatePaymentDetail]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[updatePaymentDetail]
GO
/****** Object:  StoredProcedure [dbo].[insertStudentFees]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[insertStudentFees]
GO
/****** Object:  StoredProcedure [dbo].[insertPaymentDetail]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[insertPaymentDetail]
GO
/****** Object:  StoredProcedure [dbo].[insertInvoiceItem]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[insertInvoiceItem]
GO
/****** Object:  StoredProcedure [dbo].[getStudentBySchool]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getStudentBySchool]
GO
/****** Object:  StoredProcedure [dbo].[getPreviousPayment]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getPreviousPayment]
GO
/****** Object:  StoredProcedure [dbo].[getPaymentItems]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getPaymentItems]
GO
/****** Object:  StoredProcedure [dbo].[getPaymentById]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getPaymentById]
GO
/****** Object:  StoredProcedure [dbo].[getPayment]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getPayment]
GO
/****** Object:  StoredProcedure [dbo].[getInvoicesById]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getInvoicesById]
GO
/****** Object:  StoredProcedure [dbo].[getInvoiceItem]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getInvoiceItem]
GO
/****** Object:  StoredProcedure [dbo].[getInvoiceById]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[getInvoiceById]
GO
/****** Object:  StoredProcedure [dbo].[deletePayment]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[deletePayment]
GO
/****** Object:  StoredProcedure [dbo].[deleteInvoiceItem]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[deleteInvoiceItem]
GO
/****** Object:  StoredProcedure [dbo].[deleteInvoice]    Script Date: 17/07/2022 15:02:46 ******/
DROP PROCEDURE [dbo].[deleteInvoice]
GO
ALTER TABLE [dbo].[student] DROP CONSTRAINT [FK_student_school]
GO
ALTER TABLE [dbo].[payment_details] DROP CONSTRAINT [FK_payment_details_school]
GO
ALTER TABLE [dbo].[invoice_payment] DROP CONSTRAINT [FK_invoice_payment_student]
GO
ALTER TABLE [dbo].[invoice_payment] DROP CONSTRAINT [FK_invoice_payment_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_item] DROP CONSTRAINT [FK_invoice_item_payment_details]
GO
ALTER TABLE [dbo].[invoice_item] DROP CONSTRAINT [FK_invoice_item_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_payment] DROP CONSTRAINT [DF_invoice_payment_remaining]
GO
/****** Object:  Table [dbo].[student]    Script Date: 17/07/2022 15:02:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[student]') AND type in (N'U'))
DROP TABLE [dbo].[student]
GO
/****** Object:  Table [dbo].[school]    Script Date: 17/07/2022 15:02:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[school]') AND type in (N'U'))
DROP TABLE [dbo].[school]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 17/07/2022 15:02:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payment_details]') AND type in (N'U'))
DROP TABLE [dbo].[payment_details]
GO
/****** Object:  Table [dbo].[invoice_payment]    Script Date: 17/07/2022 15:02:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[invoice_payment]') AND type in (N'U'))
DROP TABLE [dbo].[invoice_payment]
GO
/****** Object:  Table [dbo].[invoice_item]    Script Date: 17/07/2022 15:02:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[invoice_item]') AND type in (N'U'))
DROP TABLE [dbo].[invoice_item]
GO
USE [master]
GO
/****** Object:  Database [Invoice System]    Script Date: 17/07/2022 15:02:46 ******/
DROP DATABASE [Invoice System]
GO
/****** Object:  Database [Invoice System]    Script Date: 17/07/2022 15:02:46 ******/
CREATE DATABASE [Invoice System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'invoiceSystem', FILENAME = N'D:\devtools\MicrosoftSQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\invoiceSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'invoiceSystem_log', FILENAME = N'D:\devtools\MicrosoftSQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\invoiceSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Invoice System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Invoice System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Invoice System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Invoice System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Invoice System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Invoice System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Invoice System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Invoice System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Invoice System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Invoice System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Invoice System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Invoice System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Invoice System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Invoice System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Invoice System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Invoice System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Invoice System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Invoice System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Invoice System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Invoice System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Invoice System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Invoice System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Invoice System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Invoice System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Invoice System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Invoice System] SET  MULTI_USER 
GO
ALTER DATABASE [Invoice System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Invoice System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Invoice System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Invoice System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Invoice System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Invoice System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Invoice System] SET QUERY_STORE = OFF
GO
USE [Invoice System]
GO
/****** Object:  Table [dbo].[invoice_item]    Script Date: 17/07/2022 15:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_item](
	[invoice] [bigint] NOT NULL,
	[payment_item] [bigint] NOT NULL,
 CONSTRAINT [PK_invoice_item] PRIMARY KEY CLUSTERED 
(
	[invoice] ASC,
	[payment_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_payment]    Script Date: 17/07/2022 15:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_payment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student] [bigint] NOT NULL,
	[date] [date] NOT NULL,
	[total_cost] [money] NOT NULL,
	[paid] [money] NOT NULL,
	[remaining] [money] NOT NULL,
	[previous_payment] [bigint] NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_invoice_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 17/07/2022 15:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[type] [int] NOT NULL,
	[amount] [money] NOT NULL,
	[school] [bigint] NOT NULL,
	[year] [char](9) NOT NULL,
	[student_type] [smallint] NOT NULL,
	[Grade] [smallint] NOT NULL,
 CONSTRAINT [PK_payment_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school]    Script Date: 17/07/2022 15:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_school] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 17/07/2022 15:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[school] [bigint] NOT NULL,
	[grade] [smallint] NOT NULL,
	[type] [smallint] NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (5, 1)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (5, 2)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (5, 3)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (6, 1)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (6, 3)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (7, 1)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (7, 2)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (7, 3)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (7, 5)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (8, 6)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (8, 8)
INSERT [dbo].[invoice_item] ([invoice], [payment_item]) VALUES (12, 1)
GO
SET IDENTITY_INSERT [dbo].[invoice_payment] ON 

INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (5, 1, CAST(N'2022-07-06' AS Date), 18200.0000, 18000.0000, 200.0000, NULL, N'5
1st installment
activities
2nd installment')
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (6, 1, CAST(N'2022-07-06' AS Date), 17000.0000, 12000.0000, 5200.0000, 5, N'5
1st installment
activities
2nd installment
6
1st installment
2nd installment ')
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (7, 1, CAST(N'2022-07-06' AS Date), 19500.0000, 18000.0000, 6700.0000, 6, N'5
1st installment
activities
2nd installment
6
1st installment
2nd installment
7
1st installment
activities
2nd installment
resources ')
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (8, 2, CAST(N'2022-07-07' AS Date), 23000.0000, 16000.0000, 7000.0000, NULL, N'8
1st installment
2nd installment')
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (10, 1, CAST(N'2022-07-16' AS Date), 0.0000, 5000.0000, 1700.0000, 7, N'5
1st installment
activities
2nd installment
6
1st installment
2nd installment
7
1st installment
activities
2nd installment
resources ')
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (11, 1, CAST(N'2022-07-17' AS Date), 0.0000, 1700.0000, 0.0000, 10, N'')
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (12, 1, CAST(N'2022-07-17' AS Date), 12000.0000, 11000.0000, 1000.0000, 11, N'12
1st installment')
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (13, 1, CAST(N'2022-07-17' AS Date), 0.0000, 1000.0000, 0.0000, 12, NULL)
INSERT [dbo].[invoice_payment] ([id], [student], [date], [total_cost], [paid], [remaining], [previous_payment], [Notes]) VALUES (16, 1, CAST(N'2022-07-17' AS Date), 1550.0000, 1350.0000, 200.0000, 13, N'
16
Uniform
resources
')
SET IDENTITY_INSERT [dbo].[invoice_payment] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_details] ON 

INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (1, N'1st installment', 1, 12000.0000, 1, N'2022-2023', 1, 1)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (2, N'activities', 3, 1200.0000, 1, N'2022-2023', 1, 1)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (3, N'2nd installment', 2, 5000.0000, 1, N'2022-2023', 1, 1)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (4, N'Uniform', 10, 250.0000, 1, N'2022-2023', 1, 1)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (5, N'resources', 4, 1300.0000, 1, N'2022-2023', 1, 1)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (6, N'1st installment', 1, 15000.0000, 1, N'2022-2023', 1, 2)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (7, N'activities', 3, 1500.0000, 1, N'2022-2023', 1, 2)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (8, N'2nd installment', 2, 8000.0000, 1, N'2022-2023', 1, 2)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (9, N'Uniform', 10, 250.0000, 1, N'2022-2023', 1, 2)
INSERT [dbo].[payment_details] ([id], [name], [type], [amount], [school], [year], [student_type], [Grade]) VALUES (10, N'resources', 4, 1600.0000, 1, N'2022-2023', 1, 2)
SET IDENTITY_INSERT [dbo].[payment_details] OFF
GO
SET IDENTITY_INSERT [dbo].[school] ON 

INSERT [dbo].[school] ([id], [name]) VALUES (1, N'Obour')
INSERT [dbo].[school] ([id], [name]) VALUES (2, N'Menia')
SET IDENTITY_INSERT [dbo].[school] OFF
GO
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([id], [name], [school], [grade], [type]) VALUES (1, N'mohamed', 1, 1, 1)
INSERT [dbo].[student] ([id], [name], [school], [grade], [type]) VALUES (2, N'Nadr', 1, 2, 1)
SET IDENTITY_INSERT [dbo].[student] OFF
GO
ALTER TABLE [dbo].[invoice_payment] ADD  CONSTRAINT [DF_invoice_payment_remaining]  DEFAULT ((0)) FOR [remaining]
GO
ALTER TABLE [dbo].[invoice_item]  WITH CHECK ADD  CONSTRAINT [FK_invoice_item_invoice_payment] FOREIGN KEY([invoice])
REFERENCES [dbo].[invoice_payment] ([id])
GO
ALTER TABLE [dbo].[invoice_item] CHECK CONSTRAINT [FK_invoice_item_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_item]  WITH CHECK ADD  CONSTRAINT [FK_invoice_item_payment_details] FOREIGN KEY([payment_item])
REFERENCES [dbo].[payment_details] ([id])
GO
ALTER TABLE [dbo].[invoice_item] CHECK CONSTRAINT [FK_invoice_item_payment_details]
GO
ALTER TABLE [dbo].[invoice_payment]  WITH CHECK ADD  CONSTRAINT [FK_invoice_payment_invoice_payment] FOREIGN KEY([previous_payment])
REFERENCES [dbo].[invoice_payment] ([id])
GO
ALTER TABLE [dbo].[invoice_payment] CHECK CONSTRAINT [FK_invoice_payment_invoice_payment]
GO
ALTER TABLE [dbo].[invoice_payment]  WITH CHECK ADD  CONSTRAINT [FK_invoice_payment_student] FOREIGN KEY([student])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[invoice_payment] CHECK CONSTRAINT [FK_invoice_payment_student]
GO
ALTER TABLE [dbo].[payment_details]  WITH CHECK ADD  CONSTRAINT [FK_payment_details_school] FOREIGN KEY([school])
REFERENCES [dbo].[school] ([id])
GO
ALTER TABLE [dbo].[payment_details] CHECK CONSTRAINT [FK_payment_details_school]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_school] FOREIGN KEY([school])
REFERENCES [dbo].[school] ([id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_school]
GO
/****** Object:  StoredProcedure [dbo].[deleteInvoice]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteInvoice]
(@invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	invoice_payment
         WHERE  id = @invoiceID
 
END
GO
/****** Object:  StoredProcedure [dbo].[deleteInvoiceItem]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteInvoiceItem]
(@itemID bigint,
 @invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	invoice_item
         WHERE  invoice = @invoiceID 
				and
				payment_item=@itemID
 
END
GO
/****** Object:  StoredProcedure [dbo].[deletePayment]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePayment]
(@paymentID bigint)
AS
BEGIN
SET NOCOUNT ON
 
  DELETE FROM	payment_details
         WHERE  id = @paymentID
 
END
GO
/****** Object:  StoredProcedure [dbo].[getInvoiceById]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getInvoiceById]
(@invoiceId bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_payment
         WHERE  id = @invoiceId
 
END
GO
/****** Object:  StoredProcedure [dbo].[getInvoiceItem]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getInvoiceItem]
(@itemID bigint,
 @invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	invoice_item ii 
		 join payment_details pd 
		 on 
		 ii.payment_item=pd.id
         WHERE  ii.invoice = @invoiceID
		 and
		 ii.payment_item=@itemID
 
END
GO
/****** Object:  StoredProcedure [dbo].[getInvoicesById]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getInvoicesById]
(@invoiceId bigint)
AS
BEGIN
SET NOCOUNT ON
	Begin
		WITH  MyDescendants AS (
		SELECT *
		FROM invoice_payment
		WHERE id = @invoiceId

		UNION ALL

		SELECT invoice_payment.*
		FROM invoice_payment
		JOIN MyDescendants ON invoice_payment.id = MyDescendants.previous_payment
	)
	SELECT * FROM MyDescendants
	end
END
GO
/****** Object:  StoredProcedure [dbo].[getPayment]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPayment]
(@paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  school=@paymentSchool 
		 and
		 year=@paymentYear 
		 and
		 student_type=@paymentStudentType
 
END
GO
/****** Object:  StoredProcedure [dbo].[getPaymentById]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPaymentById]
(@paymentID bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  id = @paymentID
 
END
GO
/****** Object:  StoredProcedure [dbo].[getPaymentItems]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPaymentItems]
(@school bigint,
 @student_type smallint,
 @grade smallint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	payment_details
         WHERE  school = @school
		 and
		 student_type=@student_type
		 and
		 Grade=@grade
 
END
GO
/****** Object:  StoredProcedure [dbo].[getPreviousPayment]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPreviousPayment]
(@student bigint)
AS
BEGIN
SET NOCOUNT ON
		 select *
from invoice_payment
where student=@student
order by date desc,id desc;
 
END
GO
/****** Object:  StoredProcedure [dbo].[getStudentBySchool]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getStudentBySchool]
(@school bigint)
AS
BEGIN
SET NOCOUNT ON
		 Select *
		 FROM	student
         WHERE  school = @school
END
GO
/****** Object:  StoredProcedure [dbo].[insertInvoiceItem]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertInvoiceItem]
(@itemID bigint,
 @invoiceID bigint)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO invoice_item(invoice,payment_item) VALUES (@invoiceID,@itemID)
 
END
GO
/****** Object:  StoredProcedure [dbo].[insertPaymentDetail]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertPaymentDetail]
(@paymentName varchar(200),
 @paymentType int,
 @paymentAmount money,
 @paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO payment_details(name,type,amount,school,year,student_type) VALUES (@paymentName,@paymentType,@paymentAmount,@paymentSchool,@paymentYear,@paymentStudentType)
 
END
GO
/****** Object:  StoredProcedure [dbo].[insertStudentFees]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertStudentFees]
(@feeActivity bigint,
 @feeResources bigint,
 @feeFirstInstallment bigint,
 @feeSecondInstallment bigint,
 @feeUniform bigint,
 @feeTotalFees bigint,
 @feeYear date)
AS
BEGIN
SET NOCOUNT ON
 
 INSERT INTO student_fees(activity,resources,first_installment,second_installment,uniform,total_fees,year) VALUES (@feeActivity,@feeResources,@feeFirstInstallment,@feeSecondInstallment,@feeUniform,@feeTotalFees,@feeYear)
 
END
GO
/****** Object:  StoredProcedure [dbo].[updatePaymentDetail]    Script Date: 17/07/2022 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePaymentDetail]
(@paymentId bigint,
 @paymentName varchar(200),
 @paymentType int,
 @paymentAmount money,
 @paymentSchool varchar(50),
 @paymentYear date,
 @paymentStudentType smallint)
AS
BEGIN
SET NOCOUNT ON
 
 UPDATE payment_details
            SET    name=@paymentName,
			type=@paymentType,
			amount=@paymentAmount,
			school=@paymentSchool,
			year=@paymentYear,
			student_type=@paymentStudentType
            WHERE  id = @paymentId
 
END
GO
USE [master]
GO
ALTER DATABASE [Invoice System] SET  READ_WRITE 
GO
