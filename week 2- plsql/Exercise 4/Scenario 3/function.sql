CREATE OR REPLACE FUNCTION HasSufficientBalance(
    p_account_id IN NUMBER,
    p_amount IN NUMBER
) RETURN BOOLEAN IS
    v_balance NUMBER;
BEGIN
    -- Query the balance for the given account ID
    SELECT balance INTO v_balance
    FROM accounts
    WHERE account_id = p_account_id;
    
    -- Check if the balance is sufficient
    IF v_balance >= p_amount THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Handle case where account ID does not exist
        RETURN FALSE;
    WHEN OTHERS THEN
        -- Handle unexpected errors
        RAISE_APPLICATION_ERROR(-20001, 'Unexpected error: ' || SQLERRM);
END HasSufficientBalance;
/
