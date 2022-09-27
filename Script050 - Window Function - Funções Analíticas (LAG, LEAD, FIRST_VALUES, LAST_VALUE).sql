
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
    
    WITH CTE_TESTE AS (

        SELECT Linha,
               Posicao,
               TRY_CAST(Data AS DATE) AS [Data]

          FROM ( VALUES (1,  'Posi��o 1',  '2020-09-12'),
                        (2,  'Posi��o 2',  '2020-09-12'),
                        (3,  'Posi��o 3',  '2020-10-04'),
                        (4,  'Posi��o 4',  '2021-10-04'),
                        (5,  'Posi��o 5',  '2021-10-06'),
                        (6,  'Posi��o 6',  '2022-12-07'),
                        (7,  'Posi��o 7',  '2022-12-09'),
                        (8,  'Posi��o 8',  '2022-12-09'),
                        (9,  'Posi��o 9',  '2022-12-09'),
                        (10, 'Posi��o 10', '2020-10-04'),
                        (11, 'Posi��o 11', '2022-12-09'),
                        (12, 'Posi��o 12', '2021-10-06')
          
          ) AS Tbl( [Linha], [Posicao], [Data] )
    )

    SELECT Linha,
           
           -- RETORNA REGISTROS | 'PEGA' POSI��O ANTERIOR
           LAG(Posicao, 3, Posicao) OVER(ORDER BY Linha) AS [LAG],
           Posicao,
           
           -- AVAN�A REGISTROS | 'PEGA' POSI��O POSTERIOR
           LEAD(Posicao, 3, Posicao) OVER(ORDER BY Linha) AS [LEAD],
           
           [Data],
           
           FIRST_VALUE(Posicao) OVER(PARTITION BY [Data] ORDER BY Linha) AS [FIRST_VALUE],
           LAST_VALUE(Posicao) OVER(PARTITION BY [Data] ORDER BY Linha) AS [LAST_VALUE]
      
      FROM CTE_TESTE
    GO



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
           Ano,
           Mes,
           LAG(LineTotal, 1, LineTotal) OVER( PARTITION BY Ano ORDER BY Ano, Mes) AS VendaAnterior,
           LineTotal,
           LEAD(LineTotal, 1, LineTotal) OVER( PARTITION BY Ano ORDER BY Ano, Mes) AS VendaPosterior
      FROM CTE_SALES
