--
-- name: jack tercheria
-- date: 2/11/2025
-- description : 3-3
--
CREATE PROCEDURE sp_demo_in_parameter(IN p_in INT)
BEGIN 
    /* We can see the value of the IN parameter */
    SELECT p_in;
    /* We can modify it */
    SET p_in = 2;
    /* Show that the modification took place */
    SELECT p_in;
END
CALL sp_demo_in_parameter(@p_in);