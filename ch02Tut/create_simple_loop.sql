-- jack tercheria
-- 2/6/2025
-- dba221

CREATE PROCEDURE SimpleLoop()
BEGIN
    DECLARE counter INT DEFAULT 0;
    
    my_simple_loop: LOOP
        SET counter = counter + 1;
        IF counter = 10 THEN
            LEAVE my_simple_loop;
        END IF;
    END LOOP my_simple_loop;
    SELECT counter;
    SELECT 'I can count to ten';
END