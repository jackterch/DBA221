--
--  name: jack tercheria
--  date: 2/22/2025
--  description: create chapter 4 ex 25
--

CREATE PROCEDURE nested_loops()
BEGIN 
    DECLARE i, j INT
        DEFAULT 1;
    SET j = 1;
    loop1: WHILE i < 12 DO
                loop2: WHILE j < 12 DO
                SELECT CONCAT(i, ' times ', j, ' is ', i * j);
                SET i = i + 1;
                SET j = j + 1;
                END WHILE loop2;
    END WHILE loop1;
END

CALL nested_loops();