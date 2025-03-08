CREATE PROCEDURE add_department_6_7(in_dept_name VARCHAR(30),
								in_location VARCHAR(30),
								in_manager_id INT)
    MODIFIES SQL DATA
BEGIN
	DECLARE duplicate_key INT DEFAULT 0;

	DECLARE CONTINUE HANDLER FOR 1062 /* duplicate key */
		SET duplicate_key = 1;

	INSERT INTO departments(DEPARTMENT_NAME, LOCATION, MANAGER_ID)
	VALUES (in_dept_name, in_location, in_manager_id);

	IF duplicate_key = 1 THEN
		SELECT CONCAT('Failed to insert ', in_dept_name, ': duplicate key') AS "Result";
	ELSE 
		SELECT CONCAT('Department ', in_dept_name, ' created ') AS "Result";

	END IF;

END

CALL add_department_6_7("DUPLIN", "MORENO VALLEY", 33);