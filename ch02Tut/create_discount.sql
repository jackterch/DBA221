-- jack tercheria
-- 2/6/2025
-- dba221

CREATE PROCEDURE DiscountedPrice(normal_price NUMERIC(8,2), OUT discount_price NUMERIC(8,2))
BEGIN
    IF (normal_price > 500) THEN 
        SET discount_price = normal_price * .8;
    ELSEIF (normal_price > 100) THEN
        SET discount_price = normal_price * .9;
    ELSE
        SET discount_price = normal_price;
    END IF;
        
    SELECT discount_price AS 'New Price';
END