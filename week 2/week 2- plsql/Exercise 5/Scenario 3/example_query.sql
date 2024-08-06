-- Attempt to insert a withdrawal exceeding the balance
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, TransactionType, Amount)
VALUES (2001, 12345, SYSDATE, 'WITHDRAWAL', 1500);

-- Attempt to insert a deposit with a negative amount
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, TransactionType, Amount)
VALUES (2002, 12345, SYSDATE, 'DEPOSIT', -500);

-- Attempt to insert a valid deposit
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, TransactionType, Amount)
VALUES (2003, 12345, SYSDATE, 'DEPOSIT', 500);
