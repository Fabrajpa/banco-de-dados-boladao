
    --WHILE
    --https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/while-transact-sql?view=sql-server-ver16

    SET NOCOUNT ON

    DROP TABLE IF EXISTS #TempTbl
    GO
    
    DECLARE @Contador INT = 1

    CREATE TABLE #TempTbl (
        Id INT PRIMARY KEY
    )

    --condição para execução
    --WHILE @Contador <= 10000000 -- enquanto for verdadeira
    WHILE ( @Contador <= 1000 OR YEAR(GETDATE()) <> 2022 ) -- enquanto for verdadeira
        BEGIN
            INSERT INTO #TempTbl
            VALUES (@Contador)
            
            SET @Contador += 1 --atribuição +1
        END

    SELECT * FROM #TempTbl
    GO


    SET NOCOUNT ON
    GO
    
    DROP TABLE IF EXISTS #TblCalendario
    GO

    CREATE TABLE #TblCalendario (
        [Data] DATE PRIMARY KEY
    )
    
    DECLARE @Data DATE = '2000-01-01'


    WHILE @Data <= TRY_CAST( GETDATE() AS DATE)
        BEGIN
            INSERT INTO #TblCalendario
            VALUES (@Data)

            SET @Data = DATEADD(DAY, 1, @Data)
        END

    SELECT * FROM #TblCalendario
    GO


    DECLARE @Campo VARCHAR(200) = '           SQL      Server          no            DevDojo                 '
        SET @Campo = TRIM(@Campo)

    WHILE CHARINDEX('  ', @Campo) > 0
        BEGIN
            SET @Campo = REPLACE(@Campo, '  ', ' ')
        END

    SELECT @Campo
    GO
    

    ------- PERIGO

    
    SET NOCOUNT ON
    
    --WHILE

    DROP TABLE IF EXISTS #TempTbl
    GO
    
    DECLARE @Contador INT = 1

    CREATE TABLE #TempTbl (
        Id INT
    )

    --condição para execução
    --WHILE @Contador <= 10000000 -- enquanto for verdadeira
    WHILE @Contador <= 10  -- enquanto for verdadeira
        BEGIN
            INSERT INTO #TempTbl
            VALUES (@Contador)
            
            SET @Contador += 1 --atribuição +1
        END

    SELECT * FROM #TempTbl
    GO