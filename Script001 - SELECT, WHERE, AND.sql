/*
    SQL - STRUCTURED QUERY LANGUAGE - LINGUAGEM DE CONSULTA ESTRUTURADA
    T-SQL - TRANSACT SQL

    SELECT = SELECIONE (INSTRUCAO SELECT)
    * TUDO(TODAS_AS_COLUNAS)
    FROM = A PARTIR DE/VINDO DE
    Nome_da_tabela
    WHERE = ONDE
        AND = E
    AS - ALIASES = APELIDO
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