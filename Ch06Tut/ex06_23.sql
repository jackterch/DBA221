CREATE PROCEDURE ex06_23WithSignal(IN p_department_name VARCHAR(30), 
						 IN p_manager_surname VARCHAR(30), 	
						 IN p_manager_firstname VARCHAR(30), 
						 IN p_location VARCHAR(30))
BEGIN

/* Chapter 6: sp_add_department version Example 6-23 with signal*/

/* START Declare Conditions */

	DECLARE duplicate_key CONDITION FOR 1062;
	DECLARE foreign_key_violated CONDITION FOR 1452; -- changed from 1216 per mySQL reference


/* START Declare variables and cursors */
	
	DECLARE error_text TEXT DEFAULT '';
	DECLARE p_sqlstate_code CHAR(5) DEFAULT '00000';
	DECLARE p_sqlcode INT;
	DECLARE p_status_message TEXT;
	DECLARE l_manager_id INT DEFAULT 0;
		
	DECLARE csr_mgr_id CURSOR FOR
	 SELECT employee_id
	   FROM employees
	  WHERE surname=UPPER(p_manager_surname)
	   	AND firstname=UPPER(p_manager_firstname);

/* START Declare Exception Handlers */         	
	
  DECLARE CONTINUE HANDLER FOR duplicate_key
    BEGIN
		GET DIAGNOSTICS CONDITION 1
		  p_sqlcode = MYSQL_ERRNO,
		  error_text = MESSAGE_TEXT;
				  
		SET p_status_message=concat('mySQL error no: ', p_sqlcode, ' - Duplicate key error');
		
		SIGNAL SQLSTATE '01000' 
             SET MESSAGE_TEXT = p_status_message;

    END;
	
  DECLARE CONTINUE HANDLER FOR foreign_key_violated
    BEGIN
		GET DIAGNOSTICS CONDITION 1
		  p_sqlcode = MYSQL_ERRNO,
		  error_text = MESSAGE_TEXT;
						  
		SET p_status_message=concat('mySQL error no: ', p_sqlcode, ' - Foreign key violated');
		
		SIGNAL SQLSTATE '01000'
             SET MESSAGE_TEXT = p_status_message; 

    END;
	
  DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
		GET DIAGNOSTICS CONDITION 1
		  p_sqlcode = MYSQL_ERRNO,
		  error_text = MESSAGE_TEXT;
		
		SET p_status_message=concat('mySQL error no: ', p_sqlcode, ' - No record found');
		
		SIGNAL SQLSTATE '01000'  --gives warning 
             SET MESSAGE_TEXT = p_status_message;
	  
    END;
    
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
	   
		GET DIAGNOSTICS CONDITION 1
		  p_sqlstate_code = RETURNED_SQLSTATE,
		  p_sqlcode  = MYSQL_ERRNO,
		  error_text = MESSAGE_TEXT;

		IF sqlstate_code <> '00000' or p_sqlcode <> 0 THEN
		  SET error_text = concat('mySQL error no:', p_sqlcode, ' - Please contact your Systems Admin');	
		  RESIGNAL 
			 SET MESSAGE_TEXT = error_text;    
		END IF;

	  END;   

/* START Execution */
	
  SET p_sqlcode=0;
  OPEN csr_mgr_id;
  FETCH csr_mgr_id INTO l_manager_id;
	
  IF p_sqlcode<>0 THEN 		/* Failed to get manager id*/
    SELECT CONCAT(p_status_message,' when fetching manager id');
  ELSE
					/* Got manager id, we can try insert */
    INSERT INTO departments (department_name,manager_id,location)
    VALUES(UPPER(p_department_name),l_manager_id,UPPER(p_location));
	
    IF p_sqlcode<>0 THEN	/* Failed to insert new department */
      SELECT CONCAT(p_status_message,
                           ' when inserting new department');
    END IF;
  END IF;
	
  CLOSE csr_mgr_id;

END