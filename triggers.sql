#1. Automatically Update Number of Copies
on Loan Creation (Decrease Number of Copies)
DELIMITER $$

CREATE TRIGGER DecreaseCopiesAfterLoan
    AFTER INSERT ON Loans
    FOR EACH ROW
BEGIN
    UPDATE Books
    SET NumberOfCopies = NumberOfCopies - 1
    WHERE BookID = NEW.BookID;
END $$

DELIMITER ;

#2.Log changes to Loans table
DELIMITER $$

CREATE TRIGGER LogLoanInsert
    AFTER INSERT ON Loans
    FOR EACH ROW
BEGIN
    INSERT INTO LoanLog (LogID, BookID, MemberID, LoanDate, Action)
    VALUES (NULL, NEW.BookID, NEW.MemberID, NEW.LoanDate, 'LOANED');
END $$

DELIMITER ;

#3. Log deletions from loan table
DELIMITER $$

CREATE TRIGGER LogLoanDelete
    AFTER DELETE ON Loans
    FOR EACH ROW
BEGIN
    INSERT INTO LoanLog (LogID, BookID, MemberID, LoanDate, Action)
    VALUES (NULL, OLD.BookID, OLD.MemberID, OLD.LoanDate, 'RETURNED');
END $$

DELIMITER ;

