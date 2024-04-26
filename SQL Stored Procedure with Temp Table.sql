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
go

drop procedure if exists sp_RetrieveOverdueBorrowers
go
create procedure sp_RetrieveOverdueBorrowers
as
begin
	IF OBJECT_ID('tempdb..#OverdueBorrowers') IS NOT NULL
        DROP TABLE #OverdueBorrowers;

    CREATE TABLE #OverdueBorrowers (
        BorrowerID INT,
    );
	insert into #OverdueBorrowers(BorrowerID)
	select BorrowerID from 
	loans
	where dbo.fn_CalculateOverdueDays(loanID) >= 1;
	select * from loans l join #OverdueBorrowers o
	on l.BorrowerID = o.BorrowerID;
	DROP TABLE #OverdueBorrowers;
end
go
exec sp_RetrieveOverdueBorrowers;