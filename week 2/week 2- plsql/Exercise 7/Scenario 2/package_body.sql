CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    -- Procedure to hire a new employee
    PROCEDURE HireEmployee(p_employee_id IN NUMBER, 
                           p_name IN VARCHAR2, 
                           p_salary IN NUMBER,
                           p_hire_date IN DATE) IS
    BEGIN
        -- Insert a new employee record
        INSERT INTO Employees (EmployeeID, Name, Salary, HireDate)
        VALUES (p_employee_id, p_name, p_salary, p_hire_date);
        
        DBMS_OUTPUT.PUT_LINE('Employee hired successfully: ' || p_name);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Error: Employee with ID ' || p_employee_id || ' already exists.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END HireEmployee;

    -- Procedure to update employee details
    PROCEDURE UpdateEmployee(p_employee_id IN NUMBER, 
                             p_name IN VARCHAR2, 
                             p_salary IN NUMBER) IS
    BEGIN
        -- Update the employee record
        UPDATE Employees
        SET Name = p_name, Salary = p_salary
        WHERE EmployeeID = p_employee_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: No employee found with ID ' || p_employee_id);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Employee updated successfully: ' || p_name);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END UpdateEmployee;

    -- Function to calculate annual salary
    FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER IS
        v_annual_salary NUMBER;
    BEGIN
        -- Calculate the annual salary
        SELECT Salary * 12 INTO v_annual_salary
        FROM Employees
        WHERE EmployeeID = p_employee_id;
        
        RETURN v_annual_salary;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No employee found with ID ' || p_employee_id);
            RETURN NULL;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RETURN NULL;
    END CalculateAnnualSalary;

END EmployeeManagement;
/
