
    USE AdventureWorks2019
    GO

    /*
        CHARINDEX(expressãoAprocurar, Nome_da_coluna)
        PATINDEX('%padrao%', Nome_da_coluna)
    */

    SELECT CHARINDEX('Y', 'O melhor canal do Youtube é o DevDojo, brabo demais!') AS [CHARINDEX],
           PATINDEX('%é_o__e%', 'O melhor canal do Youtube é o DevDojo, brabo demais!') AS [PATINDEX]

    SELECT BusinessEntityID,
           EmailAddress,
           CHARINDEX('@', EmailAddress) AS [CHARINDEX()],
           SUBSTRING(EmailAddress, 1, CHARINDEX('@', EmailAddress)-1 ) as NomeUsuario,
           ModifiedDate,
           CHARINDEX('08', ModifiedDate) as pos
      FROM Person.EmailAddress