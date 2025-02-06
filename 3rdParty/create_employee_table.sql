-- jack tercheria
-- 2/5/2025
-- dba221

CREATE TABLE Employee
    ( EmpID     Dec(7,0)    NOT NULL,
      FstNam    Char(20),
      MdlInl    Char(1),
      LstNam    Char(30)    NOT NULL,
      MgrEmpID  Dec(7,0),
      Constraint EmpPK PRIMARY KEY (EmpID))