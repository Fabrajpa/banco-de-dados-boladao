/*
    SCHEMA
*/

    SELECT * FROM INFORMATION_SCHEMA.TABLES
     WHERE TABLE_SCHEMA = 'Sales'
    SELECT * FROM Person.Person

    SELECT * FROM [INFORMATION_SCHEMA].[COLUMNS]
     WHERE [TABLE_SCHEMA] = 'Person'
       AND [TABLE_NAME] = 'Person'

    SELECT * FROM [AdventureWorks2019].[Sales].[Store]
    -- dbo: schema padrão
    --SELECT * FROM [Nome_da_base].[Nome_do_Schema].[Nome_da_tabela]