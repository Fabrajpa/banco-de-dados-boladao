
    --DROP FUNCTION IF EXISTS dbo.FunDataExtenso 
    CREATE OR ALTER FUNCTION dbo.FunDataExtenso ( 
        @Data VARCHAR(20) 
    )
    RETURNS VARCHAR(100)
    AS
    BEGIN
        IF ISDATE(@Data) = 1
        BEGIN
            DECLARE @NomeMes VARCHAR(12) = ( SELECT CASE MONTH(@Data)
                                                       WHEN 1 THEN 'Janeiro'
                                                       WHEN 2 THEN 'Fevereiro'
                                                       WHEN 3 THEN 'Março'
                                                       WHEN 4 THEN 'Abril'
                                                       WHEN 5 THEN 'Maio'
                                                       WHEN 6 THEN 'Junho'
                                                       WHEN 7 THEN 'Julho'
                                                       WHEN 8 THEN 'Agosto'
                                                       WHEN 9 THEN 'Setembro'
                                                       WHEN 10 THEN 'Outubro'
                                                       WHEN 11 THEN 'Novembro'
                                                       WHEN 12 THEN 'Dezembro'
                                                    END )

            RETURN ( SELECT CONCAT('Rio de janeiro, ', DAY(@Data), ' de ', @NomeMes, ' de ', YEAR(@Data), '.' ) )
        END

        ELSE
        BEGIN
            RETURN 'Insira um valor no formato de data'
        END

        RETURN ''
    
    END
    GO
    

    SELECT dbo.FunDataExtenso( GETDATE() ) AS Coluna
