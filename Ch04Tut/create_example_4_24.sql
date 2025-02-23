--
--  name: jack tercheria
--  date: 2/22/2025
--  description: create chapter 4 ex 24
--

CREATE PROCEDURE using_while_less()
BEGIN 
    DECLARE i INT
        DEFAULT 0;
    SET i=0;
    loop1: WHILE i <= 10 DO
        IF MOD(i,2)<>0 THEN                 -- Even number- try again
            SELECT CONCAT(i, ' is an odd number.');
        END IF;
        SET i = i + 1;
    END WHILE loop1;
END

CALL using_while_less();