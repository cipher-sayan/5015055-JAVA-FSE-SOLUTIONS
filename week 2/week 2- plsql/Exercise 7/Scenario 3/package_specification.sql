CREATE OR REPLACE PACKAGE AccountOperations AS
    -- Procedure to open a new account
    PROCEDURE OpenAccount(p_account_id IN NUMBER, 
                          p_customer_id IN NUMBER, 
                          p_initial_balance IN NUMBER);

    -- Procedure to close an account
    PROCEDURE CloseAccount(p_account_id IN NUMBER);

    -- Function to get the total balance of a customer across all accounts
    FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END AccountOperations;
/
