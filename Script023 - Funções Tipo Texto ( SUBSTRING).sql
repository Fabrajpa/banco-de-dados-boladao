
    USE AdventureWorks2019
    GO

    /*
        SUBSTRING(Nome_da_coluna, Incio, tamanho) : retorno sempre sera texto, nchar, char, varchar, nvarchar, ntext, text
    */

    SELECT 'O melhor canal do YouTube é o DevDojo, brabo demais!' AS [Coluna],
           SUBSTRING('O melhor canal do YouTube é o DevDojo, brabo demais!', 1, 1) AS [SUBSTRING()]
    GO

    SELECT BusinessEntityID,
           --SUBSTRING(BusinessEntityID, 1, 2) AS SUBSTRING_INT,
           PersonType,
           Title,
           SUBSTRING(Title, 1, 1) AS TITLE_NULL,
           FirstName,
           MiddleName,
           LastName,
           ModifiedDate,
           SUBSTRING(ModifiedDate, 1, 4) AS ANO
      FROM Person.Person
    GO
