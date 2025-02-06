-- jack tercheria
-- 2/5/2025
-- dba221

CREATE TABLE Sale
    ( OrderID   Dec(7,0) NOT NULL,
      CustID    Dec(7,0) NOT NULL,
      TotAmt    Dec(11,2) NOT NULL,
      SaleDate  Date     NOT NULL,
      ShipDate  Date,
      Constraint SalePK PRIMARY KEY (OrderID),
      Constraint SaleCustFK FOREIGN KEY (CustID)
        References customer (CustID)
        On Delete Cascade
        On Update Restrict)