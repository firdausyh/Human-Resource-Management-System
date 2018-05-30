BULK INSERT dbo.Employee_Details
FROM 'C:\Users\Firdausy\Desktop\Training\BI\Emp_deets.txt' 
WITH ( FIELDTERMINATOR ='\t', ROWTERMINATOR = '\n', FIRSTROW = 2 )
GO

