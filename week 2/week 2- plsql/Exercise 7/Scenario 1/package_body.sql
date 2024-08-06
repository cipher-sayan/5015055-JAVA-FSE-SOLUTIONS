CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    -- Procedure to add a new customer
    PROCEDURE AddCustomer(p_customer_id IN NUMBER, 
                          p_name IN VARCHAR2, 
                          p_balance IN NUMBER) IS
    BEGIN
        -- Insert a new customer record
        INSERT INTO Customers (CustomerID, Name, Balance)
        VALUES (p_customer_id, p_name, p_balance);
        
        DBMS_OUTPUT.PUT_LINE('Customer added successfully: ' || p_name);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Error: Customer with ID ' || p_customer_id || ' already exists.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END AddCustomer;

    -- Procedure to update customer details
    PROCEDURE UpdateCustomer(p_customer_id IN NUMBER, 
                             p_name IN VARCHAR2, 
                             p_balance IN NUMBER) IS
    BEGIN
        -- Update the customer record
        UPDATE Customers
        SET Name = p_name, Balance = p_balance
        WHERE CustomerID = p_customer_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: No customer found with ID ' || p_customer_id);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Customer updated successfully: ' || p_name);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END UpdateCustomer;

    -- Function to get customer balance
    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        -- Retrieve the customer balance
        SELECT Balance INTO v_balance
        FROM Customers
        WHERE CustomerID = p_customer_id;
        
        RETURN v_balance;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No customer found with ID ' || p_customer_id);
            RETURN NULL;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RETURN NULL;
    END GetCustomerBalance;

END CustomerManagement;
/
