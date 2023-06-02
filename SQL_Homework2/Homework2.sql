--Find all Students with FirstName = Antonio
select *
from Student s
where s.FirstName = 'Antonio'
go

--Find all Students with DateOfBirth greater than ‘01.01.1999'
select *
from Student s
where s.DateOfBirth > '01.01.1999'
go

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
select *
from Student s
where s.LastName like 'J%' and s.EnrolledDate >= '01.01.1998' and s.EnrolledDate <= '01.31.1998'
go

--List all Students ordered by FirstName
select *
from Student s
order by s.FirstName
go

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
select distinct t.LastName as TeacherLastName, s.LastName as StudentLastName
from Teacher t
join Student s
on t.ID = s.ID
go

select distinct LastName
from (
    select distinct LastName from Teacher
    union
    select distinct LastName from Student
) as Names;
go

--Create Foreign key constraints from diagram or with script
alter table Grade
add constraint FK_Student_Grade1
foreign key (StudentID) references[dbo].[Student]([ID])
go

alter table Grade
add constraint FK_Course_Grade
foreign key (CourseID) references[dbo].[Course]([ID])
go

alter table Grade
add constraint FK_Teacher_Grade
foreign key (TeacherID) references[dbo].[Teacher]([ID])
go



--List all possible combinations of Courses names and AchievementType names that can be passed by student
select c.Name as CourseName, ta.Name as AchivementTypeName
from Course c
cross join AchievementType ta
go

alter table GradeDetails
drop constraint FK_Grade_GradeDetails

alter table GradeDetails
add constraint FK_Grade_GradeDetails
foreign key (GradeID) references[dbo].[Grade]([ID])
go

alter table GradeDetails
add constraint FK_AchivementType_GradeDetails
foreign key (AchievementTypeID) references [dbo].[AchievementType]([ID])
go

--List all Teachers without exam Grade
select *
from Teacher t
left join Grade g 
on t.ID = g.TeacherID
where g.TeacherID is null