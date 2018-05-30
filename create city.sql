create table City(
City_Id numeric(10) not null identity(1,1) primary key,
State_Id numeric(10) not null foreign key references State(State_Id),
City_Name nvarchar(50) not null
);