
    USE AdventureWorks2019
    GO

    /*
        EXCEPT    : retornará os valores da primeira tabela/consula que não estão na segunda consulta/tabela
        INTERSECT : retornará a interseção dos valores | o que for de comum
    */

    SELECT 'DevDojo' AS [Nome],
           'Java'    AS [Linguagem]
    INTERSECT
    SELECT 'Google' AS [Empresa],
           'Kotlin' AS [Tipo] 


    SELECT BusinessEntityID AS [COL2],
           FirstName 
      FROM Person.Person -- 19.972
    EXCEPT
    SELECT BusinessEntityID AS [COL1],
           '' as FirstName 
      FROM HumanResources.Employee -- 290
     ORDER BY [COL2]
    GO


    SELECT BusinessEntityID AS [COL2],
           '' as FirstName 
      FROM Person.Person -- 19.972
    INTERSECT
    SELECT BusinessEntityID AS [COL1],
           '' as FirstName 
      FROM HumanResources.Employee -- 290
     ORDER BY [COL2]

