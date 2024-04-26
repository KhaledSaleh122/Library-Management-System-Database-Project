Select Top(1) 
Genre,
count(Genre) as Genre_frequency
from loans join books
on loans.BookID = books.BookID
where month(Date_Borrowed) = 3
group by Genre
order by Genre_frequency desc
/*Another sol*/

with Populare_Genre as(
	Select 
	Genre,
	count(*) as Genre_frequency,
	DENSE_RANK() over (order by count(*) desc) as Genre_Rank
	from loans join books
	on loans.BookID = books.BookID
	where month(Date_Borrowed) = 3
	group by Genre
)
Select * from Populare_Genre where Genre_Rank = 1;