--
--  name: jack tercheria
--  date: 2/19/2025
--  description apply_free_shipping
--
CREATE PROCEDURE apply_free_shipping(IN sale_id INT)
BEGIN 
    DECLARE sale_id INT
        DEFAULT 20;
    DECLARE free_shipping VARCHAR(50)
        DEFAULT 'Free shipping for sales id ';
    
    SELECT free_shipping, sale_id;
END