
    USE AdventureWorks2019
    GO

    /*
        Média, Mediana e Moda
    */

    --Média
    SELECT Salario,
           AVG(Salario) OVER() AS Media
      FROM ( VALUES (1100),
                    (1200),
                    (1300),
                    (1400),
                    (1500),
                    (1600),
                    (1700),
                    (1800),
                    (1900)

      ) AS TblApoio (Salario)
    go


    --Mediana
    SELECT Pessoa, 
           Altura,
           PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Altura) OVER() AS Media
      
      FROM ( VALUES ('A', 1.79),
                    ('B', 1.72),
                    ('C', 1.63),
                    ('D', 1.82),
                    ('E', 1.65),
                    ('F', 1.75),
                    ('G', 1.80)

      ) AS TblApoio (Pessoa, Altura)
    GO
    
    SELECT Pessoa, 
           Altura,
           PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Altura) OVER() AS Media
      
      FROM ( VALUES ('A', 1.89),
                    ('B', 1.82),
                    ('C', 1.95),
                    ('D', 1.86),
                    ('E', 1.88),
                    ('F', 1.90)

      ) AS TblApoio (Pessoa, Altura)
    GO
    
    SELECT PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Salario) OVER(PARTITION BY Diretoria) AS Mediana,
           * 
      FROM DEVDOJO.dbo.TblFunc
    GO

    

    
    --Moda
    WITH CTE_MODA AS (
        
        SELECT FirstName,
               COUNT(*) AS Contagem
          FROM Person.Person
         WHERE FirstName not in ( 'Richard', 'Katherine' ) 
         GROUP BY FirstName 
    )

    SELECT * 
      FROM CTE_MODA
     WHERE Contagem = ( SELECT MAX(Contagem)
                          FROM CTE_MODA ) 
     --ORDER BY Contagem DESC