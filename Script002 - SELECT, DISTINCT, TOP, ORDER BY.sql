/*
    SQL - STRUCTURED QUERY LANGUAGE - LINGUAGEM DE CONSULTA ESTRUTURADA
    T-SQL - TRANSACT SQL

    SELECT = SELECIONE (INSTRUCAO SELECT)
    * TUDO(TODAS_AS_COLUNAS)
    FROM = A PARTIR DE/VINDO DE
    Nome_da_tabela
    WHERE = ONDE (FILTRO)
        AND = E
    AS - ALIASES = APELIDO DA COLUNA/TABELA
*/  
    SELECT BusinessEntityID,
           PersonType,
           Title,
           FirstName,
           MiddleName,
           LastName,
           ModifiedDate --ultima coluna sem >virgula<

      FROM Person.Person  
     WHERE FirstName  = 'Ken'
       AND MiddleName = 'CHOUSA'



    SELECT --TOP 1000 -- TRARÁ OS REGISTROS INDICADOS NO NUMERO
           BusinessEntityID AS [ID PESSOA],
           [PersonType]     AS [TIPO PESSOA],
           Title            AS [TITULO],
           FirstName        AS [PRIMEIRO NOME],
           MiddleName       AS [NOME DO MEIO],
           LastName         AS [ULTIMO NOME]

      FROM Person.Person
     WHERE Title = 'Mr.'
     ORDER BY [PRIMEIRO NOME] ,  -- ORDENACAO DESC=DECRESCENTE
              [ULTIMO NOME] DESC  -- ORDENACAO ASCENDENTE


    SELECT 
           --DISTINCT -- DISTINCT = REMOVE DUPLICADOS
           --TOP 1000
           --BusinessEntityID AS [ID PESSOA],
           --[PersonType]     AS [TIPO PESSOA],
           --Title            AS [TITULO],
           FirstName,
           MiddleName,
           LastName

      FROM Person.Person
     WHERE Title = 'Mr.'
       AND MiddleName = 'M.'
     ORDER BY FirstName, 
              MiddleName
     