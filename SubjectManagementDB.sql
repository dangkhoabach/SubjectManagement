USE [SubjectManagementDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 03/11/2023 14:33:43 ******/
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
/****** Object:  Table [dbo].[ExamSchedule]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[ExtracurricularActivities]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[Instructors]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[Majors]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[ParticipateInActivities]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[RegisteredCourses]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[SchoolFees]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 03/11/2023 14:33:44 ******/
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
/****** Object:  Table [dbo].[StudentMark]    Script Date: 03/11/2023 14:33:44 ******/
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
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'ANRU01', N'Cổ ngữ học Runes', N'CNTT', 3, 6, N'Thứ sáu', 7, 1, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'APDI01', N'Độn thổ', N'CNTT', 3, 3, N'Thứ ba', 1, 2, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'ARIT01', N'Số học huyền bí', N'CNTT', 3, 6, N'Thứ tư', 1, 3, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'ASTR01', N'Thiên văn học', N'CNTT', 3, 6, N'Thứ bảy', 7, 4, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'CHAR01', N'Bùa chú', N'CNTT', 3, 6, N'Thứ năm', 1, 5, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'COMC01', N'Chăm sóc sinh vật huyền bí', N'CNTT', 3, 6, N'Chủ nhật', 1, 6, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'DADA01', N'Phòng chống nghệ thuật hắc ám', N'CNTT', 3, 6, N'Thứ hai', 1, 7, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'DIVI01', N'Tiên tri', N'CNTT', 3, 3, N'Thứ hai', 10, 8, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 3)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'FLYI01', N'Bay', N'CNTT', 3, 3, N'Thứ ba', 4, 9, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 3)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'HERB01', N'Thảo dược học', N'CNTT', 3, 6, N'Thứ bảy', 1, 10, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 3)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'HIMA01', N'Lịch sử pháp thuộc', N'CNTT', 3, 6, N'Thứ tư', 7, 11, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'MUGG01', N'Muggle học', N'CNTT', 3, 6, N'Thứ sáu', 1, 12, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'OCCL01', N'Bế quan bí thuật', N'CNTT', 3, 6, N'Thứ năm', 7, 13, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'POTI01', N'Độc dược', N'QHCC', 3, 6, N'Thứ ba', 7, 14, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
INSERT [dbo].[Courses] ([SubjectID], [SubjectName], [MajorsID], [Credits], [Lessons], [Day], [StartSlot], [RoomID], [InstructorID], [PeriodStart], [PeriodEnd], [PriorityLevel]) VALUES (N'TRAN01', N'Biến hình', N'QHCC', 3, 3, N'Thứ hai', 7, 15, N'THH01', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date), 2)
GO
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [Email], [PhoneNumber]) VALUES (N'THH01', N'Trần Hữu Huy', N'abc@gmail.com', N'0123456789')
GO
INSERT [dbo].[Majors] ([MajorsID], [MajorsName], [SchoolYear]) VALUES (N'CNTT', N'Công nghệ thông tin', 4)
INSERT [dbo].[Majors] ([MajorsID], [MajorsName], [SchoolYear]) VALUES (N'QHCC', N'Quan hệ công chúng', 4)
GO
SET IDENTITY_INSERT [dbo].[RegisteredCourses] ON 

INSERT [dbo].[RegisteredCourses] ([RegistrationID], [StudentID], [SubjectID]) VALUES (4, N'2011060468', N'DADA01')
INSERT [dbo].[RegisteredCourses] ([RegistrationID], [StudentID], [SubjectID]) VALUES (7, N'2011060468', N'CHAR01')
INSERT [dbo].[RegisteredCourses] ([RegistrationID], [StudentID], [SubjectID]) VALUES (8, N'2011060468', N'FLYI01')
INSERT [dbo].[RegisteredCourses] ([RegistrationID], [StudentID], [SubjectID]) VALUES (9, N'2011060468', N'ANRU01')
INSERT [dbo].[RegisteredCourses] ([RegistrationID], [StudentID], [SubjectID]) VALUES (10, N'2011060468', N'COMC01')
SET IDENTITY_INSERT [dbo].[RegisteredCourses] OFF
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
INSERT [dbo].[Student] ([StudentID], [Password], [FullName], [Email], [PhoneNumber], [MajorsID]) VALUES (N'2011060468', N'123456', N'Bạch Thái Đăng Khoa', N'dangkhoabach2002@gmail.com', N'0948268057', N'CNTT')
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
