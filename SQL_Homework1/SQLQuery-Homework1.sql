use [master]
go

drop database if exists [SEDCACADEMYDB]
go

create database [SEDCACADEMYDB]
go

use [SEDCACADEMYDB]
go

drop table if exists [dbo].[Students]
drop table if exists [dbo].[Teachers]
drop table if exists [dbo].[Grades]
drop table if exists [dbo].[Courses]
drop table if exists [dbo].[AchivementTypes]
drop table if exists [dbo].[GradeDetails]
go

create table Students(
	[Id] bigint identity (1,1) not null,
	[FirstName] nvarchar(max) null,
	[LastName] nvarchar (max) null,
	[DateOfBirth] date null,
	[EnroledDate] date null,
	[Gender] nchar(1) NULL, -- 'F' / 'M'
	[NationalIdNumber] nvarchar(20) null,
	[StudentCardNumber] nvarchar(20) null,
	constraint [PK_Students] primary key (Id)
)
go

create table Teachers(
	[Id] bigint identity (1,1) not null,
	[FirstName] nvarchar(max) null,
	[LastName] nvarchar (max) null,
	[DateOfBirth] date null,
	[AcademicRank] nvarchar(100) null,
	[HireDate] date null, 
	constraint [PK_Teachers] primary key (Id)
)
go

create table Grades(
	[Id] bigint identity (1,1) not null,
	[StudentId] int null,
	[TeacherId] int null,
	[Grade] int null,
	[Comment] nvarchar(max) null,
	[CreatedDate] date null, 
	constraint [PK_Grades] primary key (Id)
)
go

create table Courses(
	[Id] bigint identity (1,1) not null,
	[Name] nvarchar(max) null,
	[Credit] int null,
	[AcademicYear] nvarchar(20) null,
	[Semester] int null, 
	constraint [PK_Courses] primary key (Id)
)
go

create table CoursesDetails(
	[Id] bigint identity (1,1) not null,
	[AchivementTypeId] int null,
	[AchivementPoints] int null,
	[AchivementMaxPoints] nvarchar(20) null,
	[AchivementDate] date null, 
	constraint [PK_CoursesDetails] primary key (Id)
)
go

create table AchivementType(
	[Id] bigint identity (1,1) not null,
	[Name] nvarchar(max) null,
	[Description] nvarchar(max) null,
	[ParticipationRate] int null,
	constraint [PK_AchivementType] primary key (Id)
)
go


