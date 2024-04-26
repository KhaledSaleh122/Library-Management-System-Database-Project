drop function if exists fn_CalculateOverdueDays;
go
create function fn_CalculateOverdueDays (@LoanID int)
returns int as
begin
	declare @OverDueDays int;
	declare @DueDate date;
	declare @ReturnDate date;
	set @OverDueDays = 0;
	SELECT @DueDate = Due_Date, @ReturnDate = Date_Returned
    FROM Loans
    WHERE LoanID = @LoanID;
	if @ReturnDate is null
		begin
				set @OverDueDays = DATEDIFF(day,@DueDate, GETDATE())
		end
	else
		begin
				set @OverDueDays = DATEDIFF(day,@DueDate, @ReturnDate)
		end
	return @OverDueDays;
end
select * 
from loans join Borrowers
on loans.BorrowerID = Borrowers.BorrowerID
join Books
on loans.BookID = Books.BookID
where dbo.fn_CalculateOverdueDays(LoanID) > 30;