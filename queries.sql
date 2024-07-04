#1. User Information Retrieval
#a. Retrieve all books by a specific author
use PublicLibrary;
SELECT B.Title, B.ISBN, B.PublicationYear, B.Genre
FROM Books B
         JOIN Books_Authors BA ON B.BookID = BA.BookID
         JOIN Authors A ON BA.AuthorID = A.AuthorID
WHERE A.Name = 'J.K. Rowling';
#b. Retrieve all books currently on loan by a specific member
USE PublicLibrary;
SELECT B.Title, L.LoanDate, L.ReturnDate
FROM Loans L
         JOIN Books B ON L.BookID = B.BookID
         JOIN Members M ON L.MemberID = M.MemberID
WHERE M.Name = 'Member One' AND L.ReturnDate IS NULL;

#2. Account management
#a. Add a new member
use PublicLibrary;
INSERT INTO Members (Name, Address, Phone, Email, MembershipDate)
VALUES ('Pavan kalyan', '321 Elm St, Berlin, UGermantSA', '555-9876', 'pavan@example.com', CURDATE());

#b. Update a member’s contact information
UPDATE Members
SET Address = '321 New Elm St, Anytown, USA', Phone = '555-4321', Email = 'john.new@example.com'
WHERE Name = 'Member Two';

#c. Delete a member (only if they have no active loans)
DELETE FROM Members
WHERE MemberID = 4
  AND NOT EXISTS (
    SELECT 1 FROM Loans WHERE MemberID = 4 AND ReturnDate IS NULL
);
#3. Activity History
#a. Retrieve loan history of a specific member

SELECT B.Title, L.LoanDate, L.ReturnDate
FROM Loans L
         JOIN Books B ON L.BookID = B.BookID
         JOIN Members M ON L.MemberID = M.MemberID
WHERE M.Name = 'Alice Smith';
#b. Retrieve all overdue books

SELECT M.Name AS MemberName, B.Title AS BookTitle, L.LoanDate, L.ReturnDate
FROM Loans L
         JOIN Books B ON L.BookID = B.BookID
         JOIN Members M ON L.MemberID = M.MemberID
WHERE L.ReturnDate IS NULL AND L.LoanDate < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

#4. Advanced Queries
#a. Retrieve the most popular books (by number of loans)

SELECT B.Title, COUNT(L.LoanID) AS NumberOfLoans
FROM Loans L
         JOIN Books B ON L.BookID = B.BookID
GROUP BY B.BookID
ORDER BY NumberOfLoans DESC
LIMIT 5;

#b. Find authors who have written more than one book in the library

SELECT A.Name, COUNT(BA.BookID) AS NumberOfBooks
FROM Authors A
         JOIN Books_Authors BA ON A.AuthorID = BA.AuthorID
GROUP BY A.AuthorID
HAVING NumberOfBooks > 1;

#5 sub queries
# a. Retrieve members who have borrowed all books of a specific genre

SELECT M.Name, M.Email
FROM Members M
WHERE NOT EXISTS (
    SELECT B.BookID
    FROM Books B
    WHERE B.Genre = 'Fantasy'
      AND B.BookID NOT IN (
        SELECT L.BookID
        FROM Loans L
        WHERE L.MemberID = M.MemberID
    )
);
#b. Retrieve the latest loan information for each book
SELECT B.Title, L.LoanDate, L.ReturnDate
FROM Books B
         JOIN Loans L ON B.BookID = L.BookID
WHERE L.LoanDate = (
    SELECT MAX(LoanDate)
    FROM Loans
    WHERE BookID = B.BookID
);
