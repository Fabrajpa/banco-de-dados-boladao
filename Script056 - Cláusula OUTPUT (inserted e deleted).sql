    
    DROP TABLE IF EXISTS #Produto2
    GO

    CREATE TABLE #Produto2 (
        IdProduto INT PRIMARY KEY,
        NomeProduto VARCHAR(100),
        Valor SMALLMONEY
    ) 
    GO

    INSERT INTO #Produto2
    --OUTPUT inserted.IdProduto, inserted.NomeProduto, inserted.Valor
    OUTPUT inserted.*
    VALUES (1, 'Whey Prothein', 130.00),
           (2, 'Creatina', 185.00),
           (3, 'Termogênico', 89.00),
           (5, 'Albumina', 80.00),
           (6, 'Proteína da Soja', 75.00),
           (7, 'Pasta de amendoim', 39.90)
    GO


    DROP TABLE IF EXISTS #TblLogOutput
    GO
    CREATE TABLE #TblLogOutput (
        Coluna1 INT,
        Coluna2 VARCHAR(100),
        Coluna3 SMALLMONEY
    )
    GO

    SELECT * FROM #TblLogOutput
    GO
    
    UPDATE #Produto2
       SET Valor = 98.80
    OUTPUT inserted.*
      INTO #TblLogOutput
     WHERE IdProduto = 6
    GO


    select * from #Produto2
    go

    DELETE #Produto2
    OUTPUT deleted.*
      INTO #TblLogOutput
     WHERE IdProduto = 7
    GO
