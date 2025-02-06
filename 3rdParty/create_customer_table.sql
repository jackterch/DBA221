-- jack tercheria
-- 2/5/2025
-- dba221

CREATE TABLE Customer
    ( CustID    Dec(7,0) NOT NULL,
      Name      Char(30) NOT NULL,
      ShipCity  Char(30),
      Discount  Dec(5,3),
      PRIMARY KEY (CustID))