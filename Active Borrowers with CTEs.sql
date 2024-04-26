with BorrowerActivity as(
	Select 
	BorrowerID, 
	count(*) as BooksBorrowed, 
	COUNT(Date_Returned) as BooksReturned 
	from loans
	group by BorrowerID
)
Select * from BorrowerActivity
WHERE BooksBorrowed >= 2 and BooksReturned = 0;
/*Another way*/
with BorrowerActivity as(
	Select 
	BorrowerID, 
	count(*) as BooksBorrowed, 
	COUNT(Date_Returned) as BooksReturned 
	from loans
	group by BorrowerID
	having count(*) >= 2 and COUNT(Date_Returned) = 0
)
Select * from BorrowerActivity;
