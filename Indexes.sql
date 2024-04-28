CREATE INDEX idx_date_returned ON loans (Date_Returned);

CREATE INDEX idx_date_borrowed ON loans (Date_Borrowed);

CREATE INDEX idx_current_status ON Books (Current_Status);

CREATE INDEX idx_genre ON Books (Genre);

CREATE INDEX idx_date_birth ON Borrowers (Date_Birth);

CREATE INDEX idx_bookID ON Loans (BookID);

CREATE INDEX idx_BorrowerID ON Loans (BorrowerID);