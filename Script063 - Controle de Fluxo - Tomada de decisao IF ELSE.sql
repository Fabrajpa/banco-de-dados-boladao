
    --SET LANGUAGE Brazilian
    --select @@LANGUAGE
    BEGIN
        DECLARE @Variavel INT = 35
        
        IF DATEPART(MONTH, GETDATE()) = 11 AND DAY(GETDATE()) IN (1,2,3,4,5)
            BEGIN

                SELECT * FROM Sales.SalesOrderDetail
                 WHERE SalesOrderID = @Variavel
            END

        ELSE IF DATENAME(WEEKDAY, DATEADD(DAY, -1, GETDATE()) ) IN ('Sábado', 'Domingo')

            BEGIN
                DECLARE @Variavel2 INT = @Variavel
                SELECT @Variavel2, * from Person.Person
                 WHERE BusinessEntityID = @Variavel2
            END

        ELSE
            BEGIN
                SELECT 'Deu ruim'
            END

    END
    GO


    BEGIN

        IF ( SELECT FirstName FROM Person.Person ) IN ('Brandon')
            PRINT 'Ok'

        ELSE
            PRINT 'Ops'
    
    END
    GO


    BEGIN

        DECLARE @Idade TINYINT = 18

        IF (@Idade < 20 AND DATEPART(WEEKDAY, GETDATE()) not IN (7, 1) )
            PRINT 'Você pode trabalhar'

        ELSE
            PRINT 'Chora bebê'

    END
    GO