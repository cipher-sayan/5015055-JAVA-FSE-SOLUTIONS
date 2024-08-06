CREATE OR REPLACE PACKAGE BODY AccountOperations AS

    -- Procedure to open a new account
    PROCEDURE OpenAccount(p_account_id IN NUMBER, 
                          p_customer_id IN NUMBER, 
                          p_initial_balance IN NUMBER) IS
    BEGIN
        -- Insert a new account record
        INSERT INTO Accounts (AccountID, CustomerID, Balance)
        VALUES (p_account_id, p_customer_id, p_initial_balance);
        
        DBMS_OUTPUT.PUT_LINE('Account opened successfully: ' || p_account_id);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Error: Account with ID ' || p_account_id || ' already exists.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END OpenAccount;

    -- Procedure to close an account
    PROCEDURE CloseAccount(p_account_id IN NUMBER) IS
    BEGIN
        -- Delete the account record
        DELETE FROM Accounts
        WHERE AccountID = p_account_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: No account found with ID ' || p_account_id);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Account closed successfully: ' || p_account_id);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END CloseAccount;

    -- Function to get the total balance of a customer across all accounts
    FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
        v_total_balance NUMBER;
    BEGIN
        -- Calculate the total balance
        SELECT SUM(Balance) INTO v_total_balance
        FROM Accounts
        WHERE CustomerID = p_customer_id;
        
        -- Handle case where no accounts are found
        IF v_total_balance IS NULL THEN
            v_total_balance := 0;
        END IF;
        
        RETURN v_total_balance;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RETURN NULL;
    END GetTotalBalance;

END AccountOperations;
/
