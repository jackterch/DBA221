/*
    name: jack tercheria
    date: 2/26/2025
    description: create example 5 17
*/
CREATE PROCEDURE nested_cursor_while_loop_5_17()
READS SQL DATA
BEGIN
        DECLARE l_department_id INT;
        DECLARE l_employee_id INT;
        DECLARE l_emp_count INT DEFAULT 0;
        DECLARE l_last_dept INT DEFAULT 0;


        DECLARE dept_csr CURSOR FOR
        SELECT department_id FROM departments
        LIMIT 5;

        DECLARE emp_csr CURSOR FOR
        SELECT employee_id FROM employees
        WHERE department_id = l_department_id;

        DECLARE CONTINUE HANDLER FOR NOT FOUND SET l_last_dept=1;

        SET l_last_dept=0;

        OPEN dept_csr;

        FETCH dept_csr INTO l_department_id;

        dept_loop:WHILE l_last_dept = 0 DO

                emp_block:BEGIN
                DECLARE l_last_emp INT DEFAULT 0;
                DECLARE CONTINUE HANDLER FOR NOT FOUND SET l_last_emp = 1;

                SET l_last_emp=0;
                SET l_emp_count=0;

                OPEN emp_csr;

                -- initial read for employee
                FETCH emp_csr INTO l_employee_id; 
                emp_loop:WHILE (l_last_emp=0) DO 

                        SET l_emp_count = l_emp_count+1;
                        FETCH emp_csr INTO l_employee_id;

                END WHILE emp_loop;
                CLOSE emp_csr;
            END emp_block; 

            SELECT CONCAT("Department ", l_department_id, " has ", l_emp_count, " employees.");

            FETCH dept_csr into L_department_id;
        END WHILE dept_loop;
    CLOSE dept_csr;
END;

CALL nested_cursor_while_loop_5_17();