/*
        name: jack tercheria
        date: 2/26/2025
        description: create example 5 14
*/
CREATE PROCEDURE intial_read_loop_5_14()
BEGIN
       DECLARE no_more_departments INT;
       DECLARE l_department_id INT;
       DECLARE l_department_name INT;
       DECLARE l_location INT;
       DECLARE l_emp_count INT;
       DECLARE l_department_count INT DEFAULT 0;


        DECLARE dept_csr CURSOR FOR
        SELECT department_id, department_name, location
        FROM departments;

        DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_departments=1;

        SET no_more_departments=0;
        OPEN dept_csr;

        FETCH dept_csr INTO l_department_id, l_department_name, l_location;

        dept_loop:WHILE(no_more_departments = 0) DO

                SET l_department_count = l_department_count + 1;

                SET l_emp_count=0;

                -- initial read for employee
                FETCH dept_csr INTO l_department_id, l_department_name, l_location; 


        END WHILE dept_loop;

        SELECT (l_department_count);
        
        CLOSE dept_csr;
        SET no_more_departments=0;
END;

CALL intial_read_loop_5_14();