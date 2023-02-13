    
    CREATE OR ALTER FUNCTION dbo.FunDatediff (
        @Data1 DATE,
        @Data2 DATE
    )
    RETURNS INT
    AS

    BEGIN
        IF ( @Data1 >= @Data2 OR @Data1 IS NULL OR @Data2 IS NULL OR @Data1 = '' OR @Data2 = '' )
        BEGIN
            RETURN 0
        END

        RETURN DATEDIFF(YEAR, @Data1, @Data2)

    END
    GO


    SELECT Data1,
           Data2,
           DATEDIFF(YEAR, Data1, Data2) AS ColDif,
           dbo.FunDatediff( Data1, Data2 ) AS FuncaoCriada
      FROM ( VALUES ('1991-04-12', '2023-02-12'),
                    ('2023-01-01', '1998-10-31'),
                    
                    (NULL, '2001-01-15'),
                    ('2015-09-01', NULL),
                    ('2015-09-01', '')
      
      ) AS TabelaVirtual(Data1, Data2)
    GO