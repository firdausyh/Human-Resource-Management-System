--1
create procedure spOne
as
begin
select Employee_Details.Emp_First_Name, Employee_Details.Emp_Last_Name, Employee_Details.Emp_Address1, Employee_Details.Emp_Address2, Country.Country_Name, State.State_Name, City.City_Name, Employee_Details.Emp_Mobile, Designation.Design_Name
from Employee_Details
Join Country on Employee_Details.Emp_Country_Id=Country.Country_Id
Join State on Employee_Details.Emp_State_Id=State.State_Id
Join City on Employee_Details.Emp_City_Id=City.City_Id
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
end
go

--2
create procedure spTwo
as
begin
select State.State_Name, Country.Country_Name
from State 
join Country on State.Country_Id=Country.Country_Id
order by State_Name asc
end
go

--3
create procedure spThree
as
begin
select * from Country
order by Country_name asc
offset 0 rows
fetch next 3 rows only
end
go

--4
create procedure spFour
as
begin
select Emp_First_Name 
from Employee_Details
where Emp_First_Name like 'a%'
end
go

--5
create procedure spFive
as
begin
select Emp_First_Name 
from Employee_Details
where Emp_First_Name like '%a'
end
go

--6
create procedure spSix
as
begin
select Emp_First_Name, Emp_Last_Name 
from Employee_Details
where Emp_Active = 0
end
go

--7
create procedure spSeven
as
begin
select Emp_First_Name as First_Name, Emp_Last_Name as Last_Name, Emp_Middle_Name as Middle_Name
from Employee_Details
end
go

--8
create procedure spEight
as
begin
select count(*)
from Employee_Details
end 
go

--9
create procedure spNine
as
begin
select count(*)
from Employee_Details
where Emp_Middle_Name is not null
end
go

--10
create procedure spTen
as
begin
update Employee_Details
set Emp_Middle_Name = 'Not Applicable'
where Emp_Middle_Name is null 
select Emp_First_Name, Emp_Last_Name, Emp_Middle_Name
from Employee_Details
end
go

--11
create procedure spEleven
as
begin
select  concat(Emp_First_Name, Emp_Middle_Name, Emp_Last_Name) as Concat_Names
from Employee_Details
end
go

--12
create procedure spTwelve
as
begin
select Emp_First_Name, Emp_Last_Name, Emp_Middle_Name, Emp_Address1, Emp_Address2, Emp_Country_Id, Emp_City_Id, Emp_Zip, Emp_Mobile, Emp_Gender, Design_Id, Emp_DOB, Emp_JoinDate, Emp_Active
from Employee_Details
join Country on Employee_Details.Emp_Country_Id=Country.Country_Id
order by Country_Name asc
end
go

--13
create procedure spThirteen
as
begin
select * from Employee_Details
order by Emp_First_name asc
offset 0 rows
fetch next 10 rows only
end
go

--14
create procedure spFourteen
as
begin
select Emp_First_Name, Emp_Last_Name, Emp_Middle_Name, Emp_Address1, Emp_Address2, Emp_Country_Id, Emp_City_Id, Emp_Zip, Emp_Mobile, Emp_Gender, Design_Id, Emp_DOB, Emp_JoinDate, Emp_Active
from Employee_Details
join City on Employee_Details.Emp_City_Id=City.City_Id
where City_Name in ('Dallas', 'Algiers')
end
go

--15
create procedure spFifteen
as
begin
select Emp_First_Name, Emp_Last_Name, Emp_Middle_Name, Emp_Address1, Emp_Address2, Emp_Country_Id, Emp_City_Id, Emp_Zip, Emp_Mobile, Emp_Gender, Design_Id, Emp_DOB, Emp_JoinDate, Emp_Active
from Employee_Details
join City on Employee_Details.Emp_City_Id=City.City_Id
where City_Name like 'A%' or City_Name like 'B%'
or City_Name like 'C%'or City_Name like 'D%'
end
go

--16
create procedure spSixteen
as
begin
select Emp_First_Name, Emp_Last_Name, Country_Name, Design_Name, Emp_DOB
from Employee_Details
Join Country on Employee_Details.Emp_Country_Id=Country.Country_Id
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
where (Emp_DOB >= '19840102' and Emp_DOB <= '19860901')
end
go

--17
create procedure spSeventeen
as
begin
select Emp_First_Name, Emp_Last_Name, Country_Name, Design_Name, Emp_Salary
from Employee_Details
Join Country on Employee_Details.Emp_Country_Id=Country.Country_Id
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
group by Emp_First_Name, Emp_Last_Name, Country_Name, Design_Name, Emp_Salary
having Emp_Salary = (SELECT MAX(Emp_Salary) FROM Salary)
end
go

--18
create procedure Eighteen
as
begin
select Emp_First_Name, Emp_Last_Name, Country_Name, Design_Name, Emp_Salary
from Employee_Details
Join Country on Employee_Details.Emp_Country_Id=Country.Country_Id
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
end
go

--19
create procedure spNinteen
as
begin
select Emp_First_Name, Emp_Last_Name, Country_Name, Design_Name, Emp_Salary
from Employee_Details
Join Country on Employee_Details.Emp_Country_Id=Country.Country_Id
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
where Emp_Salary >='50000' and Emp_Salary <= '100000'
end
go

--20
create procedure spTwenty
as
begin
select Emp_First_Name, substring(Employee_Details.Emp_First_Name, 1, 3)
 from Employee_Details
 end
 go

 --21
create procedure spTwentyOne
as
begin
select replace(Emp_First_Name collate Latin1_General_BIN, 'a', '$')
from Employee_Details
end 
go

--22
create procedure spTwentyTwo
as
begin
select Emp_First_Name,
Datepart(Year,Emp_JoinDate) as Year, 
Datepart(Month, Emp_JoinDate) as Month, 
Datepart(Day, Emp_JoinDate)as Day
from Employee_Details
end
go

--23
create procedure spTwentyThree
as
begin
select * 
from Employee_Details
where Emp_JoinDate = '2014'
end
go

--24
create procedure spTwentyFour
as
begin
select * 
from Employee_Details
where Emp_JoinDate < '2014-01-01'
end
go

--25
create procedure spTwentyFive
as
begin
select Design_Name, sum(Emp_Salary) as Sum_Salary
from Employee_Details
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
group by Design_Name
end
go

--26
create procedure spTwentySix
as
begin
select Design_Name, Count(Emp_First_Name) as Num_Employees
from Employee_Details
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
group by Design_Name
end
go

--27
create procedure spTwentySeven
as
begin
select Design_Name, Emp_Salary
from Employee_Details
Join Designation on Employee_Details.Design_Id=Designation.Design_Id
Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
order by Emp_Salary  asc
end
go

--28
create procedure spTwentyEight
as
begin
select Datepart(Year,Emp_JoinDate) as Year, 
Datepart(Month, Emp_JoinDate) as Month,
count(*) as NumEmployee
from Employee_Details
group by Datepart(Year,Emp_JoinDate), Datepart(Month,Emp_JoinDate)
end
go

--29
create procedure spTwentyNine
as
begin
select Emp_First_Name, Emp_Last_Name, Emp_Salary
from Employee_Details
Left Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
where Emp_Salary is null
end
go

--30
create procedure spThirty
as
begin
select Emp_First_Name, sum(Emp_Salary)
from Employee_Details
Left Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
group by Emp_First_Name
end
go

--31
--34
create procedure spThirtyFour
as
begin
select Emp_First_Name, Emp_Salary
from Employee_Details
Left Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
group by Emp_First_Name, Emp_Salary
order by Emp_Salary desc
offset 2 rows
fetch next 1 rows only
end
go


--35
create function AvgSal() 
returns table
as
return(
select Emp_First_Name, avg(Emp_Salary) as Sal
from Employee_Details
Left Join Salary on Employee_Details.Emp_Id=Salary.Emp_Id
group by Emp_First_Name
) 