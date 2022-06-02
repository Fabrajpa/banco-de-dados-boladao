
    WITH BASE AS (

        SELECT Matricula,
               Diretoria, 
               
               TRY_CAST(DtAdmissao AS DATE) AS DtAdmissao,
               
               CASE DtDemissao
                  WHEN '' THEN NULL
                  ELSE TRY_CAST(DtDemissao AS DATE) 
                END AS DtDemissao
          
          FROM TblFunc
    ),

    CTE_ADMISSAO AS (

        SELECT Matricula,
               Diretoria,
               MONTH(DtAdmissao) as [Mes],
               YEAR(DtAdmissao) AS [Ano]
          FROM BASE
    ),

    ADM AS (
        
        SELECT 'Admissão' AS Tipo,
               Diretoria,
               Ano,

               [1]  AS Jan, 
               [2]  AS Fev, 
               [3]  AS Mar, 
               [4]  AS Abr, 
               [5]  AS Mai, 
               [6]  AS Jun, 
               [7]  AS Jul, 
               [8]  AS Ago, 
               [9]  AS [Set], 
               [10] AS [Out], 
               [11] AS Nov, 
               [12] AS Dez,

               [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] AS Total

          FROM CTE_ADMISSAO
         PIVOT ( COUNT(Matricula)
                   FOR [Mes] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
         ) AS Pvt

    ),

    CTE_DEMISSAO AS (

        SELECT Matricula,
               Diretoria,
               MONTH(DtDemissao) as [Mes],
               YEAR(DtDemissao) AS [Ano]
          FROM BASE
         WHERE DtDemissao IS NOT NULL 
    ),

    DEM AS (
        
        SELECT 'Demissão' AS Tipo,
               Diretoria,
               Ano,

               [1]  AS Jan, 
               [2]  AS Fev, 
               [3]  AS Mar, 
               [4]  AS Abr, 
               [5]  AS Mai, 
               [6]  AS Jun, 
               [7]  AS Jul, 
               [8]  AS Ago, 
               [9]  AS [Set], 
               [10] AS [Out], 
               [11] AS Nov, 
               [12] AS Dez,

               [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] AS Total
           
          FROM CTE_DEMISSAO
         PIVOT ( COUNT(Matricula)
                   FOR [Mes] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
          ) AS Pvt
    ),

    TUDO AS (

        SELECT * FROM ADM
         UNION
        SELECT * FROM DEM
    )

    SELECT Tipo,
           Diretoria,
           Ano,
           Jan, 
           Fev, 
           Mar, 
           Abr, 
           Mai, 
           Jun, 
           Jul, 
           Ago, 
           [Set], 
           [Out], 
           Nov, 
           Dez,
           Total
      FROM TUDO
     ORDER BY Ano, 
              Tipo, 
              Diretoria
    GO