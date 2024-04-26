/*First method 601*/
Select distinct BookID from Loans;

Select distinct Loans.BookID,Title from Loans join Books 
on Loans.BookID = Books.BookID;

/*Second method 601*/
Select distinct BookID from Loans group by BookID;