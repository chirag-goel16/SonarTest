-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Pages INT,
    PublishedYear INT
);

-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    BirthYear INT
);

-- Create Borrowers table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    Name VARCHAR(100),
    BookID INT,
    BorrowDate DATE
);

-- Insert data into Books
INSERT INTO Books VALUES (1, 'Book 1', 1, 200, 2000);
INSERT INTO Books VALUES (2, 'Book 2', 2, 150, 2005);
INSERT INTO Books VALUES (3, 'Book 3', 3, 300, 2010);
INSERT INTO Books VALUES (4, 'Book 4', 1, 250, 2015);
INSERT INTO Books VALUES (5, 'Book 5', 2, 350, 2020);

-- Insert data into Authors
INSERT INTO Authors VALUES (1, 'Author 1', 1970);
INSERT INTO Authors VALUES (2, 'Author 2', 1980);
INSERT INTO Authors VALUES (3, 'Author 3', 1990);

-- Insert data into Borrowers
INSERT INTO Borrowers VALUES (1, 'Borrower 1', 1, '2024-01-01');
INSERT INTO Borrowers VALUES (2, 'Borrower 2', 2, '2024-02-01');
INSERT INTO Borrowers VALUES (3, 'Borrower 3', 3, '2024-03-01');
INSERT INTO Borrowers VALUES (4, 'Borrower 4', 4, '2024-04-01');
INSERT INTO Borrowers VALUES (5, 'Borrower 5', 5, '2024-05-01');

-- Query to get all books
SELECT * FROM Books;

-- Query to get all authors
SELECT * FROM Authors;

-- Query to get all borrowers
SELECT * FROM Borrowers;

-- Query to get all books by a specific author
SELECT B.Title
FROM Books B
INNER JOIN Authors A ON B.AuthorID = A.AuthorID
WHERE A.Name = 'Author 1';

-- Query to get all books borrowed by a specific borrower
SELECT B.Title
FROM Books B
INNER JOIN Borrowers BR ON B.BookID = BR.BookID
WHERE BR.Name = 'Borrower 1';

-- Query to get the author of a specific book
SELECT A.Name
FROM Authors A
INNER JOIN Books B ON A.AuthorID = B.AuthorID
WHERE B.Title = 'Book 1';

-- Query to get the borrower of a specific book
SELECT BR.Name
FROM Borrowers BR
INNER JOIN Books B ON BR.BookID = B.BookID
WHERE B.Title = 'Book 1';

-- Query to get the number of books by each author
SELECT A.Name, COUNT(*) AS NumberOfBooks
FROM Authors A
INNER JOIN Books B ON A.AuthorID = B.AuthorID
GROUP BY A.Name;

-- Query to get the number of books borrowed by each borrower
SELECT BR.Name, COUNT(*) AS NumberOfBooksBorrowed
FROM Borrowers BR
INNER JOIN Books B ON BR.BookID = B.BookID
GROUP BY BR.Name;
