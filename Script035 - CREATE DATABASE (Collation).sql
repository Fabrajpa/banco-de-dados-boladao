
    --DDL
    CREATE DATABASE dbCartoon
    GO

    ALTER DATABASE dbCartoon
    COLLATE Latin1_General_BIN2
    GO

    --fun��o do sistema
    SELECT DATABASEPROPERTYEX('AdventureWorks2019', 'Collation') AS [Collate AdventureWorks2019],
           DATABASEPROPERTYEX('dbCartoon', 'Collation') AS [Collation dbCartoon]

    -- views (vis�o) do sistema
    SELECT * FROM sys.databases

    SELECT * FROM AdventureWorks2019.Person.Person
     WHERE FirstName = 'KEN'