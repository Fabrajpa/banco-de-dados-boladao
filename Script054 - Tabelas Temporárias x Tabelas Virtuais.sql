        
    DROP TABLE IF EXISTS #TblMeses
    GO

    WITH CTE_HRE AS (
        
        SELECT Ano,
               [1] Jan, 
               [2] Fev, 
               [3] Mar, 
               [4] Abr, 
               [5] Mai, 
               [6] Jun, 
               [7] Jul, 
               [8] Ago,  
               [9] [Set], 
               [10] [Out], 
               [11] Nov, 
               [12] Dez,
               [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] as QtdTotal
                
          FROM (
                 SELECT BusinessEntityID,
                        YEAR(HireDate) AS Ano,
                        MONTH(HireDate) AS [Mes]
                   FROM AdventureWorks2019.HumanResources.Employee
          ) AS TBL
         PIVOT ( COUNT(BusinessEntityID)
                   FOR [Mes] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
         ) AS Pvt

    )

    SELECT * INTO #TblMeses
      FROM CTE_HRE
    GO

    select * from #TblMeses
    GO



    WITH CTE_TRIMESTRE AS (

        SELECT Ano,
               [1] Trimestre1, 
               [2] Trimestre2, 
               [3] Trimestre3, 
               [4] Trimestre4
                
          FROM (
                 SELECT BusinessEntityID,
                        YEAR(HireDate) AS Ano,
                        DATEPART(QUARTER, HireDate) AS [Trimestre]
                   FROM AdventureWorks2019.HumanResources.Employee
          ) AS TBL
         PIVOT ( COUNT(BusinessEntityID)
                   FOR [Trimestre] IN ( [1], [2], [3], [4] )
         ) AS Pvt
    )

    SELECT * INTO #TblTrimestre
      FROM CTE_TRIMESTRE
    GO

    select @@SPID
    WITH CTE_TUDO AS (
        
        select M.Ano,
               Trimestre1,
               Trimestre2,
               Trimestre3,
               Trimestre4 
               Jan, 
                Fev, 
                Mar, 
                Abr, 
                Mai, 
                Jun, 
                Jul, 
                Ago,  
                [Set], 
                [Out], 
                Nov, 
                Dez,
                QtdTotal
          from #TblMeses AS M
          JOIN #TblTrimestre as T
            ON M.Ano = T.Ano
    )

    SELECT * FROM CTE_TUDO
    
    select * from #TblTrimestre