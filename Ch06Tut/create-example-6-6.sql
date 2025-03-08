CREATE PROCEDURE add_department(in_dept_name VARCHAR(30),
								in_location VARCHAR(30),
								in_manager_id INT)
    READS SQL DATA
BEGIN
	DECLARE duplicate_key INT DEFAULT 0;

	BEGIN
		DECLARE EXIT HANDLER FOR 1062 /* duplicate key */ SET duplicate_key = 1;

		INSERT INTO departments (DEPARTMENT_NAME, LOCATION, MANAGER_ID)
		VALUES(in_dept_name, in_location, in_manager_id);

		SELECT CONCAT('Department ', in_dept_name, 'created') AS "Result";
	END;

	IF duplicate_key=1 THEN SELECT CONCAT('Failed to insert ',in_dept_name, ': duplicate key') as "Result";
	
	END IF;

END

CALL add_department("DUPLIN", "MORENO VALLEY", 33);

CALL add_department('CUSTOMER SATISFACTION','DAVIS',4);
