
    USE AdventureWorks2019
    GO

    /*
        LTRIM(Nome_da_coluna) : removerá espaços a minha esquerda
        RTRIM(Nome_da_coluna) : removerá espaços a minha direita
        TRIM(Nome_da_coluna) : removerá espaços a minha esquerda e direita
        SPACE(Numeros de espaco) : acrescentará a quantidade de espaços
        LOWER(Nome_da_coluna) : retornará tudo em minúsculo
        UPPER(Nome_da_coluna) : retornará tudo em maiúsculo
    */

    SELECT '                                  DevDojo é o melhor                                           ' as DevDojo,
           LTRIM('                                  DevDojo é o melhor                                           ') AS [LTRIM],
           RTRIM('                                  DevDojo é o melhor                                           ') AS [RTRIM],
           LTRIM(RTRIM('                                  DevDojo é o melhor                                           ')) AS CON,
           TRIM('                                  DevDojo é o melhor                                           ') AS [TRIM],
           UPPER('                                  DevDojo é o melhor                                           ') AS [UPPER],
           LOWER('                                  DevDojo É o meLhOr                                           ') AS [LOWER],
           LOWER(1651) AS NUM
    GO

    SELECT CONCAT_WS(SPACE(1), 'Extração do Relatório:', TRY_CONVERT(VARCHAR(10), GETDATE(), 108), TRY_CONVERT(VARCHAR(10), GETDATE(), 103 ) ) AS [DT EXTRACAO],
           PP.BusinessEntityID,
           Title,
           UPPER(FirstName) AS FirstName,
           LOWER(MiddleName) AS MiddleName,
           LastName,
           UPPER(EmailAddress) AS EmailAddress,
           FirstName + SPACE(30) + LastName AS COMPLETO,
           CONCAT(FirstName, SPACE(15), LastName) AS [CONCAT],
           CONCAT_WS(SPACE(15), FirstName, MiddleName, PP.ModifiedDate) AS [CONCAT_WS],
           FORMAT(GETDATE(), 'dd/MM/yyyy', 'pt-BR') AS [FORMAT],
           FORMAT(1749, '000000000000') AS D10,
           FORMAT(1749, 'd30') AS D10
      FROM Person.Person AS PP
      JOIN Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
