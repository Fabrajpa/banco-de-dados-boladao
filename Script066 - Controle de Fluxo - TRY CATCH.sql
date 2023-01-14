
    -- TRY_CATCH -> https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/try-catch-transact-sql?view=sql-server-ver16

    -- SEVERIDADE -> https://learn.microsoft.com/pt-br/sql/relational-databases/errors-events/database-engine-error-severities?view=sql-server-ver16

    --select * from sys.messages where message_id = 8134
    --select * from sys.syslanguages
    
    BEGIN TRY
        SELECT 1/0
    END TRY
    
    BEGIN CATCH
        SELECT 'Deu ruim nessa conversão, vamos mudar!!',
               ERROR_NUMBER() AS NumeroDoErro,
               ERROR_SEVERITY() AS Severidade,
               ERROR_STATE() AS ErroDeEstado,
               ERROR_PROCEDURE() ErroDeProcedureOuTrigger,
               ERROR_LINE() ErroLinha,
               ERROR_MESSAGE() MensagemDeErro
    END CATCH
    
    --SELECT TRY_CAST('ASDFASDG' AS INT)


    BEGIN
        DECLARE @Variavel INT,
                @Combinado VARCHAR(100) = '1168453'

        BEGIN TRY
            SET @Variavel = ( SELECT CAST(@Combinado AS INT) )
            SELECT @Variavel
        END TRY

        BEGIN CATCH
            SELECT 'Problemas para essa conversão, fique ligado!'

        END CATCH

        SELECT @Combinado

    END
    GO
    
    
    BEGIN
        DECLARE @Variavel INT,
                @Combinado VARCHAR(100) = '1168453sdfg'

        --BEGIN TRY
            SET @Variavel = ( SELECT CAST(@Combinado AS INT) )
            SELECT @Variavel
        --END TRY

        --BEGIN CATCH
            SELECT 'Problemas para essa conversão, fique ligado!'

        --END CATCH

        SELECT @Combinado

    END
    GO