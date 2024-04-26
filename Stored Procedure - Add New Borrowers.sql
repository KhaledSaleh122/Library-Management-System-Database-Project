Drop procedure if exists sp_AddNewBorrower;
go
create procedure sp_AddNewBorrower
(@FirstName varchar(50),@LastName varchar(50),@Email varchar(50),@DateOfBirth date,@MembershipDate date)
as begin
	if not exists(Select Email from Borrowers where Email = @Email)
		begin
			insert into Borrowers (First_Name, Last_Name, Email, Date_Birth, Membership_Date)
			values (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
			SELECT SCOPE_IDENTITY() AS NewBorrowerID;
		end
	else
		Select 'Email Already Exists!' as ErrorMessage
end;

EXEC sp_AddNewBorrower 
    @FirstName = N'John', 
    @LastName = N'Doe', 
    @Email = N'john.doe@example.com', 
    @DateOfBirth = '1980-01-01', 
    @MembershipDate = '2024-01-01';