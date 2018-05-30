create table Salary(
Salary_Id numeric(10) not null identity(1,1) primary key,
Emp_Id numeric(10) not null foreign key references Employee_Details(Emp_Id),
Emp_Salary_Change_Year datetime not null,
Emp_Salary decimal(10,2)not null, --City_Name nvarchar(50), --unique not null
);
