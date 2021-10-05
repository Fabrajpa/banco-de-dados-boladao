
    USE AdventureWorks2019
    GO

    /*
        ISNULL(Nome_da_coluna/Valor, ValorParaSubstituir/Dado)
        COALESCE(Argumento[Nome_da_coluna]) : quantos argumentos desejar
    */

    --SELECT ISNULL(NULL, '')
    SELECT COALESCE(NULL, NULL, 'NULL_2', '1')

    SELECT BusinessEntityID,
           PersonType,
           NameStyle,
           Title,
           ISNULL(Title, '') AS Title ,
           FirstName,
           ISNULL(MiddleName, '') AS MiddleName,
           COALESCE(Title, MiddleName, Suffix, FirstName) AS [COALESCE()],
           COALESCE(Title, MiddleName, Suffix) AS [COALESCE()_NULO],
           ISNULL( COALESCE(Title, MiddleName, Suffix), 'COALESCE_NULO') AS [COALESCE()_NULO_2],
           LastName,
           ISNULL(Suffix, '') AS Suffix,
           ISNULL(AdditionalContactInfo, '') AS AddicionalConcactInfo,
           TRY_CONVERT(VARCHAR(10), ModifiedDate, 103) AS ModifiedDate
      FROM Person.Person
     --WHERE AdditionalContactInfo IS NOT NULL
    GO