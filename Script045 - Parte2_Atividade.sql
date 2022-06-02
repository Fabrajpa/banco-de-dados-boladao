
    -- > DIVIDIR PARA CONQUISTAR <
    -- PRIMEIRO: TRATAR PELOS ANOS
    
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

    ANOS AS (

        SELECT YEAR(GETDATE())-21 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-21)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-21) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-20 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-20)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-20) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-19 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-19)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-19) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-18 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-18)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-18) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-17 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-17)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-17) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-16 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-16)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-16) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-15 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-15)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-15) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-14 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-14)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-14) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-13 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-13)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-13) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-12 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-12)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-12) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-11 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-11)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-11) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-10 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-10)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-10) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-9 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-9)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-9) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-8 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-8)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-8) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-7 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-7)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-7) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-6 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-6)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-6) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-5 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-5)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-5) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-4 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-4)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-4) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-3 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-3)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-3) OR DtDemissao IS NULL )
        
         UNION
        
        SELECT YEAR(GETDATE())-2 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-2)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-2) OR DtDemissao IS NULL )
        
         UNION

        SELECT YEAR(GETDATE())-1 AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= (YEAR(GETDATE())-1)
           AND ( YEAR(DtDemissao) >= (YEAR(GETDATE())-1) OR DtDemissao IS NULL )
        
         UNION

        SELECT YEAR(GETDATE()) AS AnoAtivo,
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM BASE
         WHERE YEAR(DtAdmissao) <= YEAR(GETDATE())
           AND ( YEAR(DtDemissao) >= YEAR(GETDATE()) OR DtDemissao IS NULL )

    ),

    MESES AS (

        SELECT AnoAtivo,
               'Jan' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0101') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0101') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Fev' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0201') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0201') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Mar' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0301') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0301') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Abr' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0401') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0401') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Mai' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0501') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0501') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Jun' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0601') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0601') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Jul' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0701') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0701') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Ago' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0801') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0801') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Set' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0901') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '0901') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Out' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '1001') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '1001') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Nov' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '1101') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '1101') AS DATE) ) OR DtDemissao IS NULL )

         UNION ALL

        SELECT AnoAtivo,
               'Dez' AS Mes, 
               Matricula,
               Diretoria,
               DtAdmissao,
               DtDemissao 
          FROM ANOS
         WHERE DtAdmissao <= EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '1201') AS DATE) )
           AND ( DtDemissao > EOMONTH( TRY_CAST( CONCAT(AnoAtivo, '1201') AS DATE) ) OR DtDemissao IS NULL )
    ),

    CTE_PIVOT AS (

        SELECT AnoAtivo,
               Mes,
               Matricula,
               Diretoria 
          FROM MESES
    )
    
    SELECT Diretoria,
           AnoAtivo,
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

           ( Jan+Fev+Mar+Abr+Mai+Jun+Jul+Ago+[Set]+[Out]+Nov+Dez ) AS Total
      
      FROM CTE_PIVOT
     PIVOT ( COUNT(Matricula)
               FOR [Mes] IN ( Jan, Fev, Mar, Abr, Mai, Jun, Jul, Ago, [Set], [Out], Nov, Dez )
     ) AS Pvt
     ORDER BY AnoAtivo,
              Diretoria  
    GO

