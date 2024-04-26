with AuthorsPopularity as(
	Select Author,
	count(*) as Borrowing_frequency_of_his_book,
	DENSE_RANK() over (order by count(*) desc) as AuthorRank
	from loans join books
	on loans.BookID = books.BookID
	group by Author
)
select * from AuthorsPopularity;
