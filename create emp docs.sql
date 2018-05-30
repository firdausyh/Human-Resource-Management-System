create table Employee_Documents(
Emp_Doc_Id numeric(10) not null identity(1,1) primary key,
Emp_Id numeric(10) not null foreign key references Employee_Details(Emp_Id),
Emp_Doc_Name nvarchar(30) not null,
Emp_Doc_Desc nvarchar(105), --City_Name nvarchar(50), --unique not null
);