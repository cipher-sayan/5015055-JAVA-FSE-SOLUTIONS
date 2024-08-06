CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department_id IN NUMBER,
    p_bonus_percentage IN NUMBER
) IS
    -- Declare exceptions
    DEPARTMENT_NOT_FOUND EXCEPTION;
    e_code NUMBER;
    e_msg VARCHAR2(4000);
BEGIN
    -- Attempt to update the employees' salaries
    BEGIN
        UPDATE employees
        SET salary = salary * (1 + p_bonus_percentage / 100)
        WHERE department_id = p_department_id;

        -- Check if the update affected any rows
        IF SQL%ROWCOUNT = 0 THEN
            RAISE DEPARTMENT_NOT_FOUND;
        END IF;

        -- Commit the transaction if the update is successful
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE DEPARTMENT_NOT_FOUND;
    END;

    -- Exception handling
EXCEPTION
    WHEN DEPARTMENT_NOT_FOUND THEN
        ROLLBACK;
        e_code := -20001;
        e_msg := 'Error: Department ID ' || p_department_id || ' not found.';
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
END UpdateEmployeeBonus;
/
