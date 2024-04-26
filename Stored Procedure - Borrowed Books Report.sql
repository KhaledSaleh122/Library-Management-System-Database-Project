Drop procedure if exists sp_BorrowedBooksReport;
go
create procedure sp_BorrowedBooksReport(@StartDate date,@EndDate date) as
begin
	Select * from loans l 
	join Borrowers as b on l.BorrowerID = b.BorrowerID
	where Date_Borrowed Between @StartDate and  @EndDate
end

EXEC sp_BorrowedBooksReport @StartDate = '2047-09-16', @EndDate = '2048-09-16';