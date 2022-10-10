
    --DROP VIEW Ativ2.VW_CALENDARIO
    CREATE OR ALTER VIEW Ativ2.VwCalendario
    AS
    
        SELECT Data,
               DATEPART(WEEKDAY, Data) AS DiaSemana, 
                
               CASE DATEPART(WEEKDAY, Data) 
                  WHEN 1 THEN 'domingo'
                  WHEN 2 THEN 'segunda-feira'
                  WHEN 3 THEN 'terça-feira'
                  WHEN 4 THEN 'quarta-feira'
                  WHEN 5 THEN 'quinta-feira'
                  WHEN 6 THEN 'sexta-feira'
                  WHEN 7 THEN 'sábado'
                END AS NomeSemana, 

               DATEPART(QUARTER, Data) AS Trimestre,
               MONTH(Data) AS Mes,
               DATENAME(MONTH, Data) AS NomeMes,
               
               YEAR(Data) AS Ano,
                
               CASE 
                  WHEN Feriado IS NULL AND DATEPART(WEEKDAY, Data) IN (1, 7) THEN 'Final de semana'
                  ELSE ISNULL(Feriado, '')
                END AS Feriado
            
          FROM Ativ2.TblCalendarioAux

    GO