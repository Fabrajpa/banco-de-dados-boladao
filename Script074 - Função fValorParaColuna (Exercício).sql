
    CREATE OR ALTER FUNCTION dbo.fValorParaColuna (
        @argumento VARCHAR(30)
    )
    RETURNS @TabelaPivot TABLE (
        [1]  VARCHAR(1), 
        [2]  VARCHAR(1), 
        [3]  VARCHAR(1),
        [4]  VARCHAR(1), 
        [5]  VARCHAR(1), 
        [6]  VARCHAR(1), 
        [7]  VARCHAR(1), 
        [8]  VARCHAR(1), 
        [9]  VARCHAR(1), 
        [10] VARCHAR(1), 
        [11] VARCHAR(1), 
        [12] VARCHAR(1)
    
    )
    AS

    BEGIN

        WITH CteOrdenacao AS (

            SELECT 1 AS Num,
                   value AS Valor
              FROM string_split(@argumento, ',' )
        ),

        CtePivot as (

            SELECT ROW_NUMBER() OVER(ORDER BY Num) AS Ordenacao,
                   Valor 
              FROM CteOrdenacao

        )

        INSERT INTO @TabelaPivot
        SELECT [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
          FROM CtePivot
         PIVOT ( MAX (Valor) 
                 FOR [Ordenacao] IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] )
            
               ) AS TblPivot

        RETURN

    END
    GO



    WITH CteTabela AS (

        SELECT Id, Matricula, CodProfessor, CodTurma, IdAtividade, Atividade, Cronograma
          FROM (
                 VALUES ( 1,  301, 201, 101, '01', 'Atividade AA', 'x,x,,,,,,,,,,'   ),
                        ( 2,  301, 201, 101, '02', 'Atividade AB', ',,x,x,x,,,,,,,'   ),
                        ( 3,  301, 201, 101, '03', 'Atividade AC', ',,,,,x,x,x,x,,,'   ),
                        ( 4,  301, 201, 101, '04', 'Atividade AD', ',,,,,,,,,x,x,x'   ),
                        ( 5,  302, 202, 102, '01', 'Atividade 1A', 'x,x,,,,,,,,,,'   ),
                        ( 6,  302, 202, 102, '02', 'Atividade 1B', ',,x,x,x,x,,,,,,'   ),
                        ( 7,  302, 202, 102, '03', 'Atividade 1C', ',,,,,,x,x,x,x,x,x'   ),
                        ( 8,  302, 202, 102, '04', 'Atividade 1D', 'x,x,x,x,,,,,,,,'   ),
                        ( 9,  303, 203, 103, '01', 'Atividade YQ', ',,x,,x,,x,,,x,,x'   ),
                        ( 10, 303, 203, 103, '01', 'Atividade YW', ',,,,x,x,x,x,x,x,x,x'  ),
                        ( 11, 303, 203, 103, '01', 'Atividade YZ', ',,x,,x,,x,,,x,,x'  )

               ) AS TblVirtual ( [Id], [Matricula], [CodProfessor], [CodTurma], [IdAtividade], [Atividade], [Cronograma] )

    )

    SELECT Id, 
           Matricula, 
           CodProfessor, 
           CodTurma, 
           IdAtividade, 
           Atividade, 
           Cronograma,

           [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] 

      FROM CteTabela
     CROSS APPLY dbo.fValorParaColuna(Cronograma) 
    GO