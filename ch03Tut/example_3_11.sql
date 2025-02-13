--
-- name: jack tercheria
-- date: 2/11/2025
-- description : 3-11 create
--
CREATE FUNCTION f_title(in_gender CHAR(1), in_age INT, in_marital_status VARCHAR(7)) RETURNS VARCHAR(6)

BEGIN
    DECLARE title VARCHAR(6);

    IF in_gender = 'F' AND in_age < 16 THEN 
        SET title = 'Miss';
    ELSEIF in_gender = 'F' AND in_age >= 16 AND in_marital_status = 'Married' THEN 
        SET title = 'Mrs';
    ELSEIF in_gender = 'F' AND in_age >= 16 AND in_marital_status = 'Single' THEN 
        SET title = 'Ms';
    ELSEIF in_gender = 'M' AND in_age < 16 THEN
        SET title = 'Master';
    ELSEIF in_gender = 'M' AND in_age >= 16 THEN
        SET title = 'Mr';
    END IF;
    RETURN(title); 
END;