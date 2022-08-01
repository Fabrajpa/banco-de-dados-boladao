
    USE AdventureWorks2019
    GO

    /*
        WINDOW FUNCTION
            * FUNÇÕES DE CLASSIFICAÇÃO
                ROW_NUMBER(), 
                RANK() haverão empates
                DENSE_RANK(), NTILE() OVER()
            
            * FUNÇÕES DE AGREGAÇÃO
            
            * FUNÇÕES ANALÍTICAS
    */

    WITH CTE_ROW_NUMBER AS (
        
        SELECT ROW_NUMBER() OVER(PARTITION BY FirstName, MiddleName ORDER BY FirstName, MiddleName) AS [ROW_NUMBER],
               * 
          FROM Person.Person
    )

    SELECT * FROM CTE_ROW_NUMBER
     WHERE [ROW_NUMBER] > 1
    GO


    SELECT RANK() OVER(ORDER BY FirstName, MiddleName) AS [RANK],
           * 
      FROM Person.Person

    SELECT DENSE_RANK() OVER(PARTITION BY FirstName ORDER BY FirstName, MiddleName) AS [DENSE_RANK],
           * 
      FROM Person.Person




    SELECT ROW_NUMBER() OVER( PARTITION BY SalesOrderID ORDER BY LineTotal DESC) AS [ROW_NUMBER],
           * 
      FROM Sales.SalesOrderDetail

    
    SELECT NTILE(2) OVER( PARTITION BY SalesOrderID ORDER BY SalesOrderID DESC ) AS [NTILE],
           * 
      FROM Sales.SalesOrderDetail


    SELECT * INTO AUX_PESSOA_MS
      FROM Person.Person
    GO
    


    WITH CTE_DELECAO AS (
    
        select ROW_NUMBER() OVER(PARTITION BY FirstName, MiddleName, LastName ORDER BY FirstName, MiddleName, LastName) AS FullName,
               * 
          FROM AUX_PESSOA_MS
    )

    --DELETE FROM CTE_DELECAO
    -- WHERE FullName > 1
    

    SELECT * FROM CTE_DELECAO
     WHERE FullName > 1



    SELECT p.FirstName, 
		   p.LastName,
		   ROW_NUMBER() OVER (ORDER BY a.PostalCode) AS [Row Number], 
		   RANK() OVER (ORDER BY a.PostalCode) AS [Rank],
		   DENSE_RANK() OVER (ORDER BY a.PostalCode) AS [Dense Rank],
		   NTILE(4) OVER (ORDER BY a.PostalCode) AS [Quartile],
		   s.SalesYTD,
		   a.PostalCode  
  	  FROM Sales.SalesPerson AS s   
     INNER JOIN Person.Person AS p   
        ON s.BusinessEntityID = p.BusinessEntityID  
     INNER JOIN Person.Address AS a   
        ON a.AddressID = p.BusinessEntityID  
	 WHERE TerritoryID IS NOT NULL 
	   AND SalesYTD <> 0
	GO