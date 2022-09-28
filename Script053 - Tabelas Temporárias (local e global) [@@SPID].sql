
    USE DEVDOJO
    GO

    --tabela temporária local
    SELECT YEAR(DtAdmissao) AS Ano,
           DATEPART( QUARTER, DtAdmissao) AS Trimestre,
           MONTH(DtAdmissao) AS Mes,
           COUNT(*) AS Contagem

      INTO #TBL_AUX2     
      FROM TblFunc
     GROUP BY 
    ROLLUP ( YEAR(DtAdmissao),
             DATEPART( QUARTER, DtAdmissao),
             MONTH(DtAdmissao) )
    
    GO

    SELECT * FROM #TBL_AUX2

    DROP TABLE IF EXISTS #TblTemporaria
    GO

    CREATE TABLE #TblTemporaria (
        [NOME] VARCHAR(100),
        [DATA] DATE
    )
    GO

    INSERT INTO #TblTemporaria
    VALUES ( 'Java',  '20000101'),
           ('SQL Server', '20210101') 
    GO

    -- TABELAS TEMPORARIAS SÃO ARMAZENADAS tempdb, SUA EXECUCAO FICA RESTRITA A SESSAO LOCAL
    SELECT * FROM #TblTemporaria
    GO

    TRUNCATE TABLE #TblTemporaria
    GO

    SELECT @@SPID
    go


    --tabela temporária global
    SELECT YEAR(DtAdmissao) AS Ano,
           DATEPART( QUARTER, DtAdmissao) AS Trimestre,
           MONTH(DtAdmissao) AS Mes,
           COUNT(*) AS Contagem

      INTO ##TblTemporariaGlobal1     
      FROM TblFunc
     GROUP BY 
    ROLLUP ( YEAR(DtAdmissao),
             DATEPART( QUARTER, DtAdmissao),
             MONTH(DtAdmissao) )
    
    GO

    SELECT * FROM ##TblTemporariaGlobal1

    DROP TABLE IF EXISTS ##TblTemporaria2
    GO

    CREATE TABLE ##TblTemporaria2 (
        [NOME] VARCHAR(100),
        [DATA] DATE
    )
    GO

    INSERT INTO ##TblTemporaria2
    VALUES ( 'Spring Boot',  '20200101'),
           ('SQL Server', '20210131') 
    GO

    -- TABELAS TEMPORARIAS SÃO ARMAZENADAS tempdb, SUA EXECUCAO FICA RESTRITA A SESSAO LOCAL
    SELECT * FROM ##TblTemporaria2
    GO

    TRUNCATE TABLE ##TblTemporaria2
    GO

    SELECT @@SPID