
    /*
        https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/variables-transact-sql?view=sql-server-ver16
        https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/declare-local-variable-transact-sql?view=sql-server-ver16
        https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/set-local-variable-transact-sql?view=sql-server-ver16
        https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/select-local-variable-transact-sql?view=sql-server-ver16
    */

    DECLARE @PrimeiraVariavel VARCHAR(200) = 'SQL Server no DevDojo',
            @Num1 INT = 3,
            @Hoje date = getdate(),
            @Hoje2 date = '',
            @TextoConcatenado VARCHAR(60),
            @Controle VARCHAR(60)
            

    DECLARE @VariavelTabela TABLE (
                IdTabela INT PRIMARY KEY,
                PrimeiroNome VARCHAR(50),
                NomeMeio VARCHAR(50),
                UltimoNome VARCHAR(50)
            )
    
    --set
    INSERT INTO @VariavelTabela
    --VALUES (1, 'Fabricio', 'Chousa', 'José'),
    --       (2, 'William', 'Suane', NULL) 
    SELECT BusinessEntityID,
           FirstName,
           MiddleName,
           LastName 
      FROM Person.Person

    DECLARE @Num2 INT = @Num1

        SET @TextoConcatenado = ( SELECT CONCAT_WS(' ', FirstName, MiddleName, LastName)
                                    FROM Person.Person 
                                   WHERE BusinessEntityID = @Num1 )
    

        SET @PrimeiraVariavel = 'Maratona Java no DevDojo'
        SET @PrimeiraVariavel = CONCAT(@PrimeiraVariavel, ' Bolado demais!')
       
        SET @Num1 = 2560
        SET @Controle = IIF(@Num1 > @Num2, 'é maior', 'não é maior')
        
        SET @Num1 = (@Num1 + 440)
        
        SET @Num1 = (@Num1 * 440)
        --SET @Num1 += 440
        --SET @Num1 -= 440
        --SET @Num1 /= 440

    

    --SELECT @PrimeiraVariavel,
    --       @Num1,
    --       @Hoje,
    --       @Hoje2,
    --       @Num2,
    --       @TextoConcatenado,
    --       @Controle
           
    ;with cte_novo as (
    SELECT IdTabela,
           PrimeiroNome,
           NomeMeio,
           UltimoNome,
           PhoneNumber
      --INTO #TblTemp
      FROM @VariavelTabela
      LEFT JOIN Person.PersonPhone
        ON IdTabela = BusinessEntityID
    )

    select * from cte_novo
 
    
    GO

    
   


    DECLARE @PrimeiraVariavel VARCHAR(200) = 'SQL Server no DevDojo',
            @Num1 INT = 3;


    WITH CTE_VARIAVEL AS (

        SELECT @Num1 AS Num
    )

    SELECT * FROM CTE_VARIAVEL
    GO


    DECLARE @Numeros VARCHAR(200) = '5, 6, 50, FGH',
            @Texto VARCHAR(200) = 'Ken, Roberto, Dylan'

    DECLARE @Tabela TABLE (
        Id INT IDENTITY,
        Texto VARCHAR(200)
    )

    INSERT INTO @Tabela
    SELECT TRIM(value)
      FROM string_split(@Texto, ',')

    --SELECT * FROM @Tabela
    
    --SELECT @Numeros, @Texto
    
    SELECT * FROM Person.Person
     WHERE FirstName IN ( SELECT Texto FROM @Tabela )
      
     --WHERE FirstName = @Texto
    GO

    
    DECLARE @Variavel VARCHAR(MAX) = 'SELECT * FROM Person.Person',
            @Num INT = 5000
        SET @Variavel = CONCAT(@Variavel, ' WHERE BusinessEntityID = ', @Num)

    EXEC(@Variavel)
    GO


    DECLARE @QUERY VARCHAR(MAX)
    
        SET @QUERY = 'CREATE OR ALTER VIEW dbo.VwTesteVariavel '+CHAR(13)
        SET @QUERY = CONCAT(@QUERY, ' AS ', CHAR(13))
        SET @QUERY = @QUERY + 'SELECT ''VIEW criada por uma variavel'' AS [Coluna]'+CHAR(13)

    EXEC (@QUERY)
    GO

    SELECT * FROM dbo.VwTesteVariavel
