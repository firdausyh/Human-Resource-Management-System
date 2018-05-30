create table Designation(
Design_Id numeric(10) not null identity(1,1) primary key,
Design_Name nvarchar(50) not null unique,
Design_Descriotion nvarchar(300) not null, --unique not null
);