
    USE AdventureWorks2019
    GO

    --PRINT 'Java'+CHAR(13)+'DevDojo'
/*
    SELECT * FROM Person.Person
    SELECT * FROM Person.EmailAddress
    SELECT * FROM Person.PersonPhone
    SELECT * FROM Person.PhoneNumberType
    SELECT * FROM Person.BusinessEntityAddress
    SELECT * FROM Person.Address
    SELECT * FROM Person.AddressType
*/

    SELECT ISNULL(Title, '') AS [Titulo],
           CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [Nome Completo],
           EmailAddress AS [Email],
           PhoneNumber  AS [Número de Contato],
           PPNT.Name AS [Tipo Contato] ,
           --AddressLine1,
           --AddressLine2
           CASE
              WHEN AddressLine2 IS NOT NULL THEN ISNULL(AddressLine1, '')+CHAR(13)+AddressLine2
              ELSE ISNULL(AddressLine1, '')
            END AS [Endereço],
           
           ISNULL(City, '') AS [Cidade],
           ISNULL(PAT.Name, '') AS [Tipo Endereço]

      FROM Person.Person AS PP
      LEFT JOIN Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
      LEFT JOIN Person.PersonPhone AS PPP
        ON PP.BusinessEntityID = PPP.BusinessEntityID
      LEFT JOIN Person.PhoneNumberType AS PPNT
        ON PPP.PhoneNumberTypeID = PPNT.PhoneNumberTypeID
      LEFT JOIN Person.BusinessEntityAddress AS PBEA
        ON PP.BusinessEntityID = PBEA.BusinessEntityID
      LEFT JOIN Person.Address AS PA
        ON PBEA.AddressID = PA.AddressID
      LEFT JOIN Person.AddressType AS PAT
        ON PBEA.AddressTypeID = PAT.AddressTypeID
     ORDER BY [Nome Completo]