
    USE AdventureWorks2019
    GO
/*
    SELECT BusinessEntityID,
           PersonType,
           NameStyle,
           
           Title,
           
           CASE Title
              WHEN 'Ms.' THEN 'Senhora'
              WHEN 'Mr.' THEN 'Senhor'
              ELSE ''
            END AS TITULO,
           
           
           FirstName,
           MiddleName,
           LastName,

           FirstName + ' ' + MiddleName + ' ' + LastName AS [Nome Completo],

           ModifiedDate

      FROM Person.Person
    GO
*/
    SELECT PP.BusinessEntityID,
           LoginID,
           OrganizationLevel,
           JobTitle,
           BirthDate,
           
           CASE MaritalStatus
              WHEN 'S' THEN 'Solteiro'
              WHEN 'M' THEN 'Casado'
              ELSE 'Não localizado'
            END AS MaritalStatus,
           
           CASE Gender
              WHEN 'M' THEN 'Masculino'
              WHEN 'F' THEN 'Feminino'
            END AS Gender ,
           
           PersonType,
           NameStyle,
           Title,
          
           FirstName,
           MiddleName,

           CASE
              WHEN ( MiddleName = 'E' OR MiddleName = 'A' ) THEN 'VOGAIS'
              WHEN ( MiddleName = 'E' OR MiddleName = 'A' ) AND Title IS NOT NULL THEN 'VOGAIS_2'
              ELSE 'TUDO JUNTO'
            END AS MiddleName_Diferente,
           
           LastName,
           
           Rate,
           CASE 
              WHEN Rate < 12.000 THEN 'Salário Mínimo'
              WHEN Rate BETWEEN 12.000 AND 20.000 THEN 'EMPRESARIO'
              WHEN Rate > 20.000 THEN 'MILIONARIO'
              --ELSE 'COITADO'
            END AS [COMPARACAO RATE],

           CASE 
              WHEN Rate < 12.000 THEN (Rate * 3)
              WHEN Rate BETWEEN 12.000 AND 20.000 THEN Rate * 1.1
              WHEN Rate > 20.000 THEN Rate * 0.1
              --ELSE 'COITADO'
            END AS [COMPARACAO NUMERAL],
           
           
           PayFrequency,
           PEA.EmailAddress,
           PPP.PhoneNumber,
           PPP.PhoneNumberTypeID,
           FirstName + ' ' + MiddleName + ' ' + LastName AS [Nome Completo]

      FROM Person.Person AS PP
      JOIN Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
      JOIN Person.PersonPhone AS PPP
        ON PP.BusinessEntityID = PPP.BusinessEntityID
      LEFT JOIN HumanResources.Employee AS HRE
        ON HRE.BusinessEntityID = PP.BusinessEntityID
      LEFT JOIN HumanResources.EmployeePayHistory AS HREPH
        ON HREPH.BusinessEntityID = PP.BusinessEntityID



/*
    SELECT * FROM HumanResources.Employee
    SELECT * FROM Person.EmailAddress
    SELECT * FROM Person.PersonPhone
    SELECT * FROM Person.PhoneNumberType
    SELECT * FROM HumanResources.EmployeePayHistory
*/