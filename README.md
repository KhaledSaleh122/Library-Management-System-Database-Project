
# Library Management System Database Project

## Project Overview

This project develops a comprehensive relational database for a local library to transition from traditional book-keeping methods to a robust digital system. The database facilitates efficient tracking of books, borrowers, loans, returns, and offers insights into borrowing trends. Implemented using Microsoft SQL Server, the project includes the design of an Entity Relationship Model (ERM), the creation of the database schema, and the development of various SQL queries and procedures to manage and analyze library data.

## Database Schema

### Tables

#### `Books`
- `BookID` (PK): Unique identifier for each book.
- `Title`: Title of the book.
- `Author`: Name of the author.
- `ISBN`: Standard book number.
- `PublishedDate`: Date the book was published.
- `Genre`: Literary genre of the book.
- `ShelfLocation`: Location of the book in the library.
- `CurrentStatus`: Indicates whether the book is 'Available' or 'Borrowed'.

#### `Borrowers`
- `BorrowerID` (PK): Unique identifier for each borrower.
- `FirstName`: Borrower's first name.
- `LastName`: Borrower's last name.
- `Email`: Borrower's email address.
- `DateOfBirth`: Borrower's date of birth.
- `MembershipDate`: Date the borrower joined the library.

#### `Loans`
- `LoanID` (PK): Unique identifier for each loan transaction.
- `BookID` (FK): References the borrowed book.
- `BorrowerID` (FK): References the borrower.
- `DateBorrowed`: Date the book was borrowed.
- `DueDate`: Date the book is due to be returned.
- `DateReturned`: Date the book was returned (NULL if not yet returned).

### Relationships
- Books to Loans: One-to-Many (A book can have many loan records)
- Borrowers to Loans: One-to-Many (A borrower can have multiple loan records)

## SQL Implementations

### Queries and Procedures

1. **List of Borrowed Books**: Retrieves all books borrowed by a specific borrower, including unreturned books.
2. **Active Borrowers with CTEs**: Identifies borrowers who have borrowed 2 or more books but haven't returned any.
3. **Borrowing Frequency using Window Functions**: Ranks borrowers based on how frequently they borrow books.
4. **Popular Genre Analysis**: Determines the most popular genre in a specific month using joins and window functions.
5. **Stored Procedure - `sp_AddNewBorrower`**: Adds a new borrower to the system after validating the email uniqueness.
6. **Database Function - `fn_CalculateOverdueFees`**: Calculates overdue fees for loans based on the number of days past due.
7. **Database Function - `fn_BookBorrowingFrequency`**: Returns the count of times a book has been borrowed.
8. **Overdue Analysis**: Lists all books that are overdue by more than 30 days along with their borrowers.
9. **Author Popularity**: Ranks authors by the borrowing frequency of their books.
10. **Genre Preference by Age**: Analyzes preferred genres among different age groups.
11. **Stored Procedure - `sp_BorrowedBooksReport`**: Generates a report of books borrowed within a specified date range.
12. **Trigger Implementation**: Logs changes in book status in an `AuditLog` table.
13. **SQL Stored Procedure with Temp Table**: retrieves all borrowers who have overdue books. Store these borrowers in a temporary table, then join this temp table with the Loans table to list out the specific overdue books for each borrower.

## Additional Details

This project includes detailed ERD diagrams and SQL scripts for creating the database structure, seeding it with data, and implementing the above functionalities. The ERD and schema designs are made with tools like ERDPlus and Lucidchart to visually represent the relationships and constraints within the database.
