/*
        name: jack tercheria
        date: 2/28/2025
        description: create example 5 28
*/
CREATE PROCEDURE sp_customer_search(in_customer_name VARCHAR(30),
                                    in_contact_surname VARCHAR(30),
                                    in_contact_firstname VARCHAR(30),
                                    in_phoneno VARCHAR(12))
BEGIN
    SELECT *
    FROM customers
    WHERE (customer_name LIKE in_customer_name
            OR in_contact_surname IS NULL)
       AND (contact_surname LIKE in_contact_surname
            OR in_contact_surname IS NULL)
       AND (contact_firstname LIKE in_contact_firstname
            OR in_contact_firstname IS NULL)
        AND (phoneno LIKE in_phoneno
            OR in_phoneno IS NULL);
END;

CALL sp_customer_search(NULL, NULL, NULL, NULL);