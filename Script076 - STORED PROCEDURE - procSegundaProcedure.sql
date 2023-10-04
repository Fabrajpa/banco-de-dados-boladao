
    USE DEVDOJO
    GO

    EXEC dbo.procSegundaProcedure '', 'P'
    GO
    
    
    CREATE OR ALTER PROC dbo.procSegundaProcedure (
        @Ano  VARCHAR(30),
        @Tipo VARCHAR(01)
    )
    WITH ENCRYPTION
    AS 

    BEGIN
        SET NOCOUNT ON;

        DECLARE @TabelaAno TABLE (
            Ano INT
        )

        IF @Ano = ''
        BEGIN
            INSERT INTO @TabelaAno
            SELECT YEAR(DtAdmissao) 
              FROM dbo.TblFunc
             GROUP BY YEAR(DtAdmissao) 
        END
        
        ELSE

            INSERT INTO @TabelaAno
            SELECT value 
              FROM string_split(@Ano, ',')

            IF @Tipo = 'N' -- normal
            BEGIN

                SELECT ISNULL( TRY_CAST( YEAR(DtAdmissao) AS VARCHAR(20)), 'Totalzão') AS Ano,

                       CASE 
                          WHEN YEAR(DtAdmissao) IS NULL THEN '---------->'
                          ELSE ISNULL( TRY_CAST( DATEPART( QUARTER, DtAdmissao) AS VARCHAR(20)), 'Total do Ano') 
                        END AS Trimestre,

                       CASE 
                          WHEN YEAR(DtAdmissao) IS NULL THEN '---------->'
                          ELSE ISNULL( TRY_CAST( MONTH(DtAdmissao) AS VARCHAR(20)), 'Total do Trimestre') 
                        END AS Mes,

                       COUNT(*) AS Quantidade

                  FROM dbo.TblFunc
                 WHERE YEAR(DtAdmissao) IN ( SELECT Ano from @TabelaAno )
                 GROUP BY 
                ROLLUP ( YEAR(DtAdmissao),
                         DATEPART( QUARTER, DtAdmissao),
                         MONTH(DtAdmissao) )
            END
        
            ELSE IF @Tipo = 'P'
            BEGIN

                SELECT Ano,
                       [1]  Janeiro, 
                       [2]  Feveveiro, 
                       [3]  Marco, 
                       [1] + [2] + [3] AS Trimestre1,
                       [4]  Abril, 
                       [5]  Maio, 
                       [6]  Junho, 
                       [4]+[5]+[6] AS Trimestre2,
                       [7]  Julho, 
                       [8]  Agosto,  
                       [9]  Setembro, 
                       [7]+[8]+[9] AS Trimestre3,
                       [10] Outubro, 
                       [11] Novembro, 
                       [12] Dezembro,
                       [10]+[11]+[12] AS Trimestre4,
                       [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] as Total

                  FROM (
                         SELECT Matricula,
                                YEAR(DtAdmissao) AS Ano,
                                MONTH(DtAdmissao) AS [Mes]
                           FROM dbo.TblFunc
                       ) AS TBL
                 PIVOT ( COUNT (Matricula)
                           FOR [Mes] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
                       ) AS Pvt 

            END

            ELSE
            BEGIN
                SELECT 'Primeiro argumento: Ano | Segundo argumento: P-> Pivot ou N-> Normal...' AS [Atenção]
            END

    

    END
    GO
