-- Add a new customer
BEGIN
    CustomerManagement.AddCustomer(1, 'John Doe', 1000);
END;
/

-- Update an existing customer
BEGIN
    CustomerManagement.UpdateCustomer(1, 'John Doe', 1200);
END;
/

-- Get customer balance
DECLARE
    v_balance NUMBER;
BEGIN
    v_balance := CustomerManagement.GetCustomerBalance(1);
    DBMS_OUTPUT.PUT_LINE('Customer balance: ' || v_balance);
END;
/
