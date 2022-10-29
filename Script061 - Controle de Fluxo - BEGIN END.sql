
    --https://learn.microsoft.com/pt-br/sql/t-sql/language-elements/begin-end-transact-sql?view=sql-server-ver15

    BEGIN

        DECLARE @Texto VARCHAR(100) = 'Alice'

        BEGIN
            BEGIN
                DECLARE @TextoInterno VARCHAR(100) = 'Texto Interno'
            END

        END

        SELECT @TextoInterno,
               * 
          FROM Person.Person
         WHERE FirstName = @Texto

   

    END
    GO
    
    BEGIN

        DECLARE @TextoInterno VARCHAR(100)

        SELECT @TextoInterno

    END