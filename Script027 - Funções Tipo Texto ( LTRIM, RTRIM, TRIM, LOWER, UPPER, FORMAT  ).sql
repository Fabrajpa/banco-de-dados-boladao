
    USE AdventureWorks2019
    GO

    /*
        LTRIM(Nome_da_coluna) : remover� espa�os a minha esquerda
        RTRIM(Nome_da_coluna) : remover� espa�os a minha direita
        TRIM(Nome_da_coluna) : remover� espa�os a minha esquerda e direita
        SPACE(Numeros de espaco) : acrescentar� a quantidade de espa�os
        LOWER(Nome_da_coluna) : retornar� tudo em min�sculo
        UPPER(Nome_da_coluna) : retornar� tudo em mai�sculo
    */

    SELECT '                                  DevDojo � o melhor                                           ' as DevDojo,
           LTRIM('                                  DevDojo � o melhor                                           ') AS [LTRIM],
           RTRIM('                                  DevDojo � o melhor                                           ') AS [RTRIM],
           LTRIM(RTRIM('                                  DevDojo � o melhor                                           ')) AS CON,
           TRIM('                                  DevDojo � o melhor                                           ') AS [TRIM],
           UPPER('                                  DevDojo � o melhor                                           ') AS [UPPER],
           LOWER('                                  DevDojo � o meLhOr                                           ') AS [LOWER],
           LOWER(1651) AS NUM
    GO

    SELECT CONCAT_WS(SPACE(1), 'Extra��o do Relat�rio:', TRY_CONVERT(VARCHAR(10), GETDATE(), 108), TRY_CONVERT(VARCHAR(10), GETDATE(), 103 ) ) AS [DT EXTRACAO],
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
