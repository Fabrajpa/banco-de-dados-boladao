
	/*
		https://learn.microsoft.com/pt-br/sql/relational-databases/views/views?view=sql-server-ver16

		https://learn.microsoft.com/pt-br/sql/t-sql/statements/create-view-transact-sql?view=sql-server-ver16
		
	*/
    
	--PARTE 1
	USE AdventureWorks2019
    GO

    CREATE OR ALTER VIEW dbo.VW_TESTE
    AS

    SELECT ROW_NUMBER() OVER(ORDER BY CONCAT_WS(' ', FirstName, MiddleName, LastName) ) AS ORD,
           ISNULL(Title, '') AS [Titulo],
           CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [Nome Completo],
           EmailAddress AS [Email],
           PhoneNumber  AS [Numero de Contato],
           PPNT.Name AS [Tipo Contato] ,
           --AddressLine1,
           --AddressLine2
           CASE
              WHEN AddressLine2 IS NOT NULL THEN ISNULL(AddressLine1, '')+CHAR(13)+AddressLine2
              ELSE ISNULL(AddressLine1, '')
            END AS [Endereco],
           
           ISNULL(City, '') AS [Cidade],
           ISNULL(PAT.Name, '') AS [Tipo Endereco]

      FROM Person.Person AS PP
      LEFT JOIN Person.EmailAddress AS PEA
        ON PP.BusinessEntityID = PEA.BusinessEntityID
      LEFT JOIN Person.PersonPhone AS PPP
        ON PP.BusinessEntityID = PPP.BusinessEntityID
      LEFT JOIN Person.PhoneNumberType AS PPNT
        ON PPP.PhoneNumberTypeID = PPNT.PhoneNumberTypeID
      LEFT JOIN Person.BusinessEntityAddress AS PBEA
        ON PP.BusinessEntityID = PBEA.BusinessEntityID
      LEFT JOIN Person.Address AS PA
        ON PBEA.AddressID = PA.AddressID
      LEFT JOIN Person.AddressType AS PAT
        ON PBEA.AddressTypeID = PAT.AddressTypeID
     --ORDER BY [Nome Completo]

    GO


    SELECT * FROM VW_TESTE



    --PARTE 2

     
    USE DEVDOJO
    GO
    
    DROP TABLE IF EXISTS Produto
    GO

    CREATE TABLE Produto (
        IdProduto INT PRIMARY KEY,
        NomeProduto VARCHAR(100),
        Valor SMALLMONEY
    ) 
    GO
    

    INSERT INTO Produto
    VALUES (1, 'Whey Prothein', 110.00),
           (2, 'Creatina', 120.00),
           (3, 'Term', 60.00),
           (4, 'Multivitamínico', 45.00)
    GO

    --ERRO AO DELETAR A COLUNA (SCHEMABINDING)
    ALTER TABLE Produto
    DROP COLUMN Valor
    GO

    

    DROP TABLE IF EXISTS Produto2
    GO

    CREATE TABLE Produto2 (
        IdProduto INT PRIMARY KEY,
        NomeProduto VARCHAR(100),
        Valor SMALLMONEY
    ) 
    GO

    INSERT INTO Produto2
    VALUES (5, 'Albumina', 80.00),
           (6, 'Proteína da Soja', 75.00),
           (7, 'Pasta de amendoim', 38.80)
    GO


    SELECT * FROM Produto
    GO


    --PARTE 3

    
    USE DEVDOJO
    GO
    
    DROP VIEW IF EXISTS dbo.VW_PRODUTO
    GO

    CREATE OR ALTER VIEW dbo.VW_PRODUTO
     -- WITH SCHEMABINDING,
       --    ENCRYPTION
    AS

                  
        SELECT IdProduto,
               NomeProduto,
               Valor
          FROM dbo.Produto
--
         UNION
--
        SELECT IdProduto,
               NomeProduto,
               Valor
          FROM dbo.Produto2

    GO

    SELECT * FROM VW_PRODUTO
    GO