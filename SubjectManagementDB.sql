USE [SubjectManagementDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[SubjectID] [nvarchar](10) NOT NULL,
	[SubjectName] [nvarchar](100) NULL,
	[MajorsID] [nvarchar](10) NULL,
	[Credits] [int] NULL,
	[Lessons] [int] NULL,
	[Day] [nvarchar](50) NULL,
	[StartSlot] [int] NULL,
	[RoomID] [int] NULL,
	[InstructorID] [nvarchar](10) NULL,
	[PeriodStart] [date] NULL,
	[PeriodEnd] [date] NULL,
	[PriorityLevel] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamSchedule]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSchedule](
	[ExamID] [nvarchar](10) NOT NULL,
	[ExamName] [nvarchar](50) NULL,
	[SubjectID] [nvarchar](10) NULL,
	[RoomID] [int] NULL,
	[InstructorID] [nvarchar](10) NULL,
	[ExamDate] [date] NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK_ExamSchedule] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtracurricularActivities]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtracurricularActivities](
	[ActivityID] [int] NOT NULL,
	[ActivityName] [nvarchar](100) NULL,
	[ActivityDate] [date] NULL,
	[MainContain] [nvarchar](500) NULL,
 CONSTRAINT [PK_ExtracurricularActivities] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[InstructorID] [nvarchar](10) NOT NULL,
	[InstructorName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
 CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[MajorsID] [nvarchar](10) NOT NULL,
	[MajorsName] [nvarchar](100) NULL,
	[SchoolYear] [int] NULL,
 CONSTRAINT [PK_Majors] PRIMARY KEY CLUSTERED 
(
	[MajorsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipateInActivities]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipateInActivities](
	[ActivityID] [int] NOT NULL,
	[StudentID] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ParticipatingStudents] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisteredCourses]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredCourses](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](15) NULL,
	[SubjectID] [nvarchar](10) NULL,
 CONSTRAINT [PK_CoursesRegistration] PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](10) NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolFees]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolFees](
	[FeeID] [nvarchar](10) NOT NULL,
	[StudentID] [nvarchar](15) NULL,
	[Fee] [float] NULL,
	[FeeType] [nvarchar](50) NULL,
	[Expired] [date] NULL,
	[Status] [nvarchar](100) NULL,
 CONSTRAINT [PK_SchoolFees] PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[MajorsID] [nvarchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentMark]    Script Date: 03/11/2023 19:44:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentMark](
	[MarkID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](15) NULL,
	[SubjectID] [nvarchar](10) NULL,
	[FirstExam] [float] NULL,
	[SecondExam] [float] NULL,
	[AdditionalExam] [float] NULL,
	[FinalExam] [float] NULL,
 CONSTRAINT [PK_StudentMark] PRIMARY KEY CLUSTERED 
(
	[MarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'CSDL02', N'Cơ sở dữ liệu nâng cao', N'CNTT', 3, 6, N'Chủ nhật', 1, 6, N'NVA01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'JAVA01', N'Lập trình ứng dụng JAVA', N'CNTT', 3, 6, N'Thứ hai', 1, 7, N'NVA01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'KDQT03', N'Quản trị Doanh nghiệp Quốc tế', N'QTKD', 3, 6, N'Thứ năm', 1, 5, N'PTC03', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'KTQT02', N'Kế toán Quản trị', N'QTKD', 3, 6, N'Thứ tư', 1, 3, N'PTC03', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'KVBD01', N'Kỹ năng viết và biểu đạt', N'QHCC', 3, 6, N'Thứ tư', 7, 11, N'BTE05', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'MOBI05', N'Lập trình ứng dụng di động', N'CNTT', 3, 3, N'Thứ ba', 4, 9, N'TVB02', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 3)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'NCTT01', N'Nghiên cứu Thị trường', N'MAKE', 3, 3, N'Thứ ba', 1, 17, N'DVG07', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'NLMK03', N'Nguyên lý Marketing', N'MAKE', 3, 6, N'Thứ bảy', 1, 16, N'DVG07', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'PTDL02', N'Quản trị Phân tích Dữ liệu', N'QTKD', 3, 6, N'Thứ bảy', 7, 4, N'PTC03', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'PTTK02', N'Phân tích thiết kế hệ thống', N'CNTT', 3, 6, N'Thứ bảy', 1, 10, N'TVB02', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 3)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'QCQT05', N'Quan hệ công chúng quốc tế', N'QHCC', 3, 6, N'Thứ ba', 7, 14, N'BTE05', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'QLSK04', N'Quản lý sự kiện', N'QHCC', 3, 6, N'Thứ năm', 7, 13, N'BTE05', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'QLTH04', N'Quản lý Thương hiệu', N'MAKE', 3, 6, N'Chủ nhật', 7, 20, N'HTH08', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 3)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'QTCL01', N'Quản trị Chiến lược', N'QTKD', 3, 6, N'Thứ sáu', 7, 1, N'LTD04', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'QTTC01', N'Quản trị Tài chính', N'QTKD', 3, 3, N'Thứ ba', 1, 2, N'LTD04', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'QTTT05', N'Kinh doanh Quốc tế và Tiếp thị', N'MAKE', 3, 3, N'Thứ tư', 7, 19, N'DVG07', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'TDPT02', N'Truyền thông đa phương tiện', N'QHCC', 3, 6, N'Thứ sáu', 1, 12, N'CVF06', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'TMXH01', N'Tiếp thị Mạng Xã hội', N'MAKE', 3, 6, N'Thứ bảy', 7, 18, N'HTH08', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'TTKC02', N'Quản lý truyền thông khẩn cấp', N'QHCC', 3, 3, N'Thứ hai', 7, 15, N'CVF06', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'WIND03', N'Lập trình trên môi trường Windows', N'CNTT', 3, 3, N'Thứ hai', 10, 8, N'TVB02', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 3)
GO
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'BTE05', N'Bùi Thị E', N'bte@gmail.com', N'0112233445')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'CVF06', N'Cao Văn F', N'cvf@gmail.com', N'0134679852')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'DVG07', N'Đoàn Văn G', N'dvg@gmail.com', N'0159372486')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'HTH08', N'Hoàng Thị H', N'hth@gmail.com', N'0246813579')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'LTD04', N'Lê Thị D', N'ltd@gmail.com', N'0321654987')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'NVA01', N'Nguyễn Văn A', N'nva@gmail.com', N'0123456789')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'PTC03', N'Phạm Thị C', N'ttc@gmail.com', N'0147258369')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'TVB02', N'Trần Văn B', N'tvb@gmail.com', N'0987654321')
GO
INSERT [dbo].[Majors] ([MajorsID], [MajorsName], [SchoolYear]) VALUES (N'CNTT', N'Công nghệ thông tin', 4)
INSERT [dbo].[Majors] ([MajorsID], [MajorsName], [SchoolYear]) VALUES (N'MAKE', N'Marketing', 4)
INSERT [dbo].[Majors] ([MajorsID], [MajorsName], [SchoolYear]) VALUES (N'QHCC', N'Quan hệ công chúng', 4)
INSERT [dbo].[Majors] ([MajorsID], [MajorsName], [SchoolYear]) VALUES (N'QTKD', N'Quản trị kinh doanh', 4)
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (1, N'E1.01.01
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (2, N'E1.01.02
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (3, N'E1.01.03
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (4, N'E1.01.04
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (5, N'E1.01.05
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (6, N'E1.01.06
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (7, N'E1.01.07', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (8, N'E1.01.08
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (9, N'E1.01.09
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (10, N'E1.01.10
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (11, N'E1.02.01
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (12, N'E1.02.02
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (13, N'E1.02.03', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (14, N'E1.02.04
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (15, N'E1.02.05', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (16, N'E1.02.06', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (17, N'E1.02.07', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (18, N'E1.02.08
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (19, N'E1.02.09
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (20, N'E1.02.10
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (21, N'E1.03.01
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (22, N'E1.03.02
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (23, N'E1.03.03
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (24, N'E1.03.04
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (25, N'E1.03.05
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (26, N'E1.03.06
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (27, N'E1.03.07
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (28, N'E1.03.08
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (29, N'E1.03.09
', 50)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Capacity]) VALUES (30, N'E1.03.10
', 50)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
INSERT [dbo].[Student] ([StudentID], [Password], [FullName], [Email], [PhoneNumber], [MajorsID]) VALUES (N'2011060468', N'2011060468', N'Bạch Thái Đăng Khoa', N'dangkhoabach2002@gmail.com', N'0948268057', N'CNTT')
INSERT [dbo].[Student] ([StudentID], [Password], [FullName], [Email], [PhoneNumber], [MajorsID]) VALUES (N'2011061565', N'2011061565', N'Trần Hữu Huy', N'tranhuuhuy1812@gmail.com', N'0941685373', N'QHCC')
INSERT [dbo].[Student] ([StudentID], [Password], [FullName], [Email], [PhoneNumber], [MajorsID]) VALUES (N'2011065084', N'2011065084', N'Lê Thúy Vy', N'lethuyvy321@gmail.com', N'0977460010', N'QTKD')
INSERT [dbo].[Student] ([StudentID], [Password], [FullName], [Email], [PhoneNumber], [MajorsID]) VALUES (N'2011065192', N'2011065192', N'Lê Huỳnh Hương', N'lehuynhhuong.0610@gmail.com', N'0379061002', N'MAKE')
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Instructors] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([InstructorID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Instructors]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Majors] FOREIGN KEY([MajorsID])
REFERENCES [dbo].[Majors] ([MajorsID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Majors]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Room]
GO
ALTER TABLE [dbo].[ExamSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ExamSchedule_Courses] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Courses] ([SubjectID])
GO
ALTER TABLE [dbo].[ExamSchedule] CHECK CONSTRAINT [FK_ExamSchedule_Courses]
GO
ALTER TABLE [dbo].[ExamSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ExamSchedule_Instructors] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([InstructorID])
GO
ALTER TABLE [dbo].[ExamSchedule] CHECK CONSTRAINT [FK_ExamSchedule_Instructors]
GO
ALTER TABLE [dbo].[ExamSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ExamSchedule_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[ExamSchedule] CHECK CONSTRAINT [FK_ExamSchedule_Room]
GO
ALTER TABLE [dbo].[ParticipateInActivities]  WITH CHECK ADD  CONSTRAINT [FK_ParticipateInActivities_ExtracurricularActivities] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[ExtracurricularActivities] ([ActivityID])
GO
ALTER TABLE [dbo].[ParticipateInActivities] CHECK CONSTRAINT [FK_ParticipateInActivities_ExtracurricularActivities]
GO
ALTER TABLE [dbo].[ParticipateInActivities]  WITH CHECK ADD  CONSTRAINT [FK_ParticipateInActivities_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[ParticipateInActivities] CHECK CONSTRAINT [FK_ParticipateInActivities_Student]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_CoursesRegistration_Courses] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Courses] ([SubjectID])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_CoursesRegistration_Courses]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_CoursesRegistration_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_CoursesRegistration_Student]
GO
ALTER TABLE [dbo].[SchoolFees]  WITH CHECK ADD  CONSTRAINT [FK_SchoolFees_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[SchoolFees] CHECK CONSTRAINT [FK_SchoolFees_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Majors] FOREIGN KEY([MajorsID])
REFERENCES [dbo].[Majors] ([MajorsID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Majors]
GO
ALTER TABLE [dbo].[StudentMark]  WITH CHECK ADD  CONSTRAINT [FK_StudentMark_Courses] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Courses] ([SubjectID])
GO
ALTER TABLE [dbo].[StudentMark] CHECK CONSTRAINT [FK_StudentMark_Courses]
GO
ALTER TABLE [dbo].[StudentMark]  WITH CHECK ADD  CONSTRAINT [FK_StudentMark_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentMark] CHECK CONSTRAINT [FK_StudentMark_Student]
GO
