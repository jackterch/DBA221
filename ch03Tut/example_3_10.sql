--
-- name: jack tercheria
-- date: 2/11/2025
-- description : 3-10
--
CREATE PROCEDURE operators()
BEGIN 
    DECLARE a int default 2;
    DECLARE b int default 3;
    DECLARE c float;

    SET c=a+b; SELECT 'a+b=',c;
    SET c=a/b; SELECT 'a/b=',c;
    SET c=a*b; SELECT 'a*b=',c;

    IF (a<b) THEN 
        SELECT 'a is less than b';
    END IF;
    IF NOT (a=b) THEN
        SELECT 'a is not equal to b';
    END IF;
END
CALL operators();