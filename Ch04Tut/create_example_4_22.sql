--
--  name: jack tercheria
--  date: 2/22/2025
--  description: create chapter 4 ex 22
--

CREATE PROCEDURE using_repeat()
BEGIN 
    DECLARE i INT
        DEFAULT 0;
    SET i=0;
    loop1: REPEAT
        SET i = i + 1;
        IF MOD(i,2)<>0 THEN             -- Even number - try AGAINST
            SELECT CONCAT(i, ' is an odd number.');
        END IF;
    UNTIL i >= 10
    END REPEAT;
END

CALL using_repeat();