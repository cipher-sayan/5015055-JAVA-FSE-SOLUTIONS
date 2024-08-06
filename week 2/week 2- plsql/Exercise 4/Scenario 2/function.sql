CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_loan_amount IN NUMBER,
    p_annual_interest_rate IN NUMBER,
    p_loan_duration_years IN NUMBER
) RETURN NUMBER IS
    v_monthly_interest_rate NUMBER;
    v_total_payments NUMBER;
    v_monthly_installment NUMBER;
BEGIN
    -- Calculate the monthly interest rate
    v_monthly_interest_rate := p_annual_interest_rate / 100 / 12;
    
    -- Calculate the total number of payments
    v_total_payments := p_loan_duration_years * 12;
    
    -- Calculate the monthly installment using the formula
    IF v_monthly_interest_rate > 0 THEN
        v_monthly_installment := 
            (p_loan_amount * v_monthly_interest_rate * POWER(1 + v_monthly_interest_rate, v_total_payments)) /
            (POWER(1 + v_monthly_interest_rate, v_total_payments) - 1);
    ELSE
        -- If interest rate is 0, the installment is simply the principal divided by the number of payments
        v_monthly_installment := p_loan_amount / v_total_payments;
    END IF;
    
    RETURN v_monthly_installment;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle unexpected errors
        RAISE_APPLICATION_ERROR(-20001, 'Unexpected error: ' || SQLERRM);
END CalculateMonthlyInstallment;
/
