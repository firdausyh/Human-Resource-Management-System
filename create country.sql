create table Country(
Country_Id numeric(10) not null identity(1,1) primary key,
Country_Name nvarchar(50) not null unique
);