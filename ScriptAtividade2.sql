/*
    --01/01/....  | 31/12/....
    
    --WITH CTE_ANOS AS (
--
    --    SELECT DISTINCT
    --           YEAR(Data) AS Ano
    --      FROM Ativ2.TblFeriadoNacional  
    --),
    
    WITH CTE_ANOMIN AS (

        --SELECT MIN(Ano) AS Ano FROM CTE_ANOS
        SELECT MIN(YEAR(Data)) AS Ano FROM Ativ2.TblFeriadoNacional
    
    ),
    
    CTE_ANOMAX AS (

        --SELECT MAX(Ano) AS Ano FROM CTE_ANOS
        SELECT MAX(YEAR(Data)) AS Ano FROM Ativ2.TblFeriadoNacional
    ),

    CTE_CALENDARIO AS (

        SELECT TRY_CAST( CONCAT( (SELECT Ano FROM CTE_ANOMIN), '0101' ) AS DATE) AS [Data]
         UNION ALL
        SELECT DATEADD(DAY, 1, [Data]) AS [Data]
          FROM CTE_CALENDARIO
         WHERE [Data] < TRY_CAST( CONCAT( (SELECT Ano FROM CTE_ANOMAX), '1231' ) AS DATE)
    )

    
    SELECT CTE.Data,
           Feriado 
      
      --DROP TABLE IF EXISTS Ativ2.TblCalendarioAux
      --INTO Ativ2.TblCalendarioAux
      
      FROM CTE_CALENDARIO AS CTE
      LEFT JOIN Ativ2.TblFeriadoNacional AS F
        ON CTE.[Data] = F.Data
    OPTION (MAXRECURSION 0)

    GO

    */    
        DROP TABLE IF EXISTS #TblAnoMin;
        DROP TABLE IF EXISTS #TblAnoMax;
        DROP TABLE IF EXISTS Ativ2.TblCalendarioAux;

        SELECT MIN(YEAR(Data)) AS Ano 
          INTO #TblAnoMin
          FROM Ativ2.TblFeriadoNacional;
        
        SELECT MAX(YEAR(Data)) AS Ano 
          INTO #TblAnoMax
          FROM Ativ2.TblFeriadoNacional;

    

    WITH CTE_CALENDARIO AS (

        SELECT TRY_CAST( CONCAT( (SELECT Ano FROM #TblAnoMin), '0101' ) AS DATE) AS [Data]
         UNION ALL
        SELECT DATEADD(DAY, 1, [Data]) AS [Data]
          FROM CTE_CALENDARIO
         WHERE [Data] < TRY_CAST( CONCAT( (SELECT Ano FROM #TblAnoMax), '1231' ) AS DATE)
    )

    
    SELECT CTE.Data,
           Feriado 
      
      --DROP TABLE IF EXISTS Ativ2.TblCalendarioAux
      INTO Ativ2.TblCalendarioAux
      
      FROM CTE_CALENDARIO AS CTE
      LEFT JOIN Ativ2.TblFeriadoNacional AS F
        ON CTE.[Data] = F.Data
    OPTION (MAXRECURSION 0)

    GO