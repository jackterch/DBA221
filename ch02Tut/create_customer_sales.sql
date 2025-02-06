-- jack tercheria
-- 2/6/2025
-- dba 221

CREATE PROCEDURE CustomerSales(in_customer_id INT)
READS SQL DATA
BEGIN
    DECLARE total_sales NUMERIC(8,2);
    
    SELECT SUM(sale_value)
        INTO total_sales
      FROM sales
    WHERE customer_id = in_customer_id;
    
    SELECT CONCAT("Total sales for ", in_customer_id, ' is ', total_sales);
END