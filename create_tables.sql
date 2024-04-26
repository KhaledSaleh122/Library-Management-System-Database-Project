CREATE TABLE [Books] (
    [BookID] int IDENTITY(1,1) PRIMARY KEY,
    [Title] varchar(50),
    [Author] varchar(50),
    [ISBN] varchar(13),
    [Published_Date] date,
    [Genre] varchar(50),
    [Shelf_Location] varchar(50),
    [Current_Status] varchar(50) CHECK ([Current_Status] IN ('Available', 'Borrowed'))
);

CREATE TABLE [Borrowers] (
    [BorrowerID] int IDENTITY(1,1) PRIMARY KEY ,
    [First_Name] varchar(50),
    [Last_Name] varchar(50),
    [Email] varchar(50),
    [Date_Birth] date,
    [Membership_Date] date,
);

CREATE TABLE [Loans] (
    [LoanID] int IDENTITY(1,1) PRIMARY KEY,
    [BookID] int FOREIGN KEY ([BookID]) REFERENCES [Books]([BookID]),
    [BorrowerID] int  FOREIGN KEY ([BorrowerID]) REFERENCES [Borrowers]([BorrowerID]),
    [Date_Borrowed] Date,
    [Due_Date] Date,
    [Date_Returned] Date,
);