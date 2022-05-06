
    USE AdventureWorks2019
    GO

    /*
        PIVOT
    */  

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