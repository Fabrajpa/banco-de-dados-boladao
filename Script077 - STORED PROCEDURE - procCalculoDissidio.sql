/*
    O diss�dio � uma forma que a empresa possui para equiparar o sal�rio dos colaboradores de acordo 
    com a m�dia salarial do mercado. Dessa forma, podemos considerar como um reajuste, 
    que pode ser concedido anualmente ou em outra periodicidade definida pela empresa
*/
    --select * from TblFuncAux
    --select * from TblHistoricoDissidio
    --select * from TblHistoricoSalario

    --EXEC dbo.procCalculoDissidio 0.12
    
    CREATE OR ALTER PROC dbo.procCalculoDissidio (
        @ValorDissidio FLOAT = 0.10
    )
    
    WITH ENCRYPTION
    AS

    BEGIN

        SET NOCOUNT ON;

        DECLARE @DtUltimoDissidio DATE,
                @Hoje DATE = DATEADD( MONTH, -12, GETDATE() )

        IF DB_NAME() = 'DEVDOJO'
        BEGIN

            IF OBJECT_ID('dbo.TblFuncAux') IS NULL
            BEGIN
                
                select *,
                       Salario AS SalarioDissidio 
                  INTO dbo.TblFuncAux
                  from TblFunc

                alter table dbo.TblFuncAux
                ADD CONSTRAINT PkBusinessEntityId PRIMARY KEY (BusinessEntityId);
            
            END
           

            IF OBJECT_ID('dbo.TblHistoricoDissidio') IS NULL
            BEGIN

                CREATE TABLE dbo.TblHistoricoDissidio (
                    DtDissidio  DATE PRIMARY KEY,
                    Porcentagem FLOAT
                )
            
            END


            IF OBJECT_ID('dbo.TblHistoricoSalario') IS NULL
            BEGIN

                CREATE TABLE dbo.TblHistoricoSalario (
                    Matricula     VARCHAR(8),
                    DtModificacao DATE,
                    Salario       FLOAT,
                    TpAlteracao   VARCHAR(20),

                    CONSTRAINT PkMatriculaDataMod PRIMARY KEY (Matricula, DtModificacao)
                )

                INSERT INTO dbo.TblHistoricoSalario
                SELECT Matricula,
                       TRY_CAST(DtAdmissao AS DATE) AS DtAdmissao,
                       Salario,
                       'Sal�rio Inicial' AS TpAlteracao
                  FROM dbo.TblFuncAux 

            END
        

            SELECT @DtUltimoDissidio = MAX(DtDissidio) 
              FROM dbo.TblHistoricoDissidio


            IF ( @DtUltimoDissidio IS NULL OR DATEDIFF(DAY, @DtUltimoDissidio, @Hoje) >= 365 )
            BEGIN

                UPDATE dbo.TblFuncAux
                   SET SalarioDissidio = SalarioDissidio + (SalarioDissidio * @ValorDissidio)
                 WHERE (DtDemissao <> '' OR DtDemissao IS NOT NULL)

                
                INSERT INTO dbo.TblHistoricoDissidio
                VALUES (@Hoje, @ValorDissidio)


                INSERT INTO dbo.TblHistoricoSalario
                SELECT Matricula,
                       @Hoje AS Hoje,
                       SalarioDissidio,
                       'Diss�dio'  AS TpAlteracao
                  FROM dbo.TblFuncAux

            END

            ELSE
            BEGIN
                SELECT 'Execu��o negada, diss�dio fora da �poca...' AS [Alerta]
            END

        END


        ELSE
        BEGIN
            --cuidado
            DROP PROC dbo.procCalculoDissidio
            select 'Base n�o permitida para a cria��o/execu��o desta procedure...' AS [Aten��o]
        END


    END
    GO