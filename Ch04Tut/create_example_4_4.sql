-- 
--  name: jack tercheria
--  date: 2/19/2025
--  description: create 4-4 page 81
--
CREATE PROCEDURE nested_blocks5(l_status INT)
outer_block: BEGIN 
    -- DECLARE l_status int;
    SET l_status = 1;
    inner_block: BEGIN 
        IF (l_status = 1) THEN
            SELECT CONCAT('The value of l_status is ', l_status);
            LEAVE inner_block;
        END IF;
        SELECT 'This statement will not be executed again because l_status = 1';
    END inner_block;
    SELECT 'End of program';
END outer_block;
