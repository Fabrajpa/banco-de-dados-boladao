/*
     SELECT Ano,
           [1] Jan, 
           [2] Fev, 
           [3] Mar, 
           [4] Abr, 
           [5] Mai, 
           [6] Jun, 
           [7] Jul, 
           [8] Ago,  
           [9] [Set], 
           [10] [Out], 
           [11] Nov, 
           [12] Dez,
           [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] as QtdTotal
            
      FROM (
             SELECT Matricula,
                    YEAR(DtAdmissao) AS Ano,
                    MONTH(DtAdmissao) AS [Mes]
               FROM TblFunc
      ) AS TBL
     PIVOT ( COUNT(Matricula)
               FOR [Mes] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
     ) AS Pvt
    */

    BEGIN
        SET NOCOUNT ON;
        SET LANGUAGE Brazilian;

        DECLARE @QueryDinamica VARCHAR(MAX) = '',
                @ListaDeAnos   VARCHAR(MAX);
        
        DECLARE @TblAnos TABLE (
            AnoAdmissao INT PRIMARY KEY
        );

        INSERT INTO @TblAnos
        SELECT DISTINCT
               LEFT(DtAdmissao, 4) AnoAdmissao
          from TblFunc;

        
        SET @ListaDeAnos = ( SELECT STRING_AGG( TRY_CAST( CONCAT( '[', AnoAdmissao, ']') AS VARCHAR(MAX)), ', ') FROM @TblAnos );
        --SELECT @ListaDeAnos

        SET @QueryDinamica = 'WITH CteBase AS (

                                SELECT Matricula,
                                       LEFT(DtAdmissao, 4) AnoAdmissao,
                                       MONTH( TRY_CAST( DtAdmissao AS DATE) ) AS NumeroMes,
                                       DATENAME(MONTH, DtAdmissao) AS NomeDoMes
                                  FROM TblFunc
                            )

                            SELECT NomeDoMes, '+ CHAR(13)+
                                   @ListaDeAnos + CHAR(13)+'

                              FROM CteBase
                             PIVOT ( COUNT (Matricula)
                                       FOR [AnoAdmissao] IN ( ' +@ListaDeAnos + ')
                                   ) AS TblPivot 
                            order BY NumeroMes '
                             

        EXEC(@QueryDinamica)
    END
    GO