CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Current_Status)
    BEGIN
        INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
        SELECT 
            i.BookID,
            'Changed from ' + d.Current_Status + ' to ' + i.Current_Status,
            GETDATE()
        FROM 
            inserted i
        INNER JOIN 
            deleted d ON i.BookID = d.BookID
        WHERE
            (d.Current_Status = 'Available' AND i.Current_Status = 'Borrowed')
            OR (d.Current_Status = 'Borrowed' AND i.Current_Status = 'Available');
    END
END;
GO
