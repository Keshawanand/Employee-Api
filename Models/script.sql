USE [EmployeeDB]
GO
/****** Object:  StoredProcedure [dbo].[SpGetLeaveDetails]    Script Date: 06-04-2021 21:46:48 ******/
DROP PROCEDURE [dbo].[SpGetLeaveDetails]
GO
/****** Object:  StoredProcedure [dbo].[SpGetEmployewiseleave]    Script Date: 06-04-2021 21:46:48 ******/
DROP PROCEDURE [dbo].[SpGetEmployewiseleave]
GO
/****** Object:  StoredProcedure [dbo].[SpGetEmployeeLeaveTransactionDetails]    Script Date: 06-04-2021 21:46:48 ******/
DROP PROCEDURE [dbo].[SpGetEmployeeLeaveTransactionDetails]
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeLeaveRequest]    Script Date: 06-04-2021 21:46:48 ******/
DROP PROCEDURE [dbo].[spGetEmployeeLeaveRequest]
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeLeavebyLeaveType]    Script Date: 06-04-2021 21:46:48 ******/
DROP PROCEDURE [dbo].[spGetEmployeeLeavebyLeaveType]
GO
/****** Object:  StoredProcedure [dbo].[SpCreditMonthlyLeavetoEmployeeBucket]    Script Date: 06-04-2021 21:46:48 ******/
DROP PROCEDURE [dbo].[SpCreditMonthlyLeavetoEmployeeBucket]
GO
ALTER TABLE [dbo].[MothlyCreditLeave] DROP CONSTRAINT [DF_MothlyCreditLeave_CreatedDateTime]
GO
ALTER TABLE [dbo].[LeaveStatus] DROP CONSTRAINT [DF_LeaveStatus_CreatedDateTime]
GO
ALTER TABLE [dbo].[EmployeeLeaveRequests] DROP CONSTRAINT [DF_EmployeeLeaveRequests_CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeLeaveRequests] DROP CONSTRAINT [DF_EmployeeLeaveDetails_PostedDate]
GO
ALTER TABLE [dbo].[EmployeeLeaveLedger] DROP CONSTRAINT [DF_EmployeeLeaveLedger_CreatedDate]
GO
ALTER TABLE [dbo].[Designation] DROP CONSTRAINT [DF_Designation_CreatedDate]
GO
ALTER TABLE [dbo].[CurrentFinancialYear] DROP CONSTRAINT [DF_CurrentFinancialYear_CreatedDate]
GO
/****** Object:  Table [dbo].[MothlyCreditLeave]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[MothlyCreditLeave]
GO
/****** Object:  Table [dbo].[LeaveTypes]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[LeaveTypes]
GO
/****** Object:  Table [dbo].[LeaveStatus]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[LeaveStatus]
GO
/****** Object:  Table [dbo].[EmployeeLeaveRequests]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[EmployeeLeaveRequests]
GO
/****** Object:  Table [dbo].[EmployeeLeaveLedger]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[EmployeeLeaveLedger]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[Designation]
GO
/****** Object:  Table [dbo].[CurrentFinancialYear]    Script Date: 06-04-2021 21:46:48 ******/
DROP TABLE [dbo].[CurrentFinancialYear]
GO
/****** Object:  UserDefinedFunction [dbo].[GetFIYearDate]    Script Date: 06-04-2021 21:46:48 ******/
DROP FUNCTION [dbo].[GetFIYearDate]
GO
USE [master]
GO
/****** Object:  Database [EmployeeDB]    Script Date: 06-04-2021 21:46:48 ******/
DROP DATABASE [EmployeeDB]
GO
/****** Object:  Database [EmployeeDB]    Script Date: 06-04-2021 21:46:48 ******/
CREATE DATABASE [EmployeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmployeeDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmployeeDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmployeeDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeDB] SET QUERY_STORE = OFF
GO
USE [EmployeeDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetFIYearDate]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetFIYearDate]
(
)
returns @Result table (
      Startfrom              Datetime
    , EndTo                  DateTime
)
AS
begin
DECLARE @FIYear VARCHAR(20)    
    
SELECT @FIYear = (CASE WHEN (MONTH(GETDATE())) <= 7 THEN convert(varchar(4), YEAR(GETDATE())-1) + '-' + convert(varchar(4), YEAR(GETDATE())%100)    
                        ELSE convert(varchar(4),YEAR(GETDATE()))+ '-' + convert(varchar(4),(YEAR(GETDATE())%100)+1)END)    

insert into @Result (
     		Startfrom
		,   EndTo
    )
    select  Startfrom,EndTo from CurrentFinancialYear where (CurrentFinancialYear=@FIYear);
	 return;
end;
GO
/****** Object:  Table [dbo].[CurrentFinancialYear]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentFinancialYear](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrentFinancialYear] [varchar](20) NULL,
	[StartFrom] [datetime] NOT NULL,
	[EndTo] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CurrentFinancialYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpCode] [varchar](50) NULL,
	[EmpFName] [varchar](100) NULL,
	[EmpLName] [varchar](50) NULL,
	[UserName] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[Gender] [varchar](20) NULL,
	[ContactNo] [varchar](20) NULL,
	[Dob] [date] NULL,
	[Doj] [date] NULL,
	[IsAdmin] [bit] NULL,
	[refDesignation] [bigint] NULL,
	[Address1] [varchar](500) NULL,
	[Address2] [varchar](500) NULL,
	[Passport] [varchar](50) NULL,
	[EmergancyContact] [varchar](50) NULL,
	[PanCard] [varchar](10) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLeaveLedger]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeaveLedger](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpId] [bigint] NOT NULL,
	[LeaveType] [int] NOT NULL,
	[Reason] [varchar](50) NOT NULL,
	[LeaveCount] [float] NOT NULL,
	[DateFrom] [date] NULL,
	[DateTo] [date] NULL,
	[DrCr] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_EmployeeLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLeaveRequests]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeaveRequests](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpId] [bigint] NOT NULL,
	[LeaveFrom] [date] NULL,
	[LeaveTo] [date] NULL,
	[ShiftFrom] [varchar](50) NULL,
	[ShiftTo] [varchar](50) NULL,
	[Reason] [varchar](500) NOT NULL,
	[LeaveCount] [float] NULL,
	[ApprovedStatusId] [smallint] NULL,
	[PostedDate] [datetime] NULL,
	[LeaveType] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ApprovedDate] [datetime] NULL,
	[Approvedby] [bigint] NULL,
 CONSTRAINT [PK_EmployeeLeaveRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveStatus]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeaveStatus] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedDatetime] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
 CONSTRAINT [PK_LeaveStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveTypes]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeaveType] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedDatetime] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
 CONSTRAINT [PK_LeaveTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MothlyCreditLeave]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MothlyCreditLeave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeaveType] [int] NULL,
	[MonthlyLeaves] [float] NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[Createdby] [bigint] NULL,
	[Updatedby] [bigint] NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_MothlyCreditLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CurrentFinancialYear] ON 

INSERT [dbo].[CurrentFinancialYear] ([Id], [CurrentFinancialYear], [StartFrom], [EndTo], [IsActive], [CreatedDate]) VALUES (1, N'2020-21', CAST(N'2020-07-01T00:00:00.000' AS DateTime), CAST(N'2021-06-30T11:59:59.000' AS DateTime), 1, CAST(N'2021-03-20T18:37:26.973' AS DateTime))
SET IDENTITY_INSERT [dbo].[CurrentFinancialYear] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Description], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (1, N'Software Engineer', 1, CAST(N'2021-03-29T18:13:24.960' AS DateTime), NULL)
INSERT [dbo].[Designation] ([Id], [Description], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (2, N'DBA', 1, CAST(N'2021-03-29T18:14:20.380' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [EmpCode], [EmpFName], [EmpLName], [UserName], [Password], [Gender], [ContactNo], [Dob], [Doj], [IsAdmin], [refDesignation], [Address1], [Address2], [Passport], [EmergancyContact], [PanCard], [IsActive], [CreatedDate], [UpdatedDateTime]) VALUES (2, N'E031', N'Keshawanand', N'Singh', N'Keshaw', N'k@123', N'Male', N'9871726489', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-02-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Employee] ([Id], [EmpCode], [EmpFName], [EmpLName], [UserName], [Password], [Gender], [ContactNo], [Dob], [Doj], [IsAdmin], [refDesignation], [Address1], [Address2], [Passport], [EmergancyContact], [PanCard], [IsActive], [CreatedDate], [UpdatedDateTime]) VALUES (3, N'E012', N'k', N'S', N'k', N'k', N'Male', N'9999', CAST(N'1992-12-30' AS Date), CAST(N'2019-10-31' AS Date), 1, 1, N'k', N'k', NULL, NULL, NULL, 1, CAST(N'2021-03-31T18:23:55.107' AS DateTime), NULL)
INSERT [dbo].[Employee] ([Id], [EmpCode], [EmpFName], [EmpLName], [UserName], [Password], [Gender], [ContactNo], [Dob], [Doj], [IsAdmin], [refDesignation], [Address1], [Address2], [Passport], [EmergancyContact], [PanCard], [IsActive], [CreatedDate], [UpdatedDateTime]) VALUES (4, N'E013', N'Rashmi', N'Joshi', N'rj', N'j', N'Female', N'5687809', CAST(N'2004-01-28' AS Date), CAST(N'2019-01-01' AS Date), 1, 1, N'Test', N'Test', NULL, NULL, NULL, 1, CAST(N'2021-04-01T17:21:04.753' AS DateTime), NULL)
INSERT [dbo].[Employee] ([Id], [EmpCode], [EmpFName], [EmpLName], [UserName], [Password], [Gender], [ContactNo], [Dob], [Doj], [IsAdmin], [refDesignation], [Address1], [Address2], [Passport], [EmergancyContact], [PanCard], [IsActive], [CreatedDate], [UpdatedDateTime]) VALUES (5, N'E231', N'Trapti', N'g', N'T', N't', N'Female', N'3465687890', CAST(N'2021-02-05' AS Date), CAST(N'2021-03-31' AS Date), 1, 1, N'Test', N'Test', NULL, NULL, NULL, 1, CAST(N'2021-04-01T17:24:48.800' AS DateTime), NULL)
INSERT [dbo].[Employee] ([Id], [EmpCode], [EmpFName], [EmpLName], [UserName], [Password], [Gender], [ContactNo], [Dob], [Doj], [IsAdmin], [refDesignation], [Address1], [Address2], [Passport], [EmergancyContact], [PanCard], [IsActive], [CreatedDate], [UpdatedDateTime]) VALUES (6, N'E235465', N'Rajesh', N'Kumar', N'rajesh', N'r', N'Male', N'23465768', CAST(N'2021-02-05' AS Date), CAST(N'2021-03-06' AS Date), 0, 1, N'eyruti', N'yrutyi', NULL, NULL, NULL, 1, CAST(N'2021-04-01T17:27:37.043' AS DateTime), NULL)
INSERT [dbo].[Employee] ([Id], [EmpCode], [EmpFName], [EmpLName], [UserName], [Password], [Gender], [ContactNo], [Dob], [Doj], [IsAdmin], [refDesignation], [Address1], [Address2], [Passport], [EmergancyContact], [PanCard], [IsActive], [CreatedDate], [UpdatedDateTime]) VALUES (7, N'Eadmin', N'admin', N'admin', N'admin', N'admin', N'Male', N'12345678', CAST(N'1996-01-01' AS Date), CAST(N'2020-09-02' AS Date), 1, 1, N'Test', N'Test', N'Test', N'32556276', N'Test123', 1, CAST(N'2021-04-05T16:08:20.967' AS DateTime), NULL)
INSERT [dbo].[Employee] ([Id], [EmpCode], [EmpFName], [EmpLName], [UserName], [Password], [Gender], [ContactNo], [Dob], [Doj], [IsAdmin], [refDesignation], [Address1], [Address2], [Passport], [EmergancyContact], [PanCard], [IsActive], [CreatedDate], [UpdatedDateTime]) VALUES (8, N'e45326', N'l', N'u', N'l', N'l', N'Male', N'2345', CAST(N'2021-04-24' AS Date), CAST(N'2021-04-30' AS Date), 1, 1, N'test', N'test', N'TRS', N'234156', N'43546782', 1, CAST(N'2021-04-06T15:00:45.030' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeLeaveLedger] ON 

INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (1, 2, 1, N'Test', 1, NULL, NULL, 1, NULL, 3)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (2, 2, 1, N'Test', 1, NULL, NULL, 0, CAST(N'2021-04-03T01:03:49.107' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (3, 2, 1, N'test', 1, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03' AS Date), 0, CAST(N'2021-04-03T01:14:49.327' AS DateTime), 3)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (4, 2, 1, N'Test', 2.5, NULL, NULL, 1, CAST(N'2021-04-03T01:20:53.027' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (5, 2, 1, N'1', 1.5, NULL, NULL, 1, CAST(N'2021-04-03T11:55:54.850' AS DateTime), 3)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (7, 2, 1, N'Test', 1, CAST(N'2021-04-05' AS Date), CAST(N'2021-04-05' AS Date), 0, CAST(N'2021-04-05T01:47:25.137' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (8, 2, 1, N'Test', 0.5, CAST(N'2021-04-06' AS Date), CAST(N'2021-04-06' AS Date), 0, CAST(N'2021-04-05T01:57:09.940' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (9, 2, 1, N'Mont Leave', 1, NULL, NULL, 1, CAST(N'2021-04-05T02:34:28.647' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (10, 2, 1, N'April Month Leave Credited', 2.25, NULL, NULL, 1, CAST(N'2021-04-05T14:22:22.397' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (11, 3, 1, N'April Month Leave Credited', 2.25, NULL, NULL, 1, CAST(N'2021-04-05T14:22:22.397' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (12, 4, 1, N'April Month Leave Credited', 2.25, NULL, NULL, 1, CAST(N'2021-04-05T14:22:22.397' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (13, 5, 1, N'April Month Leave Credited', 2.25, NULL, NULL, 1, CAST(N'2021-04-05T14:22:22.397' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (14, 6, 1, N'April Month Leave Credited', 2.25, NULL, NULL, 1, CAST(N'2021-04-05T14:22:22.397' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveLedger] ([Id], [EmpId], [LeaveType], [Reason], [LeaveCount], [DateFrom], [DateTo], [DrCr], [CreatedDate], [CreatedBy]) VALUES (15, 4, 3, N'Tests', 1, NULL, NULL, 1, CAST(N'2021-04-05T19:33:26.277' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[EmployeeLeaveLedger] OFF
SET IDENTITY_INSERT [dbo].[EmployeeLeaveRequests] ON 

INSERT [dbo].[EmployeeLeaveRequests] ([Id], [EmpId], [LeaveFrom], [LeaveTo], [ShiftFrom], [ShiftTo], [Reason], [LeaveCount], [ApprovedStatusId], [PostedDate], [LeaveType], [CreatedDate], [ApprovedDate], [Approvedby]) VALUES (1, 2, CAST(N'2021-04-05' AS Date), CAST(N'2021-04-05' AS Date), NULL, NULL, N'Test', 1, 1, CAST(N'2021-04-04T19:21:07.787' AS DateTime), 1, CAST(N'2021-04-04T19:21:07.787' AS DateTime), CAST(N'2021-04-05T01:47:19.807' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveRequests] ([Id], [EmpId], [LeaveFrom], [LeaveTo], [ShiftFrom], [ShiftTo], [Reason], [LeaveCount], [ApprovedStatusId], [PostedDate], [LeaveType], [CreatedDate], [ApprovedDate], [Approvedby]) VALUES (2, 2, CAST(N'2021-04-06' AS Date), CAST(N'2021-04-06' AS Date), NULL, NULL, N'Test', 0.5, 1, CAST(N'2021-04-04T19:24:05.887' AS DateTime), 1, CAST(N'2021-04-04T19:24:05.887' AS DateTime), CAST(N'2021-04-05T01:57:09.473' AS DateTime), 2)
INSERT [dbo].[EmployeeLeaveRequests] ([Id], [EmpId], [LeaveFrom], [LeaveTo], [ShiftFrom], [ShiftTo], [Reason], [LeaveCount], [ApprovedStatusId], [PostedDate], [LeaveType], [CreatedDate], [ApprovedDate], [Approvedby]) VALUES (3, 2, CAST(N'2021-04-14' AS Date), CAST(N'2021-04-14' AS Date), NULL, NULL, N'Test', 0.5, 2, CAST(N'2021-04-05T02:35:06.883' AS DateTime), 1, CAST(N'2021-04-05T02:35:06.883' AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequests] ([Id], [EmpId], [LeaveFrom], [LeaveTo], [ShiftFrom], [ShiftTo], [Reason], [LeaveCount], [ApprovedStatusId], [PostedDate], [LeaveType], [CreatedDate], [ApprovedDate], [Approvedby]) VALUES (4, 2, CAST(N'2021-04-29' AS Date), CAST(N'2021-04-29' AS Date), N'Morning', N'Morning', N'Test evjfljndlfgfba,dnf aefajhlsghafdm.dfa fdbkadf bdagjkdafgj d
fhkfdcadghjfadb fad', 0.5, 2, CAST(N'2021-04-05T16:28:00.793' AS DateTime), 1, CAST(N'2021-04-05T16:28:00.793' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[EmployeeLeaveRequests] OFF
SET IDENTITY_INSERT [dbo].[LeaveStatus] ON 

INSERT [dbo].[LeaveStatus] ([Id], [LeaveStatus], [IsActive], [CreatedDateTime], [CreatedBy], [UpdatedDatetime], [UpdatedBy]) VALUES (1, N'Approved', 1, CAST(N'2021-04-03T14:50:32.717' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[LeaveStatus] ([Id], [LeaveStatus], [IsActive], [CreatedDateTime], [CreatedBy], [UpdatedDatetime], [UpdatedBy]) VALUES (2, N'Pending', 1, CAST(N'2021-04-03T14:50:32.717' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[LeaveStatus] ([Id], [LeaveStatus], [IsActive], [CreatedDateTime], [CreatedBy], [UpdatedDatetime], [UpdatedBy]) VALUES (3, N'Reject', 1, CAST(N'2021-04-03T14:51:39.153' AS DateTime), 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LeaveStatus] OFF
SET IDENTITY_INSERT [dbo].[LeaveTypes] ON 

INSERT [dbo].[LeaveTypes] ([Id], [LeaveType], [IsActive], [CreatedDateTime], [CreatedBy], [UpdatedDatetime], [UpdatedBy]) VALUES (1, N'Casual Leave', 1, NULL, 2, NULL, NULL)
INSERT [dbo].[LeaveTypes] ([Id], [LeaveType], [IsActive], [CreatedDateTime], [CreatedBy], [UpdatedDatetime], [UpdatedBy]) VALUES (2, N'Sick Leave', 1, NULL, 2, NULL, NULL)
INSERT [dbo].[LeaveTypes] ([Id], [LeaveType], [IsActive], [CreatedDateTime], [CreatedBy], [UpdatedDatetime], [UpdatedBy]) VALUES (3, N'Compensatory Off', 1, NULL, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LeaveTypes] OFF
SET IDENTITY_INSERT [dbo].[MothlyCreditLeave] ON 

INSERT [dbo].[MothlyCreditLeave] ([Id], [LeaveType], [MonthlyLeaves], [IsActive], [CreatedDateTime], [Createdby], [Updatedby], [UpdatedDateTime]) VALUES (1, 1, 2.25, 1, CAST(N'2021-04-05T13:58:57.827' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[MothlyCreditLeave] ([Id], [LeaveType], [MonthlyLeaves], [IsActive], [CreatedDateTime], [Createdby], [Updatedby], [UpdatedDateTime]) VALUES (2, 3, 1, 0, CAST(N'2021-04-05T14:05:10.143' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MothlyCreditLeave] OFF
ALTER TABLE [dbo].[CurrentFinancialYear] ADD  CONSTRAINT [DF_CurrentFinancialYear_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Designation] ADD  CONSTRAINT [DF_Designation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeLeaveLedger] ADD  CONSTRAINT [DF_EmployeeLeaveLedger_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeLeaveRequests] ADD  CONSTRAINT [DF_EmployeeLeaveDetails_PostedDate]  DEFAULT (getdate()) FOR [PostedDate]
GO
ALTER TABLE [dbo].[EmployeeLeaveRequests] ADD  CONSTRAINT [DF_EmployeeLeaveRequests_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LeaveStatus] ADD  CONSTRAINT [DF_LeaveStatus_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[MothlyCreditLeave] ADD  CONSTRAINT [DF_MothlyCreditLeave_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
/****** Object:  StoredProcedure [dbo].[SpCreditMonthlyLeavetoEmployeeBucket]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SpCreditMonthlyLeavetoEmployeeBucket]
AS
BEGIN
DECLARE @FIStartDate Datetime ,@FIEndDate Datetime
SELECT @FIStartDate =Startfrom,@FIEndDate=EndTo from dbo.GetFIYearDate()
	 Insert Into EmployeeLeaveLedger(EmpId, LeaveType, Reason, LeaveCount, DateFrom, DateTo, DrCr, CreatedDate, CreatedBy) 
	 Select emp.Id,ml.LeaveType,datename(month, GETDATE())+' Month Leave Credited',ml.MonthlyLeaves,null,null,1,GETDATE(),2 from MothlyCreditLeave ml
	 cross join Employee emp where ml.IsActive=1 and Emp.IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeLeavebyLeaveType]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spGetEmployeeLeavebyLeaveType](
@LeaveTypeId int,
@EmpID bigint
)
As 
Begin

DECLARE @FIStartDate Datetime ,@FIEndDate Datetime,@EmployeeonLeaveToday int,@PendingLeave int,@TotalEmployee int
Select @FIStartDate =Startfrom,@FIEndDate=EndTo from dbo.GetFIYearDate()

Select  @EmpID as EmpId,@LeaveTypeId as LeaveTypeId,Isnull(RemainingLeaves,0) RemainingLeaves
from 
(Select  @EmpID as EmpId)emp left Join
(
Select @EmpID as EmpId, Isnull(C.Cr-D.Dr,0) RemainingLeaves from
(Select EmpId, Sum(LeaveCount) as Cr 
from EmployeeLeaveLedger el
where LeaveType=@LeaveTypeId and DrCr=1 and CreatedDate>=@FIStartDate and CreatedDate<@FIEndDate and EmpId=@EmpID
 Group by EmpId
 ) C
left Join
(Select EmpId, Sum(LeaveCount) as Dr from EmployeeLeaveLedger el
where LeaveType=@LeaveTypeId and DrCr=0 and CreatedDate>=@FIStartDate and CreatedDate<@FIEndDate and EmpId=@EmpID
Group by EmpId
)D
on c.EmpId=D.EmpId
)DrCr on DrCr.EmpId=emp.EmpId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeLeaveRequest]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spGetEmployeeLeaveRequest](@EmpID bigint)
AS
BEGIN
DECLARE @FIStartDate Datetime ,@FIEndDate Datetime,@EmployeeonLeaveToday int,@PendingLeave int,@TotalEmployee int
Select @FIStartDate =Startfrom,@FIEndDate=EndTo from dbo.GetFIYearDate()

if(@EmpID is null)
BEGIN
Select el.Id,  el.EmpId,  el.LeaveFrom,  el.LeaveTo,  el.Reason,  el.LeaveCount,el.PostedDate,el.ApprovedDate,el.ShiftFrom,el.ShiftTo
,lt.LeaveType,ls.LeaveStatus,(approver.EmpFName+' '+approver.EmpLName) as Approvedby,(emp.EmpFName+' '+emp.EmpLName) as EmpName
from EmployeeLeaveRequests el 
left Join LeaveTypes lt on lt.Id=el.LeaveType
left join LeaveStatus ls on ls.Id=el.ApprovedStatusId 
left join Employee approver on approver.Id=el.Approvedby
left join Employee emp on emp.Id=el.EmpId
where PostedDate>=@FIStartDate and PostedDate<@FIEndDate
order by PostedDate desc
END
ELSE
Begin
Select el.Id,  el.EmpId,  el.LeaveFrom,  el.LeaveTo,  el.Reason,  el.LeaveCount,el.PostedDate,el.ApprovedDate,el.ShiftFrom,el.ShiftTo
,lt.LeaveType,ls.LeaveStatus,(emp.EmpFName+' '+emp.EmpLName) as Approvedby,(emp.EmpFName+' '+emp.EmpLName) as EmpName
from EmployeeLeaveRequests el 
left Join LeaveTypes lt on lt.Id=el.LeaveType
left join LeaveStatus ls on ls.Id=el.ApprovedStatusId 
left join Employee emp on emp.Id=el.Approvedby

where el.EmpId=@EmpID and PostedDate>=@FIStartDate and PostedDate<@FIEndDate
order by PostedDate desc
END;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpGetEmployeeLeaveTransactionDetails]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SpGetEmployeeLeaveTransactionDetails](
@EmpID bigint
)
As
Begin
DECLARE @FIStartDate Datetime ,@FIEndDate Datetime
Select @FIStartDate =Startfrom,@FIEndDate=EndTo from dbo.GetFIYearDate()
Select el.Id,EmpId,lt.LeaveType,LeaveCount,DateFrom,DateTo,case when DrCr=1 then 'Granted' else 'Availed' end as DrCr,Reason from EmployeeLeaveLedger el
left join LeaveTypes lt on lt.id=el.LeaveType
where CreatedDate>=@FIStartDate and CreatedDate<@FIEndDate and EmpId=@EmpID order by el.CreatedDate desc
end

GO
/****** Object:  StoredProcedure [dbo].[SpGetEmployewiseleave]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SpGetEmployewiseleave](@EmpID bigint)
 AS
 BEGIN
DECLARE @FIStartDate Datetime ,@FIEndDate Datetime,@EmployeeonLeaveToday int,@PendingLeave int,@TotalEmployee int
Select @FIStartDate =Startfrom,@FIEndDate=EndTo from dbo.GetFIYearDate()

 Select  V.EmpId,V.leavetypeID,V.EmpName,ISNULL(lc.RemainingLeaves,0)RemainingLeaves,V.leavetype from
 --(Select emp.Id as EmpId ,lt.Id leavetypeID,(EmpFName+' '+EmpLName)EmpName,lt.leavetype from Employee emp,LeaveTypes lt  where emp.Id =@EmpID)V  
 (Select lt.leavetypeID,lt.LeaveType,emp.EmpID,emp.EmpName from(
(select LeaveType,Id as leavetypeID, ROW_NUMBER() over (partition by Id order by Id) rownumber from LeaveTypes) lt  
left join 
(select Id as EmpId,(EmpFName+' '+EmpLName)EmpName, ROW_NUMBER() over (partition by Id order by Id) rownumber from Employee where Id=@EmpID) emp 
          on lt.rownumber=emp.rownumber ))V
   left join
   (
  Select COALESCE(C.EmpId,d.EmpId)EmpId,COALESCE(C.LeaveType,D.LeaveType)LeaveType, ISNULL(ISNULL(C.Cr,0)-ISNULL(D.Dr,0),0) RemainingLeaves from
(Select EmpId,LeaveType, Sum(LeaveCount) as Cr 
from EmployeeLeaveLedger el
where  DrCr=1 and CreatedDate>=@FIStartDate and CreatedDate<@FIEndDate 
 Group by EmpId,LeaveType
 ) C
left  JOIN 
(Select EmpId,LeaveType, Sum(LeaveCount) as Dr from EmployeeLeaveLedger el
where  DrCr=0 and CreatedDate>=@FIStartDate and CreatedDate<@FIEndDate and EmpId=@EmpID
Group by EmpId,LeaveType
)D
on c.EmpId=D.EmpId and C.LeaveType=D.LeaveType) lc on V.EmpId=lc.EmpId and V.leavetypeID=lc.leaveType order by V.EmpId 

END;
GO
/****** Object:  StoredProcedure [dbo].[SpGetLeaveDetails]    Script Date: 06-04-2021 21:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SpGetLeaveDetails](
@EmpID bigint
)
As
Begin
DECLARE @FIStartDate Datetime ,@FIEndDate Datetime,@EmployeeonLeaveToday int,@PendingLeave int,@TotalEmployee int
Select @FIStartDate =Startfrom,@FIEndDate=EndTo from dbo.GetFIYearDate()

Select @EmployeeonLeaveToday=count(Id)  from EmployeeLeaveLedger where CONVERT(date,GETDATE(),104) between DateFrom  and DateTo group by EmpId

Select @PendingLeave=count(Id)  from EmployeeLeaveRequests emr where  emr.ApprovedStatusId=2
Select @TotalEmployee=COUNT(Id) from Employee where IsActive=1
Select @EmpId as EmpId, EmployeeonLeaveToday,PendingLeave,TotalEmployee,IsNull(RemainingLeaves,0) as RemainingLeaves from
(Select @EmpId as EmpId, Isnull(@EmployeeonLeaveToday,0) EmployeeonLeaveToday,Isnull(@PendingLeave,0) PendingLeave,Isnull(@TotalEmployee,0) TotalEmployee
) V
left join
(
Select  @EmpID as EmpId,Isnull(Cr-Dr,0) RemainingLeaves
from 
(Select EmpId, Sum(LeaveCount) as Cr 
from EmployeeLeaveLedger el
where DrCr=1 and CreatedDate>=@FIStartDate and CreatedDate<@FIEndDate and EmpId=@EmpID
 Group by EmpId
 ) C
left Join
(Select EmpId, Sum(LeaveCount) as Dr from EmployeeLeaveLedger el
where DrCr=0 and CreatedDate>=@FIStartDate and CreatedDate<@FIEndDate and EmpId=@EmpID
Group by EmpId
)D
on c.EmpId=D.EmpId
)VCr on VCr.EmpId= V.empId

end;

GO
USE [master]
GO
ALTER DATABASE [EmployeeDB] SET  READ_WRITE 
GO
