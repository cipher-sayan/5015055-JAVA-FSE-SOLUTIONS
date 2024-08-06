CREATE OR REPLACE PACKAGE EmployeeManagement AS
    -- Procedure to hire a new employee
    PROCEDURE HireEmployee(p_employee_id IN NUMBER, 
                           p_name IN VARCHAR2, 
                           p_salary IN NUMBER,
                           p_hire_date IN DATE);

    -- Procedure to update employee details
    PROCEDURE UpdateEmployee(p_employee_id IN NUMBER, 
                             p_name IN VARCHAR2, 
                             p_salary IN NUMBER);

    -- Function to calculate annual salary
    FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER;
END EmployeeManagement;
/
