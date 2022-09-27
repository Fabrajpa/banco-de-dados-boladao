
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
    
    WITH CTE_TESTE AS (

        SELECT Linha,
               Posicao,
               TRY_CAST(Data AS DATE) AS [Data]

          FROM ( VALUES (1,  'Posição 1',  '2020-09-12'),
                        (2,  'Posição 2',  '2020-09-12'),
                        (3,  'Posição 3',  '2020-10-04'),
                        (4,  'Posição 4',  '2021-10-04'),
                        (5,  'Posição 5',  '2021-10-06'),
                        (6,  'Posição 6',  '2022-12-07'),
                        (7,  'Posição 7',  '2022-12-09'),
                        (8,  'Posição 8',  '2022-12-09'),
                        (9,  'Posição 9',  '2022-12-09'),
                        (10, 'Posição 10', '2020-10-04'),
                        (11, 'Posição 11', '2022-12-09'),
                        (12, 'Posição 12', '2021-10-06')
          
          ) AS Tbl( [Linha], [Posicao], [Data] )
    )

    SELECT Linha,
           
           -- RETORNA REGISTROS | 'PEGA' POSIÇÃO ANTERIOR
           LAG(Posicao, 3, Posicao) OVER(ORDER BY Linha) AS [LAG],
           Posicao,
           
           -- AVANÇA REGISTROS | 'PEGA' POSIÇÃO POSTERIOR
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
