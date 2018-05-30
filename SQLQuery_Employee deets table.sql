create table Employee_Details(
Emp_Id numeric(10) not null identity(1,1) primary key,
Emp_First_Name nvarchar(50) not null,
Emp_Middle_Name nvarchar(50),
Emp_Last_Name nvarchar(50) not null ,
Emp_Address1 nvarchar(100) not null,
Emp_Address2 nvarchar(100),
Emp_Country_Id numeric(10) not null foreign key references Country(Country_Id),
Emp_State_Id numeric(10) not null foreign key references State(State_Id),
Emp_City_Id numeric(10) not null foreign key references City(City_Id),
Emp_Zip numeric(5) not null,
Emp_Mobile numeric(10) not null,
Emp_Gender bit not null check (Emp_Gender IN (0, 1)), --male=1 Female=0,
Design_Id numeric(10) not null,
Emp_DOB datetime not null,
Emp_JoinDate datetime not null,
Emp_Active bit not null check (Emp_Active IN (0, 1))
); -- Active=1 Inactive =0;