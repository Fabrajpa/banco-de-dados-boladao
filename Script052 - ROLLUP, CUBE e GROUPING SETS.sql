
    USE DEVDOJO
    GO

    --SELECT COUNT(*) FROM TblFunc WHERE DtAdmissao BETWEEN '20020101' AND '20021231'
    
    --ROLLUP
    SELECT YEAR(DtAdmissao) AS Ano,
           DATEPART( QUARTER, DtAdmissao) AS Trimestre,
           MONTH(DtAdmissao) AS Mes,
           COUNT(*) AS Contagem
      FROM TblFunc
     GROUP BY 
    ROLLUP ( YEAR(DtAdmissao),
             DATEPART( QUARTER, DtAdmissao),
             MONTH(DtAdmissao) )
    GO
    

    --CUBE
    SELECT YEAR(DtAdmissao) AS Ano,
           DATEPART( QUARTER, DtAdmissao) AS Trimestre,
           MONTH(DtAdmissao) AS Mes,
           COUNT(*) AS Contagem
      FROM TblFunc
     GROUP BY 
      CUBE ( YEAR(DtAdmissao),
             DATEPART( QUARTER, DtAdmissao),
             MONTH(DtAdmissao) )
    GO


    --GROUPING SETS
    SELECT YEAR(DtAdmissao) AS Ano,
           DATEPART( QUARTER, DtAdmissao) AS Trimestre,
           MONTH(DtAdmissao) AS Mes,
           COUNT(*) AS Contagem
      FROM TblFunc
     GROUP BY 
    GROUPING SETS ( YEAR(DtAdmissao),
                    DATEPART( QUARTER, DtAdmissao),
                    MONTH(DtAdmissao),
                    () --TOTAL
                    )
    GO