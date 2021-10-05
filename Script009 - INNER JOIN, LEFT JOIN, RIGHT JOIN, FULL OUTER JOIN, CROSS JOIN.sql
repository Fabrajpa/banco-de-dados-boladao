/*
    JOIN: JUNÇÃO
*/
    
    SELECT PP.BusinessEntityID,
           PersonType,
           Title,
           FirstName,
           MiddleName,
           LastName,
           EmailAddress,
           PhoneNumber
      FROM Person.Person AS PP
      --JOIN Person.EmailAddress AS PEA
     INNER JOIN Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
      JOIN Person.PersonPhone AS PPP
        ON PP.BusinessEntityID = PPP.BusinessEntityID




    SELECT * FROM Person.PersonPhone

    SELECT * FROM Person.Person AS PP --19972

    SELECT HRE.BusinessEntityID,
           PP.BusinessEntityID, 
           NationalIDNumber,
           LoginID,
           FirstName,
           MiddleName,
           LastName,
           JobTitle,
           BirthDate,
           MaritalStatus,
           Gender 
      FROM HumanResources.Employee AS HRE --290
      JOIN Person.Person AS PP
        ON HRE.BusinessEntityID = PP.BusinessEntityID

    SELECT HRE.BusinessEntityID,
           PP.BusinessEntityID, 
           NationalIDNumber,
           LoginID,
           FirstName,
           MiddleName,
           LastName,
           JobTitle,
           BirthDate,
           MaritalStatus,
           Gender 
      FROM HumanResources.Employee AS HRE --290
     RIGHT JOIN Person.Person AS PP
        ON HRE.BusinessEntityID = PP.BusinessEntityID

    SELECT HRE.BusinessEntityID,
           PP.BusinessEntityID, 
           NationalIDNumber,
           LoginID,
           FirstName,
           MiddleName,
           LastName,
           JobTitle,
           BirthDate,
           MaritalStatus,
           Gender 
      FROM Person.Person AS PP
      LEFT JOIN HumanResources.Employee AS HRE --290
        ON HRE.BusinessEntityID = PP.BusinessEntityID