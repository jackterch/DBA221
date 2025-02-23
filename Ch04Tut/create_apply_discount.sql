--
--  name: jack tercheria
--  date: 2/19/2025
--  description apply_discount
--
CREATE PROCEDURE apply_discount(IN sale_id INT, IN discount_amount INT)
BEGIN
    DECLARE sale_id INT
        DEFAULT 20;
    DECLARE discount_amount INT
        DEFAULT 15;
    DECLARE shipping VARCHAR(50)
        DEFAULT ' % discount on shipping for sales id ';
    
    SELECT discount_amount, shipping, sale_id;
END

CALL apply_discount(20,0);