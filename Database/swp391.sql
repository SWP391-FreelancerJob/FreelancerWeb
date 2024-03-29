CREATE DATABASE [Swp391_FreelanceJob]
GO

USE [Swp391_FreelanceJob] 
GO

ALTER DATABASE [Swp391_FreelanceJob] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET ARITHABORT OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Swp391_FreelanceJob] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Swp391_FreelanceJob] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Swp391_FreelanceJob] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET  DISABLE_BROKER
GO
ALTER DATABASE [Swp391_FreelanceJob] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Swp391_FreelanceJob] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Swp391_FreelanceJob] SET  READ_WRITE
GO
ALTER DATABASE [Swp391_FreelanceJob] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Swp391_FreelanceJob] SET  MULTI_USER
GO
ALTER DATABASE [Swp391_FreelanceJob] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Swp391_FreelanceJob] SET DB_CHAINING OFF
GO

CREATE TABLE [dbo].[Feedback] (
	[jobID] int  NOT NULL, 
	[feedback] nvarchar(max) NULL
)
GO

CREATE TABLE [dbo].[Job] (
	[jobID] int identity NOT NULL, 
	[jobName] nvarchar(100) NOT NULL, 
	[description] nvarchar(500) NULL, 
	[image] varchar(max) NULL, 
	[price] int NOT NULL, 
	[startTime] date NOT NULL, 
	[endTime] date NOT NULL, 
	[tagID] varchar(10) NOT NULL, 
	[accountID] varchar(50) NOT NULL, 
	[status] int NULL, 
	PRIMARY KEY CLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Account] (
	[accountID] varchar(50) NOT NULL, 
	[profileID]  int identity NOT NULL,  
	[password] varchar(20) NOT NULL, 
	[roleID] varchar(10) NOT NULL, 
	[status] bit NOT NULL, 
	PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Tag] (
	[tagID] varchar(10) NOT NULL, 
	[tagName] nvarchar(30) NOT NULL, 
	PRIMARY KEY CLUSTERED 
(
	[tagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Profile] (
	[profileID] int Identity, 
	[profileName] nvarchar(30) NOT NULL, 
	[birthday] date NULL, 
	[avatar] varchar(max) NULL DEFAULT 'avatardefault.jpg',
	[phone] varchar(10) NULL, 
	[address] nvarchar(100) NULL, 
	[email] varchar(30) NOT NULL, 
	[describe] nvarchar(max) NULL,
	PRIMARY KEY CLUSTERED 
(
	[profileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Role] (
	[roleID] varchar(10) NOT NULL, 
	[roleName] varchar(30) NOT NULL, 
	PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Apply] (
	[accountID] varchar(50) NOT NULL, 
	[jobID] int NOT NULL, 
	[applyTime] date NOT NULL, 
	[checkApply] bit NULL,
	[offers] int NOT NULL,
	[completeExpect] nvarchar(50) NOT NULL,
	[introduce] nvarchar(max) NOT NULL,
	[plan] nvarchar(max) NOT NULL
);

CREATE TABLE [dbo].[UserMajor] (
	[accountID] varchar(50) NOT NULL, 
	[tagID] varchar(10) NOT NULL
);

Create table [Product](
jobID int not null,
FOREIGN KEY (jobID) REFERENCES dbo.job (jobID),
[productID] int identity not null PRIMARY KEY,
title nvarchar(50) not null,
description nvarchar(500) not null,
link varchar(max) not null,
dateUpload date not null,
);

Create table Contact(
jobID int not null,
FOREIGN KEY (jobID) REFERENCES dbo.job (jobID),
accountID varchar(50) NOT NULL,
FOREIGN KEY (accountID) REFERENCES dbo.Account (accountID),
[Message] nvarchar(max) not null,
[time] time not null,
[date] date not null
)

Create table History(
JobID int not null,
FOREIGN KEY (jobID) REFERENCES dbo.job (jobID),
accountID_employer varchar(50) NOT NULL,
FOREIGN KEY (accountID_employer) REFERENCES dbo.Account (accountID),
accountID_employee varchar(50) NOT NULL,
FOREIGN KEY (accountID_employee) REFERENCES dbo.Account (accountID),
date_end date NOT NULL,
time_end time NOT NULL,
)

ALTER TABLE [dbo].[Profile] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[profileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CONSTRAINT [FK_jobID_Feedback] FOREIGN KEY([jobID])
REFERENCES [dbo].[Job] ([jobID])
GO


ALTER TABLE [dbo].[Job]  WITH CHECK ADD CONSTRAINT [FK_tagID_Job] FOREIGN KEY([tagID])
REFERENCES [dbo].[Tag] ([tagID])
GO

ALTER TABLE [dbo].[UserMajor]  WITH CHECK ADD CONSTRAINT [FK_tagID_UserMajor] FOREIGN KEY([tagID])
REFERENCES [dbo].[Tag] ([tagID])
GO

ALTER TABLE [dbo].[Apply]  WITH CHECK ADD CONSTRAINT [FK_jobID_Apply] FOREIGN KEY([jobID])
REFERENCES [dbo].[Job] ([jobID])
GO

ALTER TABLE [dbo].[Job]  WITH CHECK ADD CONSTRAINT [FK_accountID_Job] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO

ALTER TABLE [dbo].[Apply]  WITH CHECK ADD CONSTRAINT [FK_accountID_Apply] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO

ALTER TABLE [dbo].[UserMajor]  WITH CHECK ADD CONSTRAINT [FK_accountID_UserMajor] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO

ALTER TABLE [dbo].[Account]  WITH CHECK ADD CONSTRAINT [FK_roleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO

ALTER TABLE [dbo].[Account]  WITH CHECK ADD CONSTRAINT [FK_profileID] FOREIGN KEY([profileID])
REFERENCES [dbo].[Profile] ([profileID])
GO	

ALTER TABLE [dbo].[Profile]  WITH CHECK ADD CHECK  (([phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Profile] WITH CHECK ADD CHECK ((YEAR(GETDATE()) - YEAR(birthday)) > 16)
GO

INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (N'US', N'User')
SELECT * FROM Role

INSERT [dbo].[Profile] ([profileName], [birthday], [phone], [address], [email])
VALUES ('Admin', '2001-09-23', '0123456789', '', 'admin@gmail.com')
INSERT [dbo].[Profile] ([profileName], [birthday], [phone], [address], [email])
VALUES ('User', '2001-05-25', '0987654321', '', 'user@gmail.com')
INSERT [dbo].[Profile] ([profileName], [birthday], [phone], [address], [email])
VALUES ('Hoang Tam', '2001-09-23', NULL, '', 'hoangtammht@gmail.com')
INSERT [dbo].[Profile] ([profileName], [birthday], [phone], [address], [email])
VALUES ('Thinh Nguyen', '2001-05-25', NULL, '', 'thinhnguyen@gmail.com')
SELECT * FROM Profile

INSERT [dbo].[Account] ([accountID], [password], [roleID], [status])
VALUES ('Admin', '1', 'AD', 1)
INSERT [dbo].[Account] ([accountID], [password], [roleID], [status])
VALUES ('User',  '1', 'US', 1)
INSERT [dbo].[Account] ([accountID], [password], [roleID], [status])
VALUES ('hoangtam',  '1', 'US', 1)
INSERT [dbo].[Account] ([accountID], [password], [roleID], [status])
VALUES ('thinhnguyen',  '1', 'US', 1)
SELECT * from Account

INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T01', N'Thiết kế độ họa')
INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T02', N'Quảng cáo')
INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T03', N'Văn bản và dịch thuật')
INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T04', N'Chỉnh sửa hình ảnh')
INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T05', N'Chỉnh sửa videos')
INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T06', N'Công nghệ thông tin')
INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T07', N'Kinh doanh')
INSERT [dbo].[Tag] ([tagID],[tagName]) VALUES ('T08', N'Khác')
SELECT * FROM Tag

INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])
VALUES (N'Tuyển dụng IT', N'Sử dụng Java để làm dự án', 'cntt.png', 3500000, '2022-06-12', '2022-07-15', 'T06', 'hoangtam', 1)
INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])
VALUES (N'Giới thiệu trang web', N'Quảng cáo trang web', 'quangcao.png', 3000000, '2022-07-12', '2022-07-25', 'T02', 'thinhnguyen', 1)
INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])
VALUES (N'Dịch thuật', N'Dịch văn bản, phiên dịch', 'dichthuat.png', 2000000, '2022-07-12', '2022-07-25', 'T03', 'thinhnguyen', 1)
INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])
VALUES (N'Thiết kế web', N'Thiết kế theo yêu cầu', 'thietkedohoa.png', 4000000, '2022-07-12', '2022-07-25', 'T01', 'thinhnguyen', 1)
INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])
VALUES (N'Xây dựng trang web bằng reactJS', N'Tạo trang web bằng reactJS', 'cntt.png', 4500000, '2022-07-12', '2022-07-25', 'T06', 'thinhnguyen', 1)
INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])
VALUES (N'Xây dựng trang web bằng NodeJS', N'Tạo trang web bằng NodeJS', 'cntt.png', 8000000, '2022-07-12', '2022-07-25', 'T06', 'thinhnguyen', 1)
INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])
VALUES (N'Tạo trang web bằng PHP', N'Tạo trang web bằng PHP', 'cntt.png', 9000000, '2022-07-12', '2022-07-25', 'T06', 'thinhnguyen', 1)
		

    

