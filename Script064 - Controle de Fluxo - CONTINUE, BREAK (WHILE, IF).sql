
    DECLARE @Contador INT = 0

    WHILE @Contador <= 500
        BEGIN
            IF @Contador = 300
                BREAK -- INTERROMPE
            ELSE
                BEGIN
                    SET @Contador += 1
                    PRINT CONCAT( 'Loop While, valor do contador: ', @Contador)
                    CONTINUE -- continua a instru��o

                END

        END
    GO