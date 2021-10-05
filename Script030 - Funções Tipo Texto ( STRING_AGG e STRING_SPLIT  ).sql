
    USE AdventureWorks2019
    GO

    /*
        STRING_AGG (Nome_da_coluna/expressao, separador) : retorno será um varchar
        STRING_SPLIT (Expressao, separador) : retorno será uma tabela de uma única coluna
    */

    SELECT 
           STRING_AGG( TRY_CAST(BusinessEntityID AS VARCHAR(MAX) ), '/') AS DevDojo,
           LastName
      FROM Person.Person
     GROUP BY LastName
    GO


    SELECT value AS DevDojo
      FROM STRING_SPLIT('William Suane grande mestre Jedi do DevDojo', ' ')


    SELECT 'william suane grande mestre jedi do devdojo' AS DevDojo