CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_customer_id IN NUMBER,
    p_customer_name IN VARCHAR2,
    p_customer_address IN VARCHAR2,
    p_customer_phone IN VARCHAR2
) IS
    -- Declare exceptions
    CUSTOMER_ALREADY_EXISTS EXCEPTION;
    e_code NUMBER;
    e_msg VARCHAR2(4000);
BEGIN
    -- Attempt to insert the new customer
    BEGIN
        INSERT INTO customers (customer_id, customer_name, customer_address, customer_phone)
        VALUES (p_customer_id, p_customer_name, p_customer_address, p_customer_phone);

        -- Commit the transaction if the insertion is successful
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE CUSTOMER_ALREADY_EXISTS;
    END;

    -- Exception handling
EXCEPTION
    WHEN CUSTOMER_ALREADY_EXISTS THEN
        ROLLBACK;
        e_code := -20001;
        e_msg := 'Error: Customer ID ' || p_customer_id || ' already exists.';
        INSERT INTO error_log (error_code, error_message, error_date)
        VALUES (e_code, e_msg, SYSDATE);
        RAISE_APPLICATION_ERROR(e_code, e_msg);
    WHEN OTHERS THEN
        ROLLBACK;
        e_code := SQLCODE;
        e_msg := 'Unexpected error: ' || SQLERRM;
        INSERT INTO error_log (error_code, error_message, error_date)
        VALUES (e_code, e_msg, SYSDATE);
        RAISE_APPLICATION_ERROR(e_code, e_msg);
END AddNewCustomer;
/
