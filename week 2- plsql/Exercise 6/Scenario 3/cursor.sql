DECLARE
    -- Cursor to retrieve all loans
    CURSOR cur_loans IS
        SELECT LoanID, CurrentInterestRate
        FROM Loans;
    
    -- Variables to hold the cursor data
    v_loan_id Loans.LoanID%TYPE;
    v_current_interest_rate Loans.CurrentInterestRate%TYPE;
    
    -- New interest rate policy (example: increase by 0.5%)
    interest_rate_increase CONSTANT NUMBER := 0.005; -- 0.5% increase

BEGIN
    -- Open the cursor
    OPEN cur_loans;
    
    -- Fetch the first row from the cursor
    LOOP
        FETCH cur_loans INTO v_loan_id, v_current_interest_rate;
        
        EXIT WHEN cur_loans%NOTFOUND;
        
        -- Calculate the new interest rate
        -- Ensure the new interest rate does not exceed a maximum rate, e.g., 20%
        DECLARE
            v_new_interest_rate NUMBER;
        BEGIN
            v_new_interest_rate := v_current_interest_rate + (v_current_interest_rate * interest_rate_increase);
            
            IF v_new_interest_rate > 0.20 THEN
                v_new_interest_rate := 0.20; -- Cap the interest rate at 20%
            END IF;
            
            -- Update the loan interest rate
            UPDATE Loans
            SET CurrentInterestRate = v_new_interest_rate
            WHERE LoanID = v_loan_id;
            
            -- Optional: Print the updated loan details (for debugging purposes)
            DBMS_OUTPUT.PUT_LINE('Loan ID: ' || v_loan_id || 
                                 ' Old Rate: ' || TO_CHAR(v_current_interest_rate, '999.99') ||
                                 ' New Rate: ' || TO_CHAR(v_new_interest_rate, '999.99'));
        END;
    END LOOP;
    
    -- Close the cursor
    CLOSE cur_loans;
    
    -- Commit the transaction
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Interest rates updated successfully for all loans.');
    
EXCEPTION
    WHEN OTHERS THEN
        -- Handle unexpected errors
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; -- Rollback changes in case of an error
END;
/
