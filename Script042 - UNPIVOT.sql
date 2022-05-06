
    /*
        UNPIVOT
    */
    
    DROP TABLE IF EXISTS TblApoio
    GO
    SELECT * INTO TblApoio
      FROM (
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
                        FROM HumanResources.Employee
               ) AS TBL
              PIVOT ( COUNT(BusinessEntityID)
                        FOR [Mes] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
              ) AS Pvt
      ) AS Base
    GO


    SELECT Ano,
           Meses,
           Qtd
      FROM (
             SELECT Ano,
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
                    [Nov],
                    Dez  
               FROM TblApoio
      ) AS TblA
    UNPIVOT ( [Qtd] FOR [Meses] IN ( [Jan], [Fev], [Mar], [Abr], [Mai], [Jun], [Jul], [Ago], [Set], [Out], [Nov], [Dez]  )

    ) AS Desp
    
    GO