
    USE AdventureWorks2019
    GO

    /*
        REPLACE(Nome_da_coluna/Expressao, 'textoParaProcurar', 'textoQueSubstituirá) : retorno do tipo texto
        REPLICATE(Expressao_para_replicar/Nome_coluna, NumeroDeVezes) : retorno do tipo texto
        STUFF(Expressao/Nome_da_coluna, posicaoInicio, tamanho, substituicao)
    */

    SELECT 'DevDojo brabo demais!' AS [DevDojo],
           REPLACE('DevDojo brabo demais!', 'brabo', 'bolado') AS [REPLACE],
           REPLICATE('0', 10) AS [REPLICATE],
           STUFF('DevDojo brabo demais!', 9, 5, 'bolado') AS [STUFF]
    GO

    SELECT PP.BusinessEntityID,
           CONCAT( REPLICATE( '0',  LEN( (SELECT MAX(BusinessEntityID) FROM Person.Person) ) - LEN(PP.BusinessEntityID) ), PP.BusinessEntityID) AS CONCAT,
           LEN(PP.BusinessEntityID) AS TAMANHO,
           PersonType,
           Title,
           FirstName,
           MiddleName,
           LastName,
           PP.ModifiedDate,

           PEA.BusinessEntityID,
           EmailAddress,
           REPLACE(EmailAddress, '@', '\|/') as [REPLACE]

      FROM Person.Person AS PP
      JOIN Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
    GO

    SELECT SalesOrderDetailID,
           CarrierTrackingNumber,
           SSOD.ProductID,
           ProductNumber,
           PP.Name,
           REPLACE(PP.Name, '-', ' - ') AS [REPLACE1],
           PATINDEX('%[0-9A-z]-[0-9A-z]%', PP.Name) AS POSICAO, 
           
           CASE
              WHEN PATINDEX('%[0-9A-z]-[0-9A-z]%', PP.Name) > 0 THEN STUFF(PP.Name, (PATINDEX('%[0-9A-z]-[0-9A-z]%', PP.Name)+1), 1, ' - ')
              ELSE PP.Name
            END AS [STUFF_2],
           
           REPLACE(UnitPrice, '.', '/') AS BARRA,
           LineTotal,
           SSOD.ModifiedDate

      FROM Sales.SalesOrderDetail AS SSOD
      LEFT JOIN Production.Product AS PP
        ON SSOD.ProductID = PP.ProductID
     ORDER BY SalesOrderDetailID