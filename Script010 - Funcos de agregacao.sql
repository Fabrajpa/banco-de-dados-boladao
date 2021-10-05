/*
    COUNT: CONTAGEM
    MIN: MINIMO
    MAX: MAXIMO
    SUM: SOMATORIO
    AVG: MEDIA
*/

    USE AdventureWorks2019
    GO
    
    SELECT COUNT(*) FROM Person.Person
    

    SELECT COUNT(*) AS CONTADOR,
           FirstName,
           MiddleName
    
      FROM Person.Person
     WHERE MiddleName IS NOT NULL
     GROUP BY FirstName,
              MiddleName
    GO

    SELECT MIN(BusinessEntityID) AS Minimo,
           MIN(ModifiedDate) AS [Data Modificada]
      FROM Person.Person

    SELECT MAX(BusinessEntityID) AS Maximo,
           MAX(ModifiedDate) as [DATA modificada max]
      FROM Person.Person

    SELECT SUM(BusinessEntityID) AS SOMA,
           SUM(FirstName)  as PrimeiroNome
      FROM Person.Person --214.960.222

    SELECT AVG(BusinessEntityID) 
      FROM Person.Person

    SELECT --SSP.BusinessEntityID,
           --FirstName,
           --MiddleName,
           --LastName,
           --TerritoryID,
           SUM(SalesQuota) AS SalesQuota
           --Bonus,
           --CommissionPct,
           --*SalesYTD,
           --SalesLastYear,
           --PP.ModifiedDate 
      FROM Sales.SalesPerson AS SSP
      JOIN Person.Person AS PP
        ON SSP.BusinessEntityID = PP.BusinessEntityID
     GROUP BY --SSP.BusinessEntityID,
              --FirstName,
              MiddleName
              --LastName,
              --TerritoryID,
              --Bonus,
              --CommissionPct,
              --SalesYTD,
              --SalesLastYear,
              --PP.ModifiedDate


    SELECT * FROM HumanResources.Department
    
    SELECT * FROM HumanResources.EmployeeDepartmentHistory
     WHERE StartDate BETWEEN '2001-01-01' AND '2009-01-14'
     ORDER BY StartDate


    SELECT RateChangeDate,
           SUM(Rate) AS Rate,
           MAX(Rate) AS [MAX]
      FROM HumanResources.EmployeePayHistory
     GROUP BY RateChangeDate


    SELECT COUNT(*) AS CONTADOR,
           FirstName
      FROM Person.Person
     GROUP BY FirstName
    HAVING COUNT(*) > 20

    SELECT AVG(Rate) as rate,
           RateChangeDate 
      FROM HumanResources.EmployeePayHistory
     GROUP BY RateChangeDate
    HAVING AVG(Rate) < 10.000


    SELECT SUM(Rate) as rate,
           RateChangeDate 
      FROM HumanResources.EmployeePayHistory
     GROUP BY RateChangeDate
    HAVING SUM(*) < 7.000

    
    SELECT COUNT(*) 
      FROM Person.Person
     WHERE MiddleName IS NOT NULL

    SELECT COUNT(MiddleName) 
      FROM Person.Person
     --WHERE MiddleName IS NOT NULL

     GROUP BY RateChangeDate
    HAVING SUM(*) < 7.000



    SELECT SUM(Rate) as [SUM],
           MIN(Rate) as [MIN],
           MAX(Rate) as [MAX],
           COUNT(Rate) AS [COUNT],
           AVG(Rate) AS [AVG]
            
      FROM HumanResources.EmployeePayHistory
    