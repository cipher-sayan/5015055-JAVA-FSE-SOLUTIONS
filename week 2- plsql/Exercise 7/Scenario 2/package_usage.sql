-- Hire a new employee
BEGIN
    EmployeeManagement.HireEmployee(101, 'Alice Smith', 5000, SYSDATE);
END;
/

-- Update an existing employee
BEGIN
    EmployeeManagement.UpdateEmployee(101, 'Alice Smith', 5500);
END;
/

-- Calculate annual salary for an employee
DECLARE
    v_annual_salary NUMBER;
BEGIN
    v_annual_salary := EmployeeManagement.CalculateAnnualSalary(101);
    DBMS_OUTPUT.PUT_LINE('Annual Salary: ' || v_annual_salary);
END;
/
