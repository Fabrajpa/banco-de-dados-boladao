
    USE AdventureWorks2019
    GO

    /*
        Ordem de Processamento Lógico da Query
        1. FROM
        2. WHERE
        3. GROUP BY
        4. HAVING
        5. SELECT
        6. ORDER BY
        7. OFFSET FETCH | TOP
    */
    
    SELECT --TOP 5
           SalesOrderID AS [Primeira Coluna],
           --SalesOrderDetailID,
           CarrierTrackingNumber,
           --OrderQty,
           --ProductID, 
           MAX(UnitPrice) AS TOTAL,
           --LineTotal,
           --ModifiedDate,
           TRY_CAST(ModifiedDate AS DATE) AS [DataModificada]
      FROM Sales.SalesOrderDetail
           -- ModifiedDate é DATETIME
     WHERE CarrierTrackingNumber IS NOT NULL
     GROUP BY SalesOrderID,
              CarrierTrackingNumber,
              --ProductID,
              ModifiedDate
    HAVING MAX(UnitPrice) > 750
     ORDER BY [SalesOrderID]
    OFFSET 20 ROWS
     FETCH NEXT 10 ROWS ONLY
    GO

    --SELECT  FROM Person.Person