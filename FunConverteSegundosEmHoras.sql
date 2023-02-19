
    /*
        1 minutos -> 60 segundos
        1 hora -> 60 minutos -> 3600 segundos
        jogo futebol : 1:30 -> 90 minutos - > 5400 segundos
    */

    --select 5400 / 3600, (5400 / 60 ) % 60 

    CREATE OR ALTER FUNCTION dbo.FunConverteSegundosEmHoras (
        @Segundos INT
    )
    RETURNS VARCHAR(15)
    AS

    BEGIN

        DECLARE @Hora          VARCHAR(10),
                @Minuto        VARCHAR(03),
                @HoraFormatada VARCHAR(15)

        IF @Segundos > 0
        BEGIN
            SET @Hora = @Segundos / 3600
            
            SET @Hora = ( SELECT CASE
                                    WHEN @Hora < 10 THEN CONCAT('0', @Hora) 
                                    ELSE @Hora
                                  END )
            
            SET @Minuto = ( ( @Segundos / 60 ) % 60 )

            SET @Minuto = ( SELECT CASE
                                      WHEN @Minuto < 10 THEN CONCAT('0', @Minuto)
                                      ELSE @Minuto
                                    END )

            RETURN ( SELECT CONCAT(@Hora, ':', @Minuto) )

        END

        RETURN '00:00'
    END
    GO