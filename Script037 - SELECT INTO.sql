
    USE dbCartoon
    GO

    SELECT * FROM dbo.Desenhos
    GO

    SELECT * INTO dbo.Desenhos_2
      FROM dbo.Desenhos
    GO

    SELECT * FROM dbo.Desenhos_2
    GO

    -- drop TABLE dbo.Desenhos_2
    SELECT ID_Desenho,
           Nome_Desenho,
           Quantidade_Episodios 
      INTO dbo.Desenhos_2
      FROM dbo.Desenhos
     WHERE ID_Desenho > 1
    GO

    UPDATE dbo.Desenhos_2
       SET Data_Lancamento = ( SELECT MAX(TRY_CAST(ModifiedDate AS DATE)) FROM AdventureWorks2019.Person.Person )
     WHERE ID_Desenho = 3
    GO

    SELECT MAX(ModifiedDate) FROM AdventureWorks2019.Person.Person
    GO


    SELECT PP.BusinessEntityID,
           ISNULL(Title, '') AS Title,
           CONCAT_WS(' ', FirstName, MiddleName, LastName ) AS FullName,
           PEA.EmailAddress,
           PPP.PhoneNumber,
           TRY_CAST(PP.ModifiedDate AS DATE) AS ModifiedDate
      INTO dbCartoon.dbo.Pessoa

      FROM AdventureWorks2019.Person.Person AS PP
      JOIN AdventureWorks2019.Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
     INNER JOIN AdventureWorks2019.Person.PersonPhone AS PPP
        ON PEA.BusinessEntityID = PPP.BusinessEntityID
     WHERE MiddleName IS NOT NULL
    GO


    SELECT * FROM dbCartoon.dbo.Pessoa
    GO

    TRUNCATE TABLE dbo.Pessoa
    GO

    INSERT INTO dbo.Pessoa
    SELECT PP.BusinessEntityID,
           ISNULL(Title, '') AS Title,
           CONCAT_WS(' ', FirstName, MiddleName, LastName ) AS FullName,
           PEA.EmailAddress,
           PPP.PhoneNumber,
           TRY_CAST(PP.ModifiedDate AS DATE) AS ModifiedDate
      --INTO dbCartoon.dbo.Pessoa

      FROM AdventureWorks2019.Person.Person AS PP
      JOIN AdventureWorks2019.Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
     INNER JOIN AdventureWorks2019.Person.PersonPhone AS PPP
        ON PEA.BusinessEntityID = PPP.BusinessEntityID
     WHERE MiddleName IS NULL
    GO