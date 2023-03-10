USE [master]
GO
/****** Object:  Database [InternalShopDB]    Script Date: 8/23/2022 10:23:24 AM ******/
CREATE DATABASE [InternalShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InternalShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InternalShopDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InternalShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InternalShopDB_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InternalShopDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InternalShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InternalShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InternalShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InternalShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InternalShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InternalShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [InternalShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InternalShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InternalShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InternalShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InternalShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InternalShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InternalShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InternalShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InternalShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InternalShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InternalShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InternalShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InternalShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InternalShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InternalShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InternalShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InternalShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InternalShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [InternalShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [InternalShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InternalShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InternalShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InternalShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InternalShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InternalShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InternalShopDB', N'ON'
GO
ALTER DATABASE [InternalShopDB] SET QUERY_STORE = OFF
GO
USE [InternalShopDB]
GO
/****** Object:  Table [dbo].[SalesInvoicesMaster]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoicesMaster](
	[SellingMasterID] [int] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[UsersID] [int] NOT NULL,
	[AMountDicount] [decimal](18, 0) NULL,
	[Discount] [int] NULL,
	[Tax] [decimal](18, 0) NULL,
	[TotalBDiscount] [decimal](18, 0) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[EmployeeId] [int] NULL,
	[RemainingAmount] [decimal](18, 0) NULL,
	[AmountPaid] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SalesInvoicesMaster] PRIMARY KEY CLUSTERED 
(
	[SellingMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoices]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoices](
	[SellingId] [int] IDENTITY(1,1) NOT NULL,
	[SellingMasterID] [int] NOT NULL,
	[ProdouctsID] [int] NOT NULL,
	[Quntity_Product] [int] NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[TotalAmountRow] [decimal](18, 2) NOT NULL,
	[UsersID] [int] NOT NULL,
 CONSTRAINT [PK_SellProducts] PRIMARY KEY CLUSTERED 
(
	[SellingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[EmployeeAddress] [nvarchar](250) NOT NULL,
	[EmployeePhone] [nvarchar](11) NOT NULL,
	[EmployeeSalary] [decimal](18, 2) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[UsersID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProdouctsID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryProductId] [int] NOT NULL,
	[ProdouctName] [nvarchar](50) NOT NULL,
	[DateAdd] [datetime2](7) NULL,
	[Notes] [nvarchar](250) NULL,
	[BarCodeText] [int] NOT NULL,
	[UsersID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProdouctsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[CreateReportSalesInvoice]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Function [dbo].[CreateReportSalesInvoice](@SellingMasterID int)
returns table

 return
select [SellingId] ,SalesInvoices.ProdouctsID,SalesInvoices.Quntity_Product,SalesInvoices.SellingPrice,SalesInvoices.TotalAmountRow

,
SalesInvoicesMaster.AMountDicount,SalesInvoicesMaster.Discount,SalesInvoicesMaster.Tax,
SalesInvoicesMaster.TotalBDiscount ,SalesInvoicesMaster.TotalPrice,SalesInvoicesMaster.EmployeeId

,
Products.ProdouctName 
,Employees.EmployeeName


from SalesInvoices ,SalesInvoicesMaster,Employees,Products
where SalesInvoicesMaster.SellingMasterID = @SellingMasterID and SalesInvoicesMaster.EmployeeId = Employees.EmployeeId and SalesInvoices.ProdouctsID = Products.ProdouctsID
GO
/****** Object:  View [dbo].[View_1]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.SalesInvoicesMaster.SellingMasterID, dbo.SalesInvoicesMaster.CustomerID, dbo.SalesInvoicesMaster.UsersID, dbo.SalesInvoicesMaster.AMountDicount, dbo.SalesInvoicesMaster.Discount, dbo.SalesInvoicesMaster.Tax, 
                         dbo.SalesInvoicesMaster.TotalBDiscount, dbo.SalesInvoicesMaster.TotalPrice, dbo.Employees.EmployeeId, dbo.Employees.EmployeeName, dbo.Products.ProdouctsID, dbo.Products.ProdouctName, 
                         dbo.SalesInvoices.SellingId, dbo.SalesInvoices.EmployeeId AS Expr1, dbo.SalesInvoices.SellingMasterID AS Expr2, dbo.SalesInvoices.ProdouctsID AS Expr3, dbo.SalesInvoices.Quntity_Product, 
                         dbo.SalesInvoices.SellingPrice, dbo.SalesInvoices.TotalAmountRow, dbo.SalesInvoices.UsersID AS Expr4
FROM            dbo.SalesInvoices INNER JOIN
                         dbo.Products ON dbo.SalesInvoices.ProdouctsID = dbo.Products.ProdouctsID INNER JOIN
                         dbo.Employees ON dbo.SalesInvoices.EmployeeId = dbo.Employees.EmployeeId INNER JOIN
                         dbo.SalesInvoicesMaster ON dbo.SalesInvoices.SellingMasterID = dbo.SalesInvoicesMaster.SellingMasterID
WHERE        (dbo.SalesInvoicesMaster.SellingMasterID = 2)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [int] NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[BranchAddress] [nvarchar](250) NOT NULL,
	[BranchPhone] [nvarchar](9) NOT NULL,
	[MasterOFSToresID] [int] NOT NULL,
	[BranchMobile] [nvarchar](11) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[USerID] [int] NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[UsersID] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConvertofStores]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConvertofStores](
	[ConvertofStoresId] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[MasterOFSToresIdFrom] [int] NOT NULL,
	[MasterOFSToresIdTo] [int] NOT NULL,
	[ProdouctsID] [int] NOT NULL,
	[quantityProduct] [int] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ConvertofStores] PRIMARY KEY CLUSTERED 
(
	[ConvertofStoresId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerPhone] [nvarchar](11) NOT NULL,
	[CustomerAddress] [nvarchar](250) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[Notes] [nvarchar](250) NOT NULL,
	[UsersID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dismissalnotice]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dismissalnotice](
	[DismissalnoticeId] [int] IDENTITY(1,1) NOT NULL,
	[MasterOFSToresId] [int] NOT NULL,
	[ProdouctsID] [int] NOT NULL,
	[quantityProduct] [int] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Dismissalnotice] PRIMARY KEY CLUSTERED 
(
	[DismissalnoticeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceStoreStatus]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceStoreStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MasterStoreID] [int] NOT NULL,
	[Billno] [int] NOT NULL,
	[PAIDAMOUNT] [decimal](18, 2) NOT NULL,
	[RemainingAMOUNT] [decimal](18, 2) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceStoreStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterOFSTores]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterOFSTores](
	[MasterOFSToresID] [int] IDENTITY(1,1) NOT NULL,
	[NameMasterOFSTores] [nvarchar](50) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_MasterOFSTores] PRIMARY KEY CLUSTERED 
(
	[MasterOFSToresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterProductsWarehouse]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterProductsWarehouse](
	[MasterStoreID] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[Discount] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[TotalBDiscount] [decimal](18, 2) NOT NULL,
	[AMountDicount] [decimal](18, 2) NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[UsersID] [int] NOT NULL,
	[Tax] [int] NULL,
 CONSTRAINT [PK_MasterProductsWarehouse] PRIMARY KEY CLUSTERED 
(
	[MasterStoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutLayUnites]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutLayUnites](
	[OutLayID] [int] IDENTITY(1,1) NOT NULL,
	[QName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OutLayUnites] PRIMARY KEY CLUSTERED 
(
	[OutLayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsWarehouse]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsWarehouse](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[SuppliersID] [int] NOT NULL,
	[Billno] [int] NOT NULL,
	[ReceivingpermissionId] [int] NOT NULL,
	[MasterStoreID] [int] NOT NULL,
	[CategoryProductId] [int] NOT NULL,
	[ProdouctsID] [int] NOT NULL,
	[PurchasingPrice] [decimal](18, 2) NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[Productiondate] [datetime2](7) NOT NULL,
	[ExpireDate] [datetime2](7) NOT NULL,
	[SizeProducts] [int] NOT NULL,
	[UnitesId] [int] NOT NULL,
	[TotalAmountRow] [decimal](18, 2) NOT NULL,
	[QuntityProduct] [int] NOT NULL,
	[QtStartPeriod] [int] NOT NULL,
	[Dateofregistration] [datetime2](7) NOT NULL,
	[Anexpiredproduct] [bit] NOT NULL,
	[Nocolumn] [int] NOT NULL,
 CONSTRAINT [PK_ProductsWarehouse] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuantityProducts]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProdouctsID] [int] NOT NULL,
	[quantityProduct] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[MasterOFSToresID] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_QuantityProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receivingpermission]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receivingpermission](
	[ReceivingpermissionId] [int] IDENTITY(1,1) NOT NULL,
	[MasterOFSToresID] [int] NOT NULL,
	[ProdouctsID] [int] NOT NULL,
	[quantityProduct] [int] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Receivingpermission] PRIMARY KEY CLUSTERED 
(
	[ReceivingpermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SuppliersID] [int] IDENTITY(1,1) NOT NULL,
	[SuplierName] [nvarchar](40) NOT NULL,
	[SuplierPhone] [nvarchar](11) NULL,
	[SuplierAddress] [nvarchar](250) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[UsersID] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SuppliersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyRepresentatives]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyRepresentatives](
	[SuppliersID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierRID] [int] NOT NULL,
	[SupplierRName] [nvarchar](30) NOT NULL,
	[SupplierRPhone] [nvarchar](11) NOT NULL,
	[SupplierRAddress] [nvarchar](250) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[SupplierRNotes] [nvarchar](250) NOT NULL,
	[UsersID] [int] NOT NULL,
 CONSTRAINT [PK_SupplyRepresentatives] PRIMARY KEY CLUSTERED 
(
	[SuppliersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unites]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unites](
	[UnitesId] [int] IDENTITY(1,1) NOT NULL,
	[UnitesName] [nvarchar](50) NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime2](7) NOT NULL,
	[UnitesConvert] [int] NOT NULL,
 CONSTRAINT [PK_Unites] PRIMARY KEY CLUSTERED 
(
	[UnitesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220514100520_InitialCreate', N'5.0.10')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryProductId], [CategoryName], [DateAdd], [UsersID]) VALUES (1, N'milk', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmployeeAddress], [EmployeePhone], [EmployeeSalary], [DateAdd], [DateEdit], [Notes], [UsersID]) VALUES (3, N'beko', N'beba', N'010250', CAST(2555.00 AS Decimal(18, 2)), CAST(N'2010-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2010-10-10T00:00:00.0000000' AS DateTime2), N'000', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[MasterProductsWarehouse] ([MasterStoreID], [EmployeeId], [DateAdd], [Discount], [TotalPrice], [TotalBDiscount], [AMountDicount], [Notes], [UsersID], [Tax]) VALUES (1, 1, CAST(N'2022-05-17T18:37:49.1982085' AS DateTime2), 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, 1, 1)
INSERT [dbo].[MasterProductsWarehouse] ([MasterStoreID], [EmployeeId], [DateAdd], [Discount], [TotalPrice], [TotalBDiscount], [AMountDicount], [Notes], [UsersID], [Tax]) VALUES (2, 1, CAST(N'2022-05-17T18:45:28.5391169' AS DateTime2), 6, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'0656', 1, 0)
INSERT [dbo].[MasterProductsWarehouse] ([MasterStoreID], [EmployeeId], [DateAdd], [Discount], [TotalPrice], [TotalBDiscount], [AMountDicount], [Notes], [UsersID], [Tax]) VALUES (3, 1, CAST(N'2022-05-17T18:46:40.5351173' AS DateTime2), 6, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'0656', 1, 0)
INSERT [dbo].[MasterProductsWarehouse] ([MasterStoreID], [EmployeeId], [DateAdd], [Discount], [TotalPrice], [TotalBDiscount], [AMountDicount], [Notes], [UsersID], [Tax]) VALUES (4, 1, CAST(N'2022-05-17T18:48:57.8408045' AS DateTime2), 6, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'0656', 1, 0)
INSERT [dbo].[MasterProductsWarehouse] ([MasterStoreID], [EmployeeId], [DateAdd], [Discount], [TotalPrice], [TotalBDiscount], [AMountDicount], [Notes], [UsersID], [Tax]) VALUES (5, 1, CAST(N'2022-05-17T18:50:34.1920080' AS DateTime2), 6, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'0656', 1, 0)
INSERT [dbo].[MasterProductsWarehouse] ([MasterStoreID], [EmployeeId], [DateAdd], [Discount], [TotalPrice], [TotalBDiscount], [AMountDicount], [Notes], [UsersID], [Tax]) VALUES (6, 1, CAST(N'2022-05-17T18:53:16.0044421' AS DateTime2), 6, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'0656', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (1, 1, N'ProdouctName 1', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 2, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (2, 2, N'ProdouctName 2', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 4, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (3, 3, N'ProdouctName 3', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 6, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (4, 4, N'ProdouctName 4', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 8, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (5, 5, N'ProdouctName 5', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 10, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (6, 6, N'ProdouctName 6', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 12, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (7, 7, N'ProdouctName 7', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 14, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (8, 8, N'ProdouctName 8', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 16, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (9, 9, N'ProdouctName 9', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 18, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (10, 10, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 20, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (11, 11, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 22, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (12, 12, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 24, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (13, 13, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 26, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (14, 14, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 28, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (15, 15, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 30, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (16, 16, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 32, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (17, 17, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 34, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (18, 18, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 36, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (19, 19, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 38, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (20, 20, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 40, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (21, 21, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 42, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (22, 22, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 44, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (23, 23, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 46, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (24, 24, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 48, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (25, 25, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 50, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (26, 26, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 52, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (27, 27, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 54, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (28, 28, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 56, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (29, 29, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 58, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (30, 30, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 60, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (31, 31, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 62, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (32, 32, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 64, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (33, 33, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 66, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (34, 34, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 68, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (35, 35, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 70, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (36, 36, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 72, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (37, 37, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 74, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (38, 38, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 76, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (39, 39, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 78, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (40, 40, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 80, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (41, 41, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 82, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (42, 42, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 84, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (43, 43, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 86, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (44, 44, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 88, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (45, 45, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 90, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (46, 46, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 92, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (47, 47, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 94, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (48, 48, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 96, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (49, 49, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 98, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (50, 50, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 100, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (51, 51, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 102, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (52, 52, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 104, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (53, 53, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 106, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (54, 54, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 108, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (55, 55, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 110, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (56, 56, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 112, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (57, 57, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 114, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (58, 58, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 116, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (59, 59, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 118, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (60, 60, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 120, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (61, 61, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 122, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (62, 62, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 124, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (63, 63, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 126, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (64, 64, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 128, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (65, 65, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 130, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (66, 66, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 132, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (67, 67, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 134, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (68, 68, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 136, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (69, 69, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 138, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (70, 70, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 140, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (71, 71, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 142, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (72, 72, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 144, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (73, 73, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 146, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (74, 74, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 148, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (75, 75, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 150, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (76, 76, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 152, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (77, 77, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 154, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (78, 78, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 156, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (79, 79, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 158, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (80, 80, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 160, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (81, 81, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 162, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (82, 82, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 164, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (83, 83, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 166, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (84, 84, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 168, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (85, 85, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 170, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (86, 86, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 172, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (87, 87, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 174, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (88, 88, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 176, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (89, 89, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 178, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (90, 90, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 180, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (91, 91, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 182, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (92, 92, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 184, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (93, 93, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 186, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (94, 94, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 188, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (95, 95, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 190, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (96, 96, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 192, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (97, 97, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 194, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (98, 98, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 196, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (99, 99, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 198, 1)
GO
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (100, 100, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 200, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (101, 101, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 202, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (102, 102, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 204, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (103, 103, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 206, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (104, 104, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 208, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (105, 105, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 210, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (106, 106, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 212, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (107, 107, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 214, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (108, 108, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 216, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (109, 109, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 218, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (110, 110, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 220, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (111, 111, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 222, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (112, 112, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 224, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (113, 113, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 226, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (114, 114, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 228, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (115, 115, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 230, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (116, 116, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 232, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (117, 117, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 234, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (118, 118, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 236, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (119, 119, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 238, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (120, 120, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 240, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (121, 121, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 242, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (122, 122, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 244, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (123, 123, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 246, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (124, 124, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 248, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (125, 125, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 250, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (126, 126, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 252, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (127, 127, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 254, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (128, 128, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 256, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (129, 129, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 258, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (130, 130, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 260, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (131, 131, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 262, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (132, 132, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 264, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (133, 133, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 266, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (134, 134, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 268, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (135, 135, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 270, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (136, 136, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 272, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (137, 137, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 274, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (138, 138, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 276, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (139, 139, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 278, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (140, 140, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 280, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (141, 141, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 282, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (142, 142, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 284, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (143, 143, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 286, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (144, 144, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 288, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (145, 145, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 290, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (146, 146, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 292, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (147, 147, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 294, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (148, 148, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 296, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (149, 149, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 298, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (150, 150, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 300, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (151, 151, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 302, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (152, 152, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 304, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (153, 153, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 306, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (154, 154, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 308, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (155, 155, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 310, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (156, 156, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 312, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (157, 157, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 314, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (158, 158, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 316, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (159, 159, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 318, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (160, 160, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 320, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (161, 161, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 322, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (162, 162, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 324, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (163, 163, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 326, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (164, 164, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 328, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (165, 165, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 330, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (166, 166, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 332, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (167, 167, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 334, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (168, 168, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 336, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (169, 169, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 338, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (170, 170, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 340, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (171, 171, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 342, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (172, 172, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 344, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (173, 173, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 346, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (174, 174, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 348, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (175, 175, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 350, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (176, 176, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 352, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (177, 177, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 354, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (178, 178, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 356, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (179, 179, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 358, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (180, 180, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 360, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (181, 181, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 362, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (182, 182, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 364, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (183, 183, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 366, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (184, 184, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 368, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (185, 185, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 370, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (186, 186, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 372, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (187, 187, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 374, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (188, 188, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 376, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (189, 189, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 378, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (190, 190, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 380, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (191, 191, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 382, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (192, 192, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 384, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (193, 193, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 386, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (194, 194, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 388, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (195, 195, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 390, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (196, 196, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 392, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (197, 197, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 394, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (198, 198, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 396, 1)
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (199, 199, N'ProdouctName *', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 398, 1)
GO
INSERT [dbo].[Products] ([ProdouctsID], [CategoryProductId], [ProdouctName], [DateAdd], [Notes], [BarCodeText], [UsersID]) VALUES (200, 200, N'Milk', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'000', 400, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsWarehouse] ON 

INSERT [dbo].[ProductsWarehouse] ([StoreId], [SuppliersID], [Billno], [ReceivingpermissionId], [MasterStoreID], [CategoryProductId], [ProdouctsID], [PurchasingPrice], [SellingPrice], [Productiondate], [ExpireDate], [SizeProducts], [UnitesId], [TotalAmountRow], [QuntityProduct], [QtStartPeriod], [Dateofregistration], [Anexpiredproduct], [Nocolumn]) VALUES (4003, 1, 0, 1, 0, 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), CAST(N'2022-05-24T20:07:00.0000000' AS DateTime2), 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[ProductsWarehouse] ([StoreId], [SuppliersID], [Billno], [ReceivingpermissionId], [MasterStoreID], [CategoryProductId], [ProdouctsID], [PurchasingPrice], [SellingPrice], [Productiondate], [ExpireDate], [SizeProducts], [UnitesId], [TotalAmountRow], [QuntityProduct], [QtStartPeriod], [Dateofregistration], [Anexpiredproduct], [Nocolumn]) VALUES (4004, 1, 0, 1, 0, 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), CAST(N'2022-05-24T20:07:00.0000000' AS DateTime2), 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[ProductsWarehouse] ([StoreId], [SuppliersID], [Billno], [ReceivingpermissionId], [MasterStoreID], [CategoryProductId], [ProdouctsID], [PurchasingPrice], [SellingPrice], [Productiondate], [ExpireDate], [SizeProducts], [UnitesId], [TotalAmountRow], [QuntityProduct], [QtStartPeriod], [Dateofregistration], [Anexpiredproduct], [Nocolumn]) VALUES (4005, 1, 0, 1, 0, 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), CAST(N'2022-05-24T20:07:00.0000000' AS DateTime2), 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[ProductsWarehouse] ([StoreId], [SuppliersID], [Billno], [ReceivingpermissionId], [MasterStoreID], [CategoryProductId], [ProdouctsID], [PurchasingPrice], [SellingPrice], [Productiondate], [ExpireDate], [SizeProducts], [UnitesId], [TotalAmountRow], [QuntityProduct], [QtStartPeriod], [Dateofregistration], [Anexpiredproduct], [Nocolumn]) VALUES (4006, 1, 0, 1, 0, 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), CAST(N'2022-05-24T20:07:00.0000000' AS DateTime2), 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-05-18T20:07:00.0000000' AS DateTime2), 0, 0)
SET IDENTITY_INSERT [dbo].[ProductsWarehouse] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesInvoices] ON 

INSERT [dbo].[SalesInvoices] ([SellingId], [SellingMasterID], [ProdouctsID], [Quntity_Product], [SellingPrice], [TotalAmountRow], [UsersID]) VALUES (4, 2, 200, 2, CAST(3.00 AS Decimal(18, 2)), CAST(44.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[SalesInvoices] OFF
GO
INSERT [dbo].[SalesInvoicesMaster] ([SellingMasterID], [DateAdd], [CustomerID], [UsersID], [AMountDicount], [Discount], [Tax], [TotalBDiscount], [TotalPrice], [EmployeeId], [RemainingAmount], [AmountPaid]) VALUES (2, CAST(N'2022-07-03T16:44:06.9454891' AS DateTime2), 1, 1, CAST(9 AS Decimal(18, 0)), 10, CAST(19 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), 3, CAST(100 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SuppliersID], [SuplierName], [SuplierPhone], [SuplierAddress], [DateAdd], [DateEdit], [Notes], [UsersID]) VALUES (1, N'china', N'010554545', N'china el baled', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0656', 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateReportSalesInvoiceById]    Script Date: 8/23/2022 10:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[SP_CreateReportSalesInvoiceById]
@SellingMasterID int
as

begin
select [SellingId] ,SalesInvoices.ProdouctsID,SalesInvoices.Quntity_Product,SalesInvoices.SellingPrice,SalesInvoices.TotalAmountRow

,
SalesInvoicesMaster.AMountDicount,SalesInvoicesMaster.Discount,SalesInvoicesMaster.Tax,
SalesInvoicesMaster.TotalBDiscount ,SalesInvoicesMaster.TotalPrice,SalesInvoicesMaster.EmployeeId,
SalesInvoicesMaster.SellingMasterID

,
Products.ProdouctName 
,Employees.EmployeeName


from SalesInvoices ,SalesInvoicesMaster,Employees,Products
where SalesInvoicesMaster.SellingMasterID = @SellingMasterID and SalesInvoicesMaster.EmployeeId = Employees.EmployeeId and SalesInvoices.ProdouctsID = Products.ProdouctsID
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SalesInvoices"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 237
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 243
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 485
               Bottom = 243
               Right = 668
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SalesInvoicesMaster"
            Begin Extent = 
               Top = 6
               Left = 706
               Bottom = 241
               Right = 881
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [InternalShopDB] SET  READ_WRITE 
GO
