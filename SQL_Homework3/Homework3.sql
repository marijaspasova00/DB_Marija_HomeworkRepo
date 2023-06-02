--Calculate the count of all grades per Teacher in the system
select t.FirstName, t.LastName, COUNT(g.Grade) as GradeCount
from Teacher t
left join Grade g 
on t.ID = g.TeacherID
group by t.ID, t.FirstName, t.LastName
go

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
select s.FirstName, s.LastName, COUNT(g.Grade) as GradeCount
from Teacher t
left join Grade g 
on t.ID = g.TeacherID
join Student s 
on g.StudentID = s.ID
where s.ID < 100
group by s.ID, s.FirstName, s.LastName
go

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
select StudentID, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade
from Grade
group by StudentID
go

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
select t.FirstName as Teacher, COUNT(*) as GradeCount
from Grade g
join Teacher t 
on g.TeacherId = t.ID
group by t.FirstName
having COUNT(*) > 200;
go

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
select s.FirstName, COUNT(Grade) as GradeCount, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade
from Grade g
join Student s 
on g.StudentID = s.ID
group by s.FirstName
having MAX(Grade) = AVG(Grade);
go

--List Student First Name and Last Name next to the other details from previous query
select s.FirstName, s.LastName, COUNT(Grade) as GradeCount, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade
from Grade g
join Student s 
on g.StudentID = s.ID
group by s.FirstName, s.LastName
having MAX(Grade) = AVG(Grade);
go

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
create view vv_StudentGrades as
select StudentID, COUNT(*) as GradeCount
from Grade
group by StudentID;
go

select * from vv_StudentGrades;
go

--Change the view to show Student First and Last Names instead of StudentID
create view vv_StudentGrades1 as
select s.FirstName, s.LastName, COUNT(*) as GradeCount
from Grade g
join Student s 
on g.StudentID = s.ID
group by s.ID, s.FirstName, s.LastName;
go

select * from vv_StudentGrades1
go

--List all rows from view ordered by biggest Grade Count
select * from vv_StudentGrades1 
order by GradeCount desc
go




