DECLARE
    -- Cursor to retrieve transactions for the current month
    CURSOR cur_transactions IS
        SELECT 
            t.AccountID,
            a.CustomerName,
            t.TransactionDate,
            t.TransactionType,
            t.Amount
        FROM Transactions t
        JOIN Accounts a ON t.AccountID = a.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE)
        ORDER BY t.AccountID, t.TransactionDate;
    
    -- Variables to hold the cursor data
    v_account_id Transactions.AccountID%TYPE;
    v_customer_name Accounts.CustomerName%TYPE;
    v_transaction_date Transactions.TransactionDate%TYPE;
    v_transaction_type Transactions.TransactionType%TYPE;
    v_amount Transactions.Amount%TYPE;
    
    -- Record type to hold cursor data
    TYPE rec_transaction IS RECORD (
        AccountID Transactions.AccountID%TYPE,
        CustomerName Accounts.CustomerName%TYPE,
        TransactionDate Transactions.TransactionDate%TYPE,
        TransactionType Transactions.TransactionType%TYPE,
        Amount Transactions.Amount%TYPE
    );
    
    -- Variable to hold a record fetched from the cursor
    v_transaction_record rec_transaction;
    
    -- Variable to track the current account being processed
    v_current_account_id Transactions.AccountID%TYPE := NULL;
    
BEGIN
    -- Open the cursor
    OPEN cur_transactions;
    
    -- Fetch the first row from the cursor
    LOOP
        FETCH cur_transactions INTO v_account_id, v_customer_name, v_transaction_date, v_transaction_type, v_amount;
        
        EXIT WHEN cur_transactions%NOTFOUND;
        
        -- Check if we have moved to a new account
        IF v_current_account_id IS DISTINCT FROM v_account_id THEN
            -- Print statement header for the new customer
            DBMS_OUTPUT.PUT_LINE('Statement for Account: ' || v_account_id);
            DBMS_OUTPUT.PUT_LINE('Customer: ' || v_customer_name);
            DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(SYSDATE, 'MM/DD/YYYY'));
            DBMS_OUTPUT.PUT_LINE('-----------------------------');
            v_current_account_id := v_account_id;
        END IF;
        
        -- Print transaction details
        DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_transaction_date, 'MM/DD/YYYY') || 
                             ' Type: ' || v_transaction_type || 
                             ' Amount: ' || TO_CHAR(v_amount, '9999.99'));
    END LOOP;
    
    -- Close the cursor
    CLOSE cur_transactions;
    
    DBMS_OUTPUT.PUT_LINE('End of Statements.');
    
EXCEPTION
    WHEN OTHERS THEN
        -- Handle unexpected errors
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
