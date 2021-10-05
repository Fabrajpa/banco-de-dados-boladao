
    USE AdventureWorks2019
    GO

    /*  OPERADORES
        UNION     : UNIÃO DOS VALORES DISTINTOS
        UNION ALL : UNIÃO COM TODOS OS VALORES (DUPLICADOS)
    */

    SELECT 'DevDojo' AS [Nome]
           --'Java'    AS [Linguagem]
    
     UNION
    
    SELECT 'Google' AS [Empresa],
           'Kotlin' AS [Tipo] 

     UNION

    SELECT 'SQL Server' AS [BD],
           'Microsoft'  AS [Fabricante]

    
    SELECT PersonType AS [COLUNA 4],
           FirstName  AS [COLUNA 5],
           MiddleName AS [COLUNA 6]
           --ModifiedDate 
      FROM Person.Person
     WHERE MiddleName IS NOT NULL
       AND FirstName = 'Aaron'

     UNION

    SELECT PersonType AS [COLUNA 1],
           FirstName  AS [COLUNA 2],
           MiddleName AS [COLUNA 3],
           ModifiedDate 
      FROM Person.Person
     WHERE MiddleName IS NOT NULL
       AND FirstName = 'Abigail'
     
     ORDER BY [COLUNA 6] DESC