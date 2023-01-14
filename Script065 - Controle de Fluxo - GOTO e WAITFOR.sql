
    --GOTO | WAITFOR
    BEGIN
        DECLARE @Contador INT = 1

        WHILE @Contador < 10
            BEGIN
                SELECT @Contador
                SET @Contador += 1

                IF @Contador = 4
                    GOTO Branch_One -- salto

                IF @Contador = 5
                    GOTO Branch_Two
            END
        

        Branch_One:
            SELECT 'Salto para a Filial 1'
            GOTO Branch_Three
        Branch_Two:
            SELECT 'Salto para a Filial 2'
        
        Branch_Three:
            SELECT 'Salto para a Filial 3'
            --GOTO Branch_One; --loop -> PERIGO
      

    END
    GO

    --WAITFOR
    -- 24h
    WAITFOR DELAY '00:00:15'
    WAITFOR TIME '22:00'
    SELECT * FROM ##TblGlobal



    SELECT BusinessEntityID,
           Title,
           FirstName,
           MiddleName,
           LastName,
           ModifiedDate
      INTO ##TblGlobal
      FROM Person.Person