
    USE AdventureWorks2019
    GO

    SELECT Ano,

           ( SELECT MAX(Valor)
               FROM ( VALUES (Jan), (Fev), (Mar), (Abr), (Mai), ([Jun]), (Jul), (Ago), ([Set]), ([Out]), (Nov), (Dez) ) AS TblValues(Valor)
           ) AS ColunaSubSelect

      FROM TblApoio



    SELECT A,
           B 
      FROM ( VALUES ('A'), ('AB'), ('AC') 
      ) AS TBL(A),
      ( VALUES ('111'), ('BBB') ) AS SegTbl(B)
