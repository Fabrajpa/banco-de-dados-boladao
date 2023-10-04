
    /*
        https://learn.microsoft.com/pt-br/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16

        Um procedimento armazenado no SQL Server � um grupo de uma ou mais instru��es do Transact-SQL.
            * Aceitar par�metros de entrada e retornar v�rios valores no formul�rio de par�metros de sa�da para o programa de chamada.
            * Conter instru��es de programa��o que executam opera��es no banco de dados. Estas incluem a chamada de outros procedimentos.
            * Retornar um valor de status a um programa de chamada para indicar �xito ou falha (e o motivo da falha).
    */

    
    USE DEVDOJO
    GO

    /*
    
    select OBJECT_NAME(object_id) as Nome,
           * 
      from sys.all_columns
    select * from sys.tables

    select DB_NAME()

    select * from sys.objects
    exec sp_help 'TblFunc'
    */

    --exec dbo.procPrimeiraProcedure 'Aaron', 'Allen', '1, 2, 3, 4'
    
    CREATE OR ALTER PROC dbo.procPrimeiraProcedure (
        @PrimeiroNome    VARCHAR(30),
        @SegundoNome     VARCHAR(30),
        @IndiceMatricula VARCHAR(MAX)
    )

    AS
    BEGIN

        SET NOCOUNT ON;


            SELECT PP.BusinessEntityId,
                   Title,
                   CONCAT_WS( ' ', FirstName, MiddleName, LastName ) AS FullName,
                   PEA.EmailAddress,
                   OA1.Address
              
              FROM AdventureWorks2019.Person.Person as PP
              LEFT JOIN AdventureWorks2019.Person.EmailAddress AS PEA
                ON PP.BusinessEntityID = PEA.BusinessEntityID
             
             OUTER APPLY (
                           SELECT CONCAT_WS( ' | ', AddressLine1, City, PostalCode ) as [Address]
                             FROM AdventureWorks2019.Person.Address AS PA
                            inner join AdventureWorks2019.Person.BusinessEntityAddress AS PBEA
                               on PA.AddressID = PBEA.AddressID
                            where PBEA.BusinessEntityID = PP.BusinessEntityID
                         ) AS OA1
            
             WHERE ( ( FirstName  = ( CASE @PrimeiroNome
                                         WHEN '' THEN FirstName
                                         ELSE @PrimeiroNome
                                       END )
               
                       and LastName = ( CASE @SegundoNome
                                           WHEN '' then LastName
                                           else @SegundoNome
                                         ENd )
                     )
                     OR PP.BusinessEntityID in ( select value
                                                   from string_split( ( CASE @IndiceMatricula
                                                                           WHEN '' THEN TRY_CAST( PP.BusinessEntityID AS VARCHAR(6))
                                                                           ELSE @IndiceMatricula
                                                                         END ), ',') )
                   )
             
             ORDER BY FullName

    END
    go