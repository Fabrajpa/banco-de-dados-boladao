
    USE AdventureWorks2019
    GO

    /*
        DATEPART(Parte_da_data/hora, Data/Nome_da_coluna) : retorno será do tipo inteiro
        DATENAME(Parte_da_data/hora, Data/Nome_da_coluna) : retorno do tipo texto (nvarchar)
        ISDATE(Nome_da_coluna) : retorno 1 = TRUE | 0 = FALSE
    */

    SELECT ISDATE('GETDATE()') AS [ISDATE()],
           ISDATE('2010F1231') AS [ISDATE()],
           GETDATE() AS [GETDATE()],
           SYSDATETIME() AS [SYSDATETIME()],
           DATEPART(HOUR, GETDATE()) AS HORA,
           DATEPART(MINUTE, GETDATE()) AS MINUTO,
           DATEPART(YEAR, GETDATE()) AS ANO,

           YEAR(GETDATE()) AS ANOSOZINHO,
           MONTH(GETDATE()) AS MESSOZINHO,
           DAY(GETDATE()) AS DIASOZINHO,

           DATEPART(MICROSECOND, SYSDATETIME()) AS [MICROSECOND],
           DATEPART(NANOSECOND, SYSDATETIME()) AS NANO,

           DATENAME(MONTH, GETDATE()) AS NOME_DO_MES,
           DATENAME(DAY, GETDATE()) AS DIA_DO_MES
    GO

    SELECT BusinessEntityID,
           Title,
           FirstName,
           MiddleName,
           LastName,
           TRY_CAST(ModifiedDate AS DATE) AS ModifiedDate,
           DATEPART(YEAR, ModifiedDate) AS ANO,
           ISDATE(ModifiedDate) AS VERIFICADATA,
           TRY_CONVERT( VARCHAR(10), ModifiedDate, 103) AS data_formatada,
           ISDATE( TRY_CONVERT( VARCHAR(10), ModifiedDate, 103 ) ) AS VERIFICA2
      FROM Person.Person
     WHERE DATEPART(YEAR, ModifiedDate) = 2008
       AND DATENAME(MONTH, ModifiedDate) = 'Dezembro'
    GO


