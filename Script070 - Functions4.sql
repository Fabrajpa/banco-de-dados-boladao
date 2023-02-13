
    USE DEVDOJO
    GO

    --DROP FUNCTION IF EXISTS dbo.FunTabelaAdmissoesFlag
    CREATE OR ALTER FUNCTION dbo.FunTabelaAdmissoesFlag (
        @Ano  VARCHAR(30),
        @Tipo VARCHAR(01)
    )
    RETURNS @Tabela TABLE (
        Ano        VARCHAR(15),
        Trimestre  VARCHAR(30),
        Mes        VARCHAR(30),
        Quantidade INT,

        Janeiro    INT, 
        Feveveiro  INT, 
        Marco      INT, 
        Trimestre1 INT,
        Abril      INT, 
        Maio       INT, 
        Junho      INT, 
        Trimestre2 INT,
        Julho      INT, 
        Agosto     INT,  
        Setembro   INT, 
        Trimestre3 INT,
        Outubro    INT, 
        Novembro   INT, 
        Dezembro   INT,
        Trimestre4 INT,
        Total      INT
    )
    AS 

    BEGIN
        DECLARE @TabelaAno TABLE (
            Ano INT
        )

        IF @Ano = ''
        BEGIN
            INSERT INTO @TabelaAno
            SELECT DISTINCT YEAR(DtAdmissao) FROM TblFunc
        END
        
        ELSE

            INSERT INTO @TabelaAno
            SELECT value 
              FROM string_split(@Ano, ',')

            IF @Tipo = 'N' -- normal
            BEGIN
                INSERT INTO @Tabela (Ano, Trimestre, Mes, Quantidade)  
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

                  FROM TblFunc
                 WHERE YEAR(DtAdmissao) IN ( SELECT Ano from @TabelaAno )
                 GROUP BY 
                ROLLUP ( YEAR(DtAdmissao),
                         DATEPART( QUARTER, DtAdmissao),
                         MONTH(DtAdmissao) )
            END
        
            ELSE IF @Tipo = 'P'
                BEGIN

                INSERT INTO @Tabela ( Ano, Janeiro, Feveveiro, Marco, Trimestre1, Abril, Maio, Junho, 
                                      Trimestre2, Julho, Agosto, Setembro, Trimestre3, Outubro, Novembro, Dezembro, Trimestre4, Total )
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
                           FROM TblFunc
                       ) AS TBL
                 PIVOT ( COUNT(Matricula)
                           FOR [Mes] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
                       ) AS Pvt 

                RETURN

                END

    
        RETURN 

    END
    GO



    SELECT Ano, Janeiro, Feveveiro, Marco, Trimestre1, Abril, Maio, Junho, 
                                  Trimestre2, Julho, Agosto, Setembro, Trimestre3, Outubro, Novembro, Dezembro, Trimestre4, Total
      FROM dbo.FunTabelaAdmissoesFlag( '', 'P' )
    

    SELECT Ano, Trimestre, Mes, Quantidade 
      FROM dbo.FunTabelaAdmissoesFlag( '', 'N' )