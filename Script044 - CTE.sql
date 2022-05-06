
    USE AdventureWorks2019
    GO

    /*
        CTE COMMON TABLE EXPERESSION -> EXPRESSÃO DE TABELA COMUM
        TABELAS VIRTUAIS E RECURSIVIDADE
    */

    WITH DevDojo AS (

        SELECT 'DevDojo é o Melhor' AS Col1
    ),

    CTE2 AS (

        SELECT 'Maratona Java' AS Col2
    ),

    CTE_ALL AS (
        
        SELECT * FROM CTE2
         UNION
        SELECT * FROM DevDojo
         UNION
        SELECT 'SpringBoot' AS Col3
    ),
    
    CTE_SUB AS (
        
        SELECT *
          FROM (        
                 SELECT 'A' AS COL1
                  UNION
                 SELECT 'B' AS COL2
          ) AS TB
    )

    SELECT * FROM CTE_SUB
    GO

    --SELECT * FROM Sales.Store
    --SELECT * FROM Sales.SalesPerson
    --SELECT * FROM Sales.SalesOrderDetail
    --SELECT * FROM Sales.SalesOrderHeader

    --SELECT * FROM Purchasing.PurchaseOrderDetail

    WITH TotalVenda AS (

        SELECT EmployeeID,
               SUM(LineTotal) AS LineTotal
          FROM Purchasing.PurchaseOrderHeader AS PPOH
         INNER JOIN Purchasing.PurchaseOrderDetail AS PPOD
            ON PPOH.PurchaseOrderID = PPOD.PurchaseOrderID
         group by EmployeeID

    )

    
    SELECT HRE.BusinessEntityID,
           CONCAT_WS(' ', FirstName, MiddleName, LastName) AS FullName, 
           LoginID,
           JobTitle,
           Gender,
           HireDate,
           EmailAddress,
           CONCAT_WS( ' ', AddressLine1, StateProvinceID, City) AS [Address],
           LineTotal
      FROM HumanResources.Employee AS HRE
     INNER JOIN Person.Person AS PP
        ON HRE.BusinessEntityID = PP.BusinessEntityID
     INNER JOIN Person.EmailAddress AS PPA
        ON PP.BusinessEntityID = PPA.BusinessEntityID
     INNER JOIN Person.Address AS PA
        ON PPA.BusinessEntityID = PA.AddressID
     INNER JOIN TotalVenda AS TV
        ON TV.EmployeeID = HRE.BusinessEntityID
    GO
    

      
    
    WITH CTE_PESSOA AS (

        SELECT * from PESSOA
        
    ),

    CTE_PESSOA2 AS (

        SELECT CASE Title
                  WHEN 'CTE' THEN 'TROCADO'
                  ELSE Title
                END AS Titulo,
               * 
          FROM CTE_PESSOA
    )

    SELECT * FROM CTE_PESSOA2
    GO

    
    -- RECURSIVIDADE

    -- POR PADRÃO SERÁ 100 ITERAÇÕES
    -- ATE 32.767
    WITH CTE_RECURSIVO_NUMERO AS (

        SELECT 1 AS COLUNA
         UNION ALL -- RECURSÃO
        SELECT COLUNA + 1 FROM CTE_RECURSIVO_NUMERO
         WHERE COLUNA < 10000 --BREAK
    )

    SELECT * FROM CTE_RECURSIVO_NUMERO
    OPTION (MAXRECURSION 0) --sem limite
    GO

    set LANGUAGE 'Brazilian'
    go

    WITH CTE_CALENDARIO AS (

        SELECT TRY_CAST('1000-01-01' AS DATE) AS ColData
         UNION ALL
        SELECT DATEADD(DAY, 1, ColData) AS ColData
          FROM CTE_CALENDARIO
         WHERE ColData < TRY_CAST('9999-12-31' AS DATE)
    )
    SELECT ColData,
           DATEPART(WEEKDAY, ColData) AS DiaSemana,
           MONTH(ColData) as Mes,
           DATENAME(MONTH, ColData) AS NomeMes,
           YEAR(ColData) AS Ano
      FROM CTE_CALENDARIO
    OPTION (MAXRECURSION 0)
    GO