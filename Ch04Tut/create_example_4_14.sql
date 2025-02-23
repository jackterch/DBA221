--
--  name: jack tercheria
--  date: 2/21/2025
--  description: create chapter 4 ex 14
--
CREATE PROCEDURE using_nested_if(IN sale_value INT)
BEGIN 
    DECLARE customer_status VARCHAR(50)
        DEFAULT 'GOLD';
    DECLARE discount_amount INT
        DEFAULT 15;
    DECLARE sale_id INT
        DEFAULT 20;
    
    IF (sale_value > 200) THEN 
        CALL apply_free_shipping(2);                                                                  -- free shipping
        IF (customer_status = 'PLATINUM') THEN 
            CALL apply_discount(sale_id,20);                                                            -- 20% discount
        ELSEIF (customer_status = 'GOLD') THEN
            CALL apply_discount(sale_id,15);                                                            -- 15% discount
        ELSEIF (customer_status = 'SILVER') THEN
            CALL apply_discount(sale_id,10);                                                             -- 10% discount
        ELSEIF (customer_status = 'BRONZE') THEN
            CALL apply_discount(sale_id,5);                                                               -- 5% discount
        END IF;
    END IF;
END
CALL using_nested_if(20);