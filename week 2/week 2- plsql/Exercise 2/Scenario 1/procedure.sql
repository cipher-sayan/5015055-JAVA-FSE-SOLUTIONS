CREATE OR REPLACE PROCEDURE SafeTransferFunds(
    p_from_account_id IN NUMBER,
    p_to_account_id IN NUMBER,
    p_amount IN NUMBER
) IS
    -- Declare exceptions
    INSUFFICIENT_FUNDS EXCEPTION;
    ACCOUNT_NOT_FOUND EXCEPTION;
    e_code NUMBER;
    e_msg VARCHAR2(4000);

BEGIN
    -- Start a transaction
    SAVEPOINT start_transfer;

    -- Check if the 'from' account has sufficient funds
    DECLARE
        v_balance NUMBER;
    BEGIN
        SELECT balance INTO v_balance FROM accounts WHERE account_id = p_from_account_id FOR UPDATE;
        IF v_balance < p_amount THEN
            RAISE INSUFFICIENT_FUNDS;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE ACCOUNT_NOT_FOUND;
    END;

    -- Deduct amount from 'from' account
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account_id;

    -- Add amount to 'to' account
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account_id;

    -- Commit the transaction if all is well
    COMMIT;

    -- Exception handling
EXCEPTION
    WHEN INSUFFICIENT_FUNDS THEN
        ROLLBACK TO start_transfer;
        e_code := -20001;
        e_msg := 'Error: Insufficient funds in the source account.';
        INSERT INTO error_log (error_code, error_message, error_date)
        VALUES (e_code, e_msg, SYSDATE);
        RAISE_APPLICATION_ERROR(e_code, e_msg);
    WHEN ACCOUNT_NOT_FOUND THEN
        ROLLBACK TO start_transfer;
        e_code := -20002;
        e_msg := 'Error: One or both account IDs not found.';
        INSERT INTO error_log (error_code, error_message, error_date)
        VALUES (e_code, e_msg, SYSDATE);
        RAISE_APPLICATION_ERROR(e_code, e_msg);
    WHEN OTHERS THEN
        ROLLBACK TO start_transfer;
        e_code := SQLCODE;
        e_msg := 'Unexpected error: ' || SQLERRM;
        INSERT INTO error_log (error_code, error_message, error_date)
        VALUES (e_code, e_msg, SYSDATE);
        RAISE_APPLICATION_ERROR(e_code, e_msg);
END SafeTransferFunds;
/
