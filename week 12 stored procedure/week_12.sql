CREATE PROCEDURE maximum_sales_list()
BEGIN
    SELECT COUNT(CUSTOMER_ID) AS 'COUNT Customer ID', MAX(SALE_VALUE) AS 'MAX of Sale Value', MIN(QUANTITY) AS 'MIN Quantity';
    FROM sales;
END;

CALL maximum_sales_list();