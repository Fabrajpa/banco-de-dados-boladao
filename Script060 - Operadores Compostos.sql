
    --https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/compound-operators-transact-sql?view=sql-server-ver16

    DECLARE @Variavel VARCHAR(100) = 'SQL Server',
            @Num INT = 100
       
        --SET @Variavel = CONCAT(@Variavel, ' Bolad�o')
        --SET @Variavel = @Variavel+ 651
        SET @Variavel += ' Bolad�o'
        --SET @Num += 200
        SET @Num -= 2
        SET @Num *= 200
        
        SET @Num /= 5
        
        SET @Num = (@Num / 5)

        SET @Variavel = CONCAT(@Variavel, ' Maratona Java 286')

    
    SELECT @Variavel,
           @Num 