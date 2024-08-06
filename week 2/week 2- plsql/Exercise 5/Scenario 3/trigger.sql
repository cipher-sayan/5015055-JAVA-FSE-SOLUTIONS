CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_current_balance NUMBER;
BEGIN
    -- Check if the transaction is a withdrawal
    IF :NEW.TransactionType = 'WITHDRAWAL' THEN
        -- Get the current balance of the account
        SELECT balance INTO v_current_balance
        FROM accounts
        WHERE account_id = :NEW.AccountID;
        
        -- Check if withdrawal amount exceeds the current balance
        IF :NEW.Amount > v_current_balance THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error: Withdrawal amount exceeds available balance.');
        END IF;

    -- Check if the transaction is a deposit
    ELSIF :NEW.TransactionType = 'DEPOSIT' THEN
        -- Check if deposit amount is positive
        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error: Deposit amount must be positive.');
        END IF;

    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'Error: Invalid transaction type.');
    END IF;
    
END CheckTransactionRules;
/
