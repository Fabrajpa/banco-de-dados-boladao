/*
    JOIN
*/

    SELECT PP.BusinessEntityID,
           Title,
           FirstName,
           MiddleName,
           LastName,
           EmailAddress,
           PEA.BusinessEntityID,
           PPP.PhoneNumber
            
      FROM Person.Person AS PP
     INNER JOIN Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
      JOIN Person.PersonPhone AS PPP
        ON PEA.BusinessEntityID = PPP.BusinessEntityID
    


    --SELECT * FROM Person.EmailAddress
    --SELECT * FROM Person.PersonPhone