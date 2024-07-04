USE PublicLibrary ;

-- Insert sample data into Authors table
INSERT INTO Authors (Name, Biography) VALUES
                                          ('J.K. Rowling', 'Author of the Harry Potter series.'),
                                          ('George R.R. Martin', 'Author of A Song of Ice and Fire series.'),
                                          ('J.R.R. Tolkien', 'Author of The Lord of the Rings.'),
                                          ('Agatha Christie', 'Famous mystery writer.');

-- Insert sample data into Books table
INSERT INTO Books (Title, ISBN, PublicationYear, Genre, NumberOfCopies) VALUES
                                                                            ('Harry Potter and the Sorcerer\'s Stone', '978-0439708180', 1997, 'Fantasy', 10),
                                                                            ('A Game of Thrones', '978-0553573404', 1996, 'Fantasy', 5),
                                                                            ('The Fellowship of the Ring', '978-0547928210', 1954, 'Fantasy', 7),
                                                                            ('Murder on the Orient Express', '978-0062073501', 1934, 'Mystery', 3);

-- Insert sample data into Members table
INSERT INTO Members (Name, Address, Phone, Email, MembershipDate) VALUES
                                                                      ('Alice Smith', '123 Main St, Anytown, USA', '555-1234', 'alice@example.com', '2023-01-15'),
                                                                      ('Bob Johnson', '456 Oak St, Othertown, USA', '555-5678', 'bob@example.com', '2023-02-20'),
                                                                      ('Carol Williams', '789 Pine St, Sometown, USA', '555-9012', 'carol@example.com', '2023-03-05');

-- Insert sample data into Staff table
INSERT INTO Staff (Name, Position, ContactNumber, Email) VALUES
                                                             ('David Brown', 'Librarian', '555-3456', 'david@example.com'),
                                                             ('Eva Green', 'Assistant Librarian', '555-7890', 'eva@example.com');

-- Insert sample data into Books_Authors table
INSERT INTO Books_Authors (BookID, AuthorID) VALUES
                                                 (1, 1),  -- Harry Potter and the Sorcerer's Stone by J.K. Rowling
                                                 (2, 2),  -- A Game of Thrones by George R.R. Martin
                                                 (3, 3),  -- The Fellowship of the Ring by J.R.R. Tolkien
                                                 (4, 4);  -- Murder on the Orient Express by Agatha Christie

-- Insert sample data into Loans table
INSERT INTO Loans (MemberID, BookID, LoanDate, ReturnDate) VALUES
                                                               (1, 1, '2024-06-01', '2024-06-15'),  -- Alice Smith borrows Harry Potter and the Sorcerer's Stone
                                                               (2, 2, '2024-06-05', '2024-06-20'),  -- Bob Johnson borrows A Game of Thrones
                                                               (3, 3, '2024-06-10', NULL);          -- Carol Williams borrows The Fellowship of the Ring, not yet returned

-- Optionally, if Staff are involved in managing loans
-- Add a StaffID column to Loans and insert the data again including StaffID
-- ALTER TABLE Loans ADD COLUMN StaffID INT;
-- UPDATE Loans SET StaffID = 1 WHERE LoanID = 1;  -- David Brown manages the loan to Alice Smith
-- UPDATE Loans SET StaffID = 2 WHERE LoanID = 2;  -- Eva Green manages the loan to Bob Johnson
-- UPDATE Loans SET StaffID = 1 WHERE LoanID = 3;  -- David Brown manages the loan to Carol Williams

use PublicLibrary;
INSERT INTO Authors (AuthorID, Name, Biography) VALUES
                                                    (6, 'J.K. Rowling', 'Author of the Harry Potter series.'),
                                                    (7, 'George R.R. Martin', 'Author of A Song of Ice and Fire series.'),
                                                    (8, 'J.R.R. Tolkien', 'Author of The Lord of the Rings.'),
                                                    (9, 'Agatha Christie', 'Famous mystery writer.'),
                                                    (10, 'Stephen King', 'Author of horror novels.');

use PublicLibrary;
INSERT INTO Books (BookID, Title, ISBN, PublicationYear, Genre, NumberOfCopies) VALUES
                                                                                    (9, 'Harry Potter and the Sorcerer\'s Stone', '978-0439708180', 1997, 'Fantasy', 10),
                                                                                    (10, 'Harry Potter and the Chamber of Secrets', '978-0439064873', 1998, 'Fantasy', 8),
                                                                                    (11, 'A Game of Thrones', '978-0553573404', 1996, 'Fantasy', 5),
                                                                                    (12, 'A Clash of Kings', '978-0553579901', 1999, 'Fantasy', 5),
                                                                                    (13, 'The Fellowship of the Ring', '978-0547928210', 1954, 'Fantasy', 7),
                                                                                    (14, 'The Two Towers', '978-0547928203', 1954, 'Fantasy', 6),
                                                                                    (15, 'Murder on the Orient Express', '978-0062073501', 1934, 'Mystery', 3),
                                                                                    (16, 'The Shining', '978-0307743657', 1977, 'Horror', 4);

use PublicLibrary;
INSERT INTO Books_Authors (BookID, AuthorID) VALUES
                                                 (9, 6),  -- Harry Potter and the Sorcerer's Stone by J.K. Rowling
                                                 (10, 6), -- Harry Potter and the Chamber of Secrets by J.K. Rowling
                                                 (11, 7), -- A Game of Thrones by George R.R. Martin
                                                 (12, 7), -- A Clash of Kings by George R.R. Martin
                                                 (13, 8), -- The Fellowship of the Ring by J.R.R. Tolkien
                                                 (14, 8), -- The Two Towers by J.R.R. Tolkien
                                                 (15, 9), -- Murder on the Orient Express by Agatha Christie
                                                 (16, 10); -- The Shining by Stephen King

use PublicLibrary;
-- Insert new data into Loans table
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES
                                                                       (1, 1, 1, '2023-06-01', NULL),  -- Alice Smith borrowed 'Harry Potter and the Sorcerer's Stone' and hasn't returned it yet
                                                                       (2, 2, 1, '2023-05-01', '2023-05-15'),  -- Alice Smith borrowed 'Harry Potter and the Chamber of Secrets' and returned it
                                                                       (3, 3, 2, '2023-06-01', NULL);  -- Bob Johnson borrowed 'A Game of Thrones' and hasn't returned it yet