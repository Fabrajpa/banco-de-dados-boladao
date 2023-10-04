
    --exec dbo.procTeste
    --EXEC dbo.procChamaProcedures 1
    CREATE OR ALTER PROC dbo.procChamaProcedures (
        @ArgumentoSaida INT OUTPUT
    )
    AS

    
    BEGIN
        DECLARE @SqlProc VARCHAR(MAX) = 'CREATE OR ALTER PROC dbo.procTeste '+CHAR(13)
            SET @SqlProc = @SqlProc+ 'BEGIN '+CHAR(13)
            SET @SqlProc = CONCAT(@SqlProc, 'SELECT ', '''', 'Procedure criada dentro de outra', '''', 'AS Nome', CHAR(13))
            SET @SqlProc = @SqlProc + 'END'+ CHAR(13)

        DECLARE @QtdExecucoes INT;

        IF OBJECT_ID('dbo.procTeste') is NULL
        BEGIN
            EXEC(@SqlProc)

        END

        select @ArgumentoSaida = @@ROWCOUNT

        EXEC dbo.procPrimeiraProcedure 'Aaron', 'Allen', '1,2,3,4, 5'
        select @ArgumentoSaida = (@ArgumentoSaida + @@ROWCOUNT)

        Exec dbo.procSegundaProcedure '', 'P'
        
        select @ArgumentoSaida = (@ArgumentoSaida + @@ROWCOUNT)
        
        SELECT @ArgumentoSaida

    END
    GO

