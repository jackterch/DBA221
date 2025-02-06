-- jack tercheria
-- 2/6/2025
-- dba221

CREATE PROCEDURE MySQRT(input_number INT, OUT out_number FLOAT)
BEGIN
    SET out_number = SQRT(input_number);
    SELECT out_number;
END