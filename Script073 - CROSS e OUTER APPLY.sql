    
    --CROSS APPY e OUTER APPLY
    
    WITH CteVendedor AS (
    
        SELECT BusinessEntityID
          FROM AdventureWorks2019.Sales.SalesPerson
        
         UNION
        
        SELECT BusinessEntityID
          FROM ( VALUES (273),
                        (274)
          ) AS Tbl(BusinessEntityID)
    )

    SELECT SSP.BusinessEntityID,
           CONCAT_WS(' ', FirstName, MiddleName, LastName) AS FullName
      INTO DEVDOJO.dbo.TblVendedor
	  FROM CteVendedor AS SSP
     INNER JOIN AdventureWorks2019.Person.Person AS PP
        ON SSP.BusinessEntityID = PP.BusinessEntityID
    GO

    
    SELECT H.SalesOrderID,
           SalesOrderNumber, 
		   PurchaseOrderNumber,
           CustomerID,
           SalesPersonID,
           ProductID,
           LineTotal
	  INTO DEVDOJO.dbo.TblVendas
      FROM AdventureWorks2019.Sales.SalesOrderHeader AS H
      LEFT JOIN AdventureWorks2019.Sales.SalesOrderDetail AS D
        ON H.SalesOrderID = D.SalesOrderID
     WHERE SalesPersonID IS NOT NULL
    GO

    SELECT * 
      FROM TblVendedor AS V1
      LEFT JOIN TblVendas AS V2
        ON V1.BusinessEntityID = V2.SalesPersonID
     ORDER BY BusinessEntityID
    
    SELECT * 
      FROM TblVendedor AS V1
     CROSS APPLY TblVendas AS V2 --PRODUTO CARTESIANO = CROSS JOIN
        --ON V1.BusinessEntityID = V2.SalesPersonID
     ORDER BY BusinessEntityID
	GO
    
    SELECT * 
      FROM TblVendedor AS V1
     CROSS APPLY ( 
                   SELECT * FROM TblVendas AS V2
                    WHERE V1.BusinessEntityID = V2.SalesPersonID
                 
                 ) AS TblCrossApply
     ORDER BY BusinessEntityID
	GO
    
    SELECT * 
      FROM TblVendedor AS V1
     OUTER APPLY ( 
                   SELECT TOP 3
                          SalesPersonID,
                          ProductID,  
                          SUM(LineTotal) as Total 
                     FROM TblVendas AS V2
                    WHERE V1.BusinessEntityID = V2.SalesPersonID
                    group by SalesPersonID,
                             ProductID
                    ORDER BY SalesPersonID,
                             Total DESC
                 
                 ) AS TblCrossApply
     ORDER BY BusinessEntityID
	GO
    
    SELECT * 
      FROM TblVendedor AS V1
      LEFT JOIN ( 
                  SELECT TOP 3
                         SalesPersonID,
                         ProductID,  
                         SUM(LineTotal) as Total 
                    FROM TblVendas AS V2
                   group by SalesPersonID,
                            ProductID
                   ORDER BY SalesPersonID,
                            Total DESC
                 
                ) AS TblCrossApply
        ON V1.BusinessEntityID = TblCrossApply.SalesPersonID
     ORDER BY BusinessEntityID
    GO


    SELECT * FROM TblVendas
    GO


    CREATE OR ALTER FUNCTION dbo.FuncTop3Vendas (
        @IdVendedor INT
    )
    RETURNS TABLE
    AS
        RETURN (
                 SELECT TOP 3
                        SalesPersonID,
                        ProductID,  
                        SUM(LineTotal) as Total 
                   FROM TblVendas AS V2
                  WHERE SalesPersonID = @IdVendedor
                  GROUP BY SalesPersonID,
                           ProductID
                  ORDER BY SalesPersonID,
                           Total DESC

        )
    GO


    SELECT FullName,
           Total 
      FROM TblVendedor
     OUTER APPLY dbo.FuncTop3Vendas(BusinessEntityID)
	GO