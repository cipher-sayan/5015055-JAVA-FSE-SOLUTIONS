-- Open a new account
BEGIN
    AccountOperations.OpenAccount(1001, 1, 500);
END;
/

-- Close an account
BEGIN
    AccountOperations.CloseAccount(1001);
END;
/

-- Get total balance for a customer
DECLARE
    v_total_balance NUMBER;
BEGIN
    v_total_balance := AccountOperations.GetTotalBalance(1);
    DBMS_OUTPUT.PUT_LINE('Total Balance: ' || v_total_balance);
END;
/
