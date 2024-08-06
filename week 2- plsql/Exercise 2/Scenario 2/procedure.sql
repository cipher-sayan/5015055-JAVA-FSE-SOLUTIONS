CREATE OR REPLACE PROCEDURE UpdateSalary(
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
) IS
    -- Declare exceptions
    EMPLOYEE_NOT_FOUND EXCEPTION;
    e_code NUMBER;
    e_msg VARCHAR2(4000);

BEGIN
    -- Attempt to update the employee's salary
    BEGIN
        UPDATE employees
        SET salary = salary * (1 + p_percentage / 100)
        WHERE employee_id = p_employee_id;
        
        -- Check if the update affected any rows
        IF SQL%ROWCOUNT = 0 THEN
            RAISE EMPLOYEE_NOT_FOUND;
        END IF;

        -- Commit the transaction if the update was successful
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE EMPLOYEE_NOT_FOUND;
    END;

    -- Exception handling
EXCEPTION
    WHEN EMPLOYEE_NOT_FOUND THEN
        ROLLBACK;
        e_code := -20001;
        e_msg := 'Error: Employee ID ' || p_employee_id || ' not found.';
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
END UpdateSalary;
/
