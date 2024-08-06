DECLARE
    -- Cursor to retrieve all accounts
    CURSOR cur_accounts IS
        SELECT AccountID, Balance
        FROM Accounts;
    
    -- Variables to hold the cursor data
    v_account_id Accounts.AccountID%TYPE;
    v_balance Accounts.Balance%TYPE;
    
    -- Annual maintenance fee
    annual_fee CONSTANT NUMBER := 50; -- Example fee amount
    
BEGIN
    -- Open the cursor
    OPEN cur_accounts;
    
    -- Fetch the first row from the cursor
    LOOP
        FETCH cur_accounts INTO v_account_id, v_balance;
        
        EXIT WHEN cur_accounts%NOTFOUND;
        
        -- Deduct the annual fee from the account balance
        UPDATE Accounts
        SET Balance = v_balance - annual_fee
        WHERE AccountID = v_account_id;
        
        -- Optional: Print the updated account details (for debugging purposes)
        DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_account_id || 
                             ' New Balance: ' || TO_CHAR(v_balance - annual_fee, '9999.99'));
    END LOOP;
    
    -- Close the cursor
    CLOSE cur_accounts;
    
    -- Commit the transaction
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Annual fee applied to all accounts successfully.');
    
EXCEPTION
    WHEN OTHERS THEN
        -- Handle unexpected errors
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; -- Rollback changes in case of an error
END;
/
