--
--  name: jack tercheria
--  date: 2/21/2025
--  description: create chapter 4 ex 15
--
CREATE PROCEDURE using_case(IN sale_value INT)
BEGIN 
    DECLARE customer_status VARCHAR(50)
        DEFAULT 'GOLD';
    DECLARE discount_amount INT
        DEFAULT 15;
    DECLARE sale_id INT
        DEFAULT 20;

    CASE customer_status
        WHEN 'PLATINUM' THEN
            CALL apply_discount(2,20);          -- 20% discount
        WHEN 'GOLD' THEN    
            CALL apply_discount(2,15);          -- 15% discount
        WHEN 'SILVER' THEN
            CALL apply_discount(2,10);          -- 10% discount
        WHEN 'BRONZE' THEN
            CALL apply_discount(2,5);           -- 5% discount
    END CASE;
END

CALL using_case(200);