
    USE DEVDOJO
    GO

    --DROP FUNCTION IF EXISTS dbo.FunTabelaAdmissoes 
    CREATE OR ALTER FUNCTION dbo.FunTabelaAdmissoes (
        @Ano VARCHAR(20)
    )
    RETURNS @Tabela TABLE (
        Ano VARCHAR(15),
        Trimestre VARCHAR(30),
        Mes VARCHAR(30),
        Contagem INT
    )
    AS 

    BEGIN
        DECLARE @TabelaAno TABLE (
            Ano INT
        )

        INSERT INTO @TabelaAno
        SELECT value 
         FROM string_split(@Ano, ',')

        INSERT INTO @Tabela    
        SELECT ISNULL( TRY_CAST( YEAR(DtAdmissao) AS VARCHAR(20)), 'Totalzão') AS Ano,
               
               CASE 
                  WHEN YEAR(DtAdmissao) IS NULL THEN '---------->'
                  ELSE ISNULL( TRY_CAST( DATEPART( QUARTER, DtAdmissao) AS VARCHAR(20)), 'Total do Ano') 
                END AS Trimestre,
               
               CASE 
                  WHEN YEAR(DtAdmissao) IS NULL THEN '---------->'
                  ELSE ISNULL( TRY_CAST( MONTH(DtAdmissao) AS VARCHAR(20)), 'Total do Trimestre') 
                END AS Mes,
               
               COUNT(*) AS Contagem
          
          FROM TblFunc
         --WHERE YEAR(DtAdmissao) IN ( SELECT Ano from @TabelaAno )
         GROUP BY 
        ROLLUP ( YEAR(DtAdmissao),
                 DATEPART( QUARTER, DtAdmissao),
                 MONTH(DtAdmissao) )
    
        RETURN 

    END
    GO

    SELECT * FROM dbo.FunTabelaAdmissoes( '2019, 2020, 2022' )