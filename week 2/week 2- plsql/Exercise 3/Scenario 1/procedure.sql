CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
    -- Declare variables
    e_code NUMBER;
    e_msg VARCHAR2(4000);
BEGIN
    -- Update the balances of all savings accounts by applying 1% interest
    BEGIN
        UPDATE savings_accounts
        SET balance = balance * 1.01;

        -- Commit the transaction
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            e_code := SQLCODE;
            e_msg := 'Unexpected error: ' || SQLERRM;
            INSERT INTO error_log (error_code, error_message, error_date)
            VALUES (e_code, e_msg, SYSDATE);
            RAISE_APPLICATION_ERROR(e_code, e_msg);
    END;
END ProcessMonthlyInterest;
/
