CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    -- Set the LastModified column to the current date and time
    :NEW.LastModified := SYSDATE;
END;
/
