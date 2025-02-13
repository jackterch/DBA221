--
-- name: jack tercheria
-- date: 2/11/2025
-- description : 3-5
--
CREATE PROCEDURE sp_demo_inout_parameter(INOUT p_inout INT)
BEGIN 
    SELECT p_inout 'We can see the value of the INOUT parameter in the stored program';
    SET p_inout = 2; 
    SELECT p_inout, 'INOUT parameter value has been changed';
END
CALL sp_demo_out_parameter(@p_out);