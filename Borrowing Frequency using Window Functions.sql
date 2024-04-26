Select 
BorrowerID,
count(*) as Borrowing_Frequency,
DENSE_RANK() over (Order by count(*) DESC) as Borrowing_Rank
from loans
group by BorrowerID;