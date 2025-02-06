-- jack tercheria
-- 2/6/2025
-- dba221

CREATE PROCEDURE VariableDemo()
BEGIN 
    DECLARE my_integer  INT;            -- 32 bit integer
    DECLARE my_big_integer  BIGINT;     -- 64 bit integer
    DECLARE my_currency NUMERIC;        -- number with 2 decimals
    DECLARE my_pi FLOAT                 -- float point as number
        DEFAULT 3.1415926;              -- initialized as pi
    DECLARE my_text TEXT;               -- huge text 
    DECLARE my_dob  DATE 
        DEFAULT '1960-06-21';           -- my birthday
    DECLARE my_varchar  VARCHAR(30)
        DEFAULT 'Hello World!';         -- up to 30 bytes of text

    SET my_integer = 20;
    SET my_big_integer=POWER(my_integer,3);
    SET my_currency = 22.99;
    SET my_text = 'my text';
    
    SELECT my_integer, my_big_integer, my_currency, my_pi, my_text, my_dob, my_varchar;

END