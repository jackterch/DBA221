CREATE PROCEDURE sp_update_6_17(p_employee_id INT,
								p_dob DATE)

BEGIN
	DECLARE employee_is_too_young CONDITION FOR SQLSTATE '45000';

	IF DATE_SUB(curdate(), INTERVAL 16 YEAR) < p_dob THEN
		SIGNAL employee_is_too_young 
		SET MESSAGE_TEXT = 'Employee must be 16 years or older';
	ELSE 
		UPDATE employees
		SET DATE_OF_BIRTH = p_dob 
		WHERE EMPLOYEE_ID = p_employee_id;
	END IF;
END

CALL sp_update_6_17(1, now());