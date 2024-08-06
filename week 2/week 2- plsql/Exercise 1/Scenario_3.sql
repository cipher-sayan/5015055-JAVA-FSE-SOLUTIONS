DECLARE @customer_id INT, @due_date DATE;

DECLARE loan_cursor CURSOR FOR
SELECT customer_id, due_date
FROM loans
WHERE due_date BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE());

OPEN loan_cursor;

FETCH NEXT FROM loan_cursor INTO @customer_id, @due_date;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Reminder: Loan for customer ' + CAST(@customer_id AS NVARCHAR) + ' is due on ' + CAST(@due_date AS NVARCHAR) + '.';

    FETCH NEXT FROM loan_cursor INTO @customer_id, @due_date;
END

CLOSE loan_cursor;
DEALLOCATE loan_cursor;
