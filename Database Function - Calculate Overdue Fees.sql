drop function if exists fn_CalculateOverdueFees;
go
create function fn_CalculateOverdueFees (@LoanID int)
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

	if @OverDueDays <= 30
		begin
			return @OverDueDays * 1;
		end
	else
		begin
			return ((@OverDueDays - 30) * 2) + (30 * 1);
		end
	return 0;
end

select dbo.fn_CalculateOverdueFees(2) as OverdueFees;