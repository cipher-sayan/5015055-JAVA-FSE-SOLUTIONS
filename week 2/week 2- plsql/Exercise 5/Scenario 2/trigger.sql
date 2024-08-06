CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    -- Insert a record into the AuditLog table
    INSERT INTO AuditLog (
        TransactionID,
        TransactionDate,
        ActionType,
        OldValue,
        NewValue
    ) VALUES (
        :NEW.TransactionID,
        :NEW.TransactionDate,
        'INSERT',
        NULL, -- OldValue is NULL for inserts
        :NEW.TransactionDetails
    );
END;
/
