CREATE PROCEDURE ex6_5a_sp_not_found()
    READS SQL DATA
BEGIN
	 -- Use WHILE loop 

	-- variables 
	DECLARE no_more_rows INT DEFAULT 0;
	DECLARE l_dept_id  INT;
	DECLARE l_message TEXT DEFAULT 'Departments: ';
	
	-- cursors 
	DECLARE c_dept CURSOR FOR
          SELECT department_id
            FROM departments;
	
	-- error handlers 
	-- handler to set no_more_rows=1 if a cursor returns no more rows 
	DECLARE continue handler for NOT FOUND SET no_more_rows=1;   -- for >1 action use begin end block 
	-- DECLARE continue handler for 1329 SET no_more_rows=1; 
	-- DECLARE continue handler for SQLSTATE '02000' SET no_more_rows=1; 
		
	-- other code 
	SET no_more_rows = 0;
	OPEN c_dept;
	
	FETCH c_dept INTO l_dept_id;   -- initial read 
	
	dept_cursor: WHILE(no_more_rows = 0) DO
		
		-- Do something with the data
		SET l_message = concat( l_message, l_dept_id, " * ");  
		
		FETCH c_dept INTO l_dept_id;  -- Read next row  

	END WHILE dept_cursor;	
	CLOSE c_dept;
	SELECT l_message;  

END

CALL ex6_5a_sp_not_found()