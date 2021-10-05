
    USE AdventureWorks2019
    GO

    /*
        LEN : retornará a quantidade de caracteres | tipo int
        DATALENGTH : retornará a quantidade de bytes | tipo int
        LEFT(Nome_da_coluna, tamanho)  : retorno nvarchar | varchar
        RIGHT(Nome_da_coluna, tamanho) : retorno nvarchar | varchar
    */

    SELECT LEN('O melhor canal do YouTube é o DevDojo, brabo demais!') AS [LEN],
           LEN('O melhor canal do YouTube é o DevDojo, brabo demais!')/2 AS [LEN/2],
           DATALENGTH('DEVDOJO   ') AS [DATALENGTH],
           'O melhor canal do YouTube é o DevDojo, brabo demais!' as DevDojo,
           LEFT('O melhor canal do YouTube é o DevDojo, brabo demais!', 10) AS [LEFT],
           LEFT('O melhor canal do YouTube é o DevDojo, brabo demais!', ( LEN('O melhor canal do YouTube é o DevDojo, brabo demais!')/2) ) AS MetadeEsquerda,
           RIGHT('O melhor canal do YouTube é o DevDojo, brabo demais!', ( LEN('O melhor canal do YouTube é o DevDojo, brabo demais!')/2) ) AS MetadeEsquerda,
           RIGHT('O melhor canal do YouTube é o DevDojo, brabo demais!', 10) AS [RIGHT],
           LEFT(561, 1),
           LEFT(GETDATE(), 20)
    GO

    SELECT BusinessEntityID,
           LEN(EmailAddress) AS [LEN],
           CHARINDEX('@', EmailAddress) AS [Posicao_@],
           LEFT(EmailAddress, CHARINDEX('@', EmailAddress)-1 ) AS UserName,
           EmailAddress,
           RIGHT(EmailAddress, ( LEN(EmailAddress) - CHARINDEX('@', EmailAddress) ) ) AS Dominio,
           SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress), 1 ) AS Extracao@
      FROM Person.EmailAddress
     ORDER BY BusinessEntityID