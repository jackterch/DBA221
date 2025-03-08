CREATE PROCEDURE calling_procedure_6_12()

BEGIN
	DECLARE EXIT HANDLER FOR 1048 SELECT 'Attempt to insert value';
	CALL sub_procedure_6_12;
END

