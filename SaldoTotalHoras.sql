
    --select * from  ViewHorasTrabalhadas
    CREATE OR ALTER VIEW ViewHorasTrabalhadas
    AS
    --BEGIN
        --SET NOCOUNT ON;
        --SET LANGUAGE Brazilian;
        
        WITH CteMarcacaoFuncionario AS (
        
            SELECT Matricula,
                   TRY_CAST(DataMarcacao AS DATE) AS DataMarcacao,

                   TRY_CAST( REPLACE( ( CASE
                                           WHEN LEN(HoraMarcacao) = 1 THEN CONCAT('0', HoraMarcacao, '.00')
                                           WHEN LEN(HoraMarcacao) = 2 THEN CONCAT(HoraMarcacao, '.00')
                                           WHEN LEN(HoraMarcacao) = 3 THEN CONCAT('0', HoraMarcacao, '0')

                                           WHEN LEN(HoraMarcacao) = 4 THEN ( CASE
                                                                                WHEN CHARINDEX('.', HoraMarcacao) = 2 THEN CONCAT('0', HoraMarcacao)
                                                                                ELSE CONCAT(HoraMarcacao, '0')
                                                                              END )
                                           ELSE HoraMarcacao
                                         END ) , '.', ':') AS TIME) AS HoraMarcacao,

                   TipoMarcacao 

              FROM MarcacaoFuncionario
              --WHERE LEN(HoraMarcacao) < 3
        ),

        CteMarcacaoFuncionario2 AS (

            SELECT Matricula,
                   DataMarcacao,

                   [1E], 
                   [1S], 
                   CASE
                      WHEN [1E] IS NULL OR [1S] IS NULL THEN 0
                      ELSE DATEDIFF( SECOND, [1E], [1S] ) 
                    END AS Diff1M,
                   --[1E]+[1S] AS Tempo1,

                   [2E], 
                   [2S], 
                   CASE
                      WHEN [2E] IS NULL OR [2S] IS NULL THEN 0
                      ELSE DATEDIFF( SECOND, [2E], [2S] ) 
                    END AS Diff2M, 

                   [3E], 
                   [3S], 
                   CASE
                      WHEN [3E] IS NULL OR [3S] IS NULL THEN 0
                      ELSE DATEDIFF( SECOND, [3E], [3S] ) 
                    END AS Diff3M,

                   [4E], 
                   [4S],
                   CASE
                      WHEN [4E] IS NULL OR [4S] IS NULL THEN 0
                      ELSE DATEDIFF( SECOND, [4E], [4S] ) 
                    END AS Diff4M

              FROM CteMarcacaoFuncionario
             PIVOT ( MAX (HoraMarcacao)
                     FOR TipoMarcacao IN ( [1E], [1S], [2E], [2S], [3E], [3S], [4E], [4S] )
                   ) AS TblPivot
        ),

        CteMarcacaoFuncionario3 AS (

            SELECT Matricula,
                   DataMarcacao,

                   [1E], 
                   [1S], 

                   [2E], 
                   [2S], 

                   [3E], 
                   [3S], 

                   [4E], 
                   [4S],
                   ( Diff1M+Diff2M+Diff3M+Diff4M ) AS SegundosTrabalhados

              FROM CteMarcacaoFuncionario2
        )

            SELECT --Matricula,
                   YEAR(DataMarcacao) AS AnoMarcacao,
                   --MONTH(DataMarcacao) AS NumeroMes,
                   --DataMarcacao,
                   DATENAME( MONTH, DataMarcacao) AS NomeDoMes,
                   --SUM(SegundosTrabalhados) AS SegundosTrabalhados,
                   dbo.FunConverteSegundosEmHoras( SUM(SegundosTrabalhados) ) AS HoraFormatada

              FROM CteMarcacaoFuncionario3
             group by --Matricula,
                      YEAR(DataMarcacao),
                      MONTH(DataMarcacao),
                      DATENAME( MONTH, DataMarcacao) 
             --ORDER BY YEAR(DataMarcacao),
             --         MONTH(DataMarcacao)  


    --END
    GO