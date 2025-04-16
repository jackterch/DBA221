-- name: jack tercheria
-- date: 4/8/2025
-- description: stored function email generator
CREATE FUNCTION Ch10Lab_email(first_name VARCHAR(15), middle_name VARCHAR(15), last_name VARCHAR(30), birthday DATE) 
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE fname_string VARCHAR(2);
    DECLARE mname_string VARCHAR(1);
    DECLARE random_number_1 INT;
    DECLARE username_string VARCHAR(30);
    DECLARE year_current_date INT;
    DECLARE year_birthday INT;
    DECLARE form_age INT;
    DECLARE declare_date DATE;
    DECLARE random_letter VARCHAR(1);
    DECLARE random_number_2 INT;

    SET fname_string = SUBSTRING(first_name, 1, 2);

    SET declare_date = CURDATE();

    SET random_number_2 = RAND() * (122) + 65;

    IF middle_name IS NOT NULL THEN
        SET mname_string = SUBSTRING(middle_name, 1, 1);
    END IF;

    SET random_number_1 = RAND() * (99) + 1;

    SET year_current_date = SUBSTRING(declare_date, 1, 4);

    SET year_birthday = SUBSTRING(birthday, 1, 4);

    SET form_age = year_current_date - year_birthday;

    SET random_letter = CHAR(random_number_2);

    SET username_string = CONCAT(last_name, fname_string, mname_string, random_number_1, form_age, random_letter);
    

    RETURN username_string;
END;

SELECT Ch10Lab_email("jack", "ethan", "tercheria", "1999-04-20");

SELECT Ch10Lab_email("spongebob", "", "squarepants", "1994-01-20");

SELECT Ch10Lab_email("squidward", "", "tentacles", "2002-10-10");