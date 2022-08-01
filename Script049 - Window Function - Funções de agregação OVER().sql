
    USE AdventureWorks2019
    GO

    /*
        WINDOW FUNCTION
            * FUN��ES DE CLASSIFICA��O
                ROW_NUMBER(), 
                RANK() haver�o empates
                DENSE_RANK(), NTILE() OVER()
            
            * FUN��ES DE AGREGA��O
            
            * FUN��ES ANAL�TICAS
    */
    WITH CTE_SALES AS (
    
        select --SalesOrderID,
               --SalesOrderDetailID,
               --OrderQty,
               --ProductID,
               --UnitPrice,
               SUM(LineTotal) AS LineTotal,
               DATEPART(YEAR, ModifiedDate) as Ano,
               MONTH(ModifiedDate) as Mes
               --SUM(LineTotal) OVER(ORDER BY SalesOrderDetailID) AS SalesOrderID_Ac,
               --COUNT(LineTotal) OVER(ORDER BY SalesOrderID) AS SalesOrderID_Ac2
          from Sales.SalesOrderDetail
         GROUP BY --SalesOrderID,
                  DATEPART(YEAR, ModifiedDate),
                  MONTH(ModifiedDate)

    )
    --select ROW_NUMBER() OVER(ORDER BY SalesOrderID, Ano, Mes) AS Ordenacao,
    SELECT --ROW_NUMBER() OVER(ORDER BY Ano, Mes) AS Ordenacao,
           --SalesOrderID,
           LineTotal,
           Ano,
           Mes,
           SUM(LineTotal) OVER (ORDER BY Ano, Mes) as LineTotal2
      FROM CTE_SALES
     