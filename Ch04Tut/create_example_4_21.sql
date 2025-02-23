--
--  name: jack tercheria
--  date: 2/22/2025
--  description: create chapter 4 ex 21
--

CREATE PROCEDURE using_iterate()
BEGIN 
    DECLARE i INT
        DEFAULT 0;
    SET i=0;
    loop1: LOOP
        SET i = i + 1;
        IF i >= 10 THEN
            LEAVE loop1;
        ELSEIF MOD(i, 2) = 0 THEN
            ITERATE loop1;
        END IF;

        SELECT CONCAT(i, ' is an odd number');
    END LOOP loop1;
END

CALL using_iterate();