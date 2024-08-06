CREATE OR REPLACE PACKAGE CustomerManagement AS
    -- Procedure to add a new customer
    PROCEDURE AddCustomer(p_customer_id IN NUMBER, 
                          p_name IN VARCHAR2, 
                          p_balance IN NUMBER);

    -- Procedure to update customer details
    PROCEDURE UpdateCustomer(p_customer_id IN NUMBER, 
                             p_name IN VARCHAR2, 
                             p_balance IN NUMBER);

    -- Function to get customer balance
    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END CustomerManagement;
/
