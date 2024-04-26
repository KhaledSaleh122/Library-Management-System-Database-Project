drop function if exists fn_BookBorrowingFrequency;
go
create function fn_BookBorrowingFrequency (@BookID int)
returns int as
begin
	return (select count(*) from loans where BookID = @BookID )
end


select dbo.fn_BookBorrowingFrequency(50) as Borrowing_Frequency