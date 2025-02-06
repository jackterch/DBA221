-- jack tercheria
-- 2/6/2025
-- dba221

CREATE PROCEDURE sp_emps_in_dept(in_employee_id INT)
BEGIN
    SELECT EMPLOYEE_ID, SURNAME, FIRSTNAME, ADDRESS1, ADDRESS2, ZIPCODE, DATE_OF_BIRTH
    FROM employees
    WHERE DEPARTMENT_ID = in_employee_id;
END