
    USE AdventureWorks2019
    GO

    -- UPDATE e DELETE com JOINs
    DROP TABLE IF EXISTS PessoaAux
    GO
    
    SELECT * INTO PessoaAux
      FROM Person.Person
    GO

    SELECT * INTO FuncionarioAux
      FROM HumanResources.Employee
    GO
    
    SELECT * FROM dbo.FuncionarioAux
    
    SELECT * FROM Person.Person
    
    SELECT * FROM dbo.PessoaAux
     order by BusinessEntityID

    -- PADRAO ANSI - OUTROS SGBDs suportam
    UPDATE PessoaAux
       SET Title = 'Ativos'
     WHERE BusinessEntityID IN ( SELECT BusinessEntityID FROM dbo.FuncionarioAux )
    go


    -- T-SQL
    UPDATE PA --ALIASES
       SET Title = 'Ativos'
      FROM PessoaAux AS PA
     INNER JOIN FuncionarioAux AS FA
        ON PA.BusinessEntityID = FA.BusinessEntityID
    GO

    DELETE PA
      FROM PessoaAux AS PA
     INNER JOIN FuncionarioAux AS FA 
        ON FA.BusinessEntityID = PA.BusinessEntityID
    GO