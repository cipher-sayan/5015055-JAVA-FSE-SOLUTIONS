CREATE OR REPLACE FUNCTION CalculateAge(
    p_date_of_birth IN DATE
) RETURN NUMBER IS
    v_current_date DATE := SYSDATE;
    v_age NUMBER;
BEGIN
    -- Calculate age in years
    v_age := FLOOR(MONTHS_BETWEEN(v_current_date, p_date_of_birth) / 12);
    
    RETURN v_age;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle unexpected errors
        RAISE_APPLICATION_ERROR(-20001, 'Unexpected error: ' || SQLERRM);
END CalculateAge;
/
