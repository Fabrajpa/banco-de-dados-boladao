
    USE AdventureWorks2019
    GO

    --CONCAT() Quantos argumentos quiser
    --CONCAT_WS(Separador, Nome_da_coluna/Valor)

    --SELECT CONCAT('FABRICIO ','CHOUSA '                ,  TRY_CAST(165161 AS INT), 'SADFSADF ', 'FABRICIO 2' )

    --SELECT GETDATE() + 652 + ' SDF'

    SELECT BusinessEntityID,
           PersonType,
           NameStyle,
           Title,
           FirstName,
           MiddleName,
           LastName,
           Title+' '+FirstName+' '+MiddleName+' '+LastName AS NomeCompleto,
           CONCAT(Title, ' ', FirstName, ' ', MiddleName, ' ', LastName ) AS [CONCAT()],
           CONCAT_WS(' ', Title, FirstName, MiddleName, LastName, 'fabricio', 'devdojo', TRY_CAST(GETDATE() AS DATE) ) AS [CONCAT_WS()],
           Suffix,
           EmailPromotion,
           ModifiedDate
      FROM Person.Person
    