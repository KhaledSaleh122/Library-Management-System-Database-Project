WITH BorrowerAges AS (
    SELECT
        BorrowerID,
        DATEDIFF(year, Date_Birth, GETDATE()) AS Age
    FROM
        Borrowers
),
AgeGroups AS (
    SELECT
        CASE
            WHEN Age BETWEEN 0 AND 10 THEN '0-10'
            WHEN Age BETWEEN 11 AND 20 THEN '11-20'
            WHEN Age BETWEEN 21 AND 30 THEN '21-30'
            WHEN Age BETWEEN 31 AND 40 THEN '31-40'
            WHEN Age BETWEEN 41 AND 50 THEN '41-50'
            WHEN Age BETWEEN 51 AND 60 THEN '51-60'
            WHEN Age > 60 THEN '60+'
            ELSE 'Unknown'
        END AS AgeGroup,
        b.BorrowerID
    FROM
        BorrowerAges b
),
GenrePreferences AS (
    SELECT
        ag.AgeGroup,
        bk.Genre,
        COUNT(*) AS CountGenre,
		row_number() over (partition by ag.AgeGroup order by COUNT(*) desc) as GenreRank
    FROM
        AgeGroups ag
    JOIN
        Loans l ON ag.BorrowerID = l.BorrowerID
    JOIN
        Books bk ON l.BookID = bk.BookID
    GROUP BY
        ag.AgeGroup, bk.Genre
)
select * from GenrePreferences where GenreRank = 1;

