        
    BEGIN
        SET NOCOUNT ON;

        DECLARE @DataMinima DATE,
                @Hoje DATE = TRY_CAST(GETDATE() AS DATE)

        DECLARE @TblMovimentacao TABLE (
            Matricula VARCHAR(9),
            DataMovimentacao DATE,
            Cargo VARCHAR(20),

            PRIMARY KEY (Matricula, DataMovimentacao)
        )

        DECLARE @TblCalendario TABLE (
            Datas DATE PRIMARY KEY
        )

    
        INSERT INTO @TblMovimentacao
        SELECT Matricula,   
               DataMovimentacao,
               Cargo
          FROM ( 
                 VALUES ('123456789', TRY_CAST('1991-04-12' AS DATE), 'Estagiário'),
                        ('123456789', TRY_CAST('1992-05-01' AS DATE), 'Técnico'),
                        ('123456789', TRY_CAST('1993-06-05' AS DATE), 'Analista Jr'),
                        ('123456789', TRY_CAST('1996-11-30' AS DATE), 'Analista Pl'),
                        ('123456789', TRY_CAST('1999-02-28' AS DATE), 'Analista Sr'),
                        ('123456789', TRY_CAST('2003-07-19' AS DATE), 'Especialista'),
                        ('123456789', TRY_CAST('2005-01-03' AS DATE), 'Arquiteto'),
                        ('123456789', TRY_CAST('2009-01-03' AS DATE), 'Engenheiro'),
                        ('123456789', TRY_CAST('2013-01-03' AS DATE), 'Coordenador'),
                        ('123456789', TRY_CAST('2018-01-03' AS DATE), 'Gerente'),
                        ('123456789', TRY_CAST('2022-12-22' AS DATE), 'Diretor')


               ) AS TabelaVirtual ( [Matricula], [DataMovimentacao], [Cargo] )
        
        SET @DataMinima = ( SELECT MIN(DataMovimentacao) FROM @TblMovimentacao )
        
        --SELECT @DataMinima

        WHILE @DataMinima < @Hoje
        BEGIN
            INSERT INTO @TblCalendario
            VALUES (@DataMinima)

            SET @DataMinima = DATEADD(DAY, 1, @DataMinima)
        END;
        

        --SELECT * FROM @TblCalendario

        WITH CtePreenchimentoParaBaixo AS (
        
            SELECT Datas,
                   Matricula,
                   COUNT(Matricula) OVER(ORDER BY Datas) AS MatriculaAux,
                   DataMovimentacao,
                   Cargo,
                   COUNT(Cargo) OVER(ORDER BY Datas) AS CargoAux
              FROM @TblCalendario
              LEFT JOIN @TblMovimentacao
                ON Datas = DataMovimentacao
        ),

        CtePreenchimentoParaBaixo2 AS (

            SELECT Datas,
                   Matricula,
                   MatriculaAux,
                   FIRST_VALUE(Matricula) OVER(PARTITION BY MatriculaAux ORDER BY Datas) AS MatriculaBolada,
                   DataMovimentacao,
                   Cargo,
                   CargoAux,
                   FIRST_VALUE(Cargo) OVER( PARTITION BY CargoAux ORDER BY Datas) CargoBolado
              FROM CtePreenchimentoParaBaixo
        )

        SELECT MatriculaBolada AS Matricula,
               Datas,
               CargoBolado AS Cargo 
          FROM CtePreenchimentoParaBaixo2
         --WHERE Datas = '2029-12-01' 
    
    END
    GO