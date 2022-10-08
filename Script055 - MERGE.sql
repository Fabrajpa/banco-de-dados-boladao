    
    DROP TABLE IF EXISTS #Produto
    GO

    CREATE TABLE #Produto (
        IdProduto INT PRIMARY KEY,
        NomeProduto VARCHAR(100),
        Valor SMALLMONEY
    ) 
    GO

    INSERT INTO #Produto
    VALUES (1, 'Whey Prothein', 110.00),
           (2, 'Creatina', 120.00),
           (3, 'Term', 60.00),
           (4, 'Multivitamínico', 45.00)
    GO

    DROP TABLE IF EXISTS #Produto2
    GO

    CREATE TABLE #Produto2 (
        IdProduto INT PRIMARY KEY,
        NomeProduto VARCHAR(100),
        Valor SMALLMONEY
    ) 
    GO

    INSERT INTO #Produto2
    VALUES (1, 'Whey Prothein', 130.00),
           (2, 'Creatina', 185.00),
           (3, 'Termogênico', 89.00),
           (5, 'Albumina', 80.00),
           (6, 'Proteína da Soja', 75.00)
    GO

    drop tabLE IF EXISTS #TblLog
    GO

    CREATE TABLE #TblLog (
        [del.IdProduto] INT,
        [del.NomeProduto] VARCHAR(100),
        [del.Valor] SMALLMONEY,
        
        Acao VARCHAR(12),
        
        [ins.IdProduto] INT,
        [ins.NomeProduto] VARCHAR(100),
        [ins.Valor] SMALLMONEY,
    )
    GO

    SELECT * FROM #Produto
    GO
    
    SELECT * FROM #Produto2
    GO


    MERGE #Produto  AS Alvo
    USING #Produto2 AS Origem --SUBQUERY | CTE
       ON Alvo.IdProduto = Origem.IdProduto

    WHEN MATCHED THEN
        UPDATE SET Alvo.NomeProduto = Origem.NomeProduto,
                   Alvo.Valor = Origem.Valor

    WHEN NOT MATCHED BY TARGET
        THEN INSERT (IdProduto, NomeProduto, Valor)
        VALUES (Origem.IdProduto, Origem.NomeProduto, Origem.Valor)

    WHEN NOT MATCHED BY SOURCE
        THEN DELETE

    OUTPUT deleted.*, $action, inserted.* INTO #TblLog ;


    SELECT * FROM #TblLog