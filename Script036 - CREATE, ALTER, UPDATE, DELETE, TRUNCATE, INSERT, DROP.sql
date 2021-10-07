
    USE dbCartoon
    GO

    --DROP (EXCLUIR, DELETAR, JOGAR FORA)
    DROP TABLE IF EXISTS Desenhos
    GO

    --criando uma tabela
    -- CREATE TABLE SCHEMA.Nome_da_tabela
    CREATE TABLE dbo.Desenhos (
        ID_Desenho           TINYINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
        Nome_Desenho         VARCHAR(50) NOT NULL,
        Data_Lancamento      DATE NOT NULL,
        Quantidade_Episodios SMALLINT NOT NULL

    )
    GO

    -- INSERINDO VALORES NA TABELA
    INSERT INTO dbo.Desenhos (Nome_Desenho, Data_Lancamento, Quantidade_Episodios)
    VALUES ('Dragonball Z', '1989-04-26', 290),
           ('Cavaleiros do Zodíaco', '1985-12-01', 114),  --não trouxe a saga de hades
           ('Shurato', '1990-01-15', 38),
           ('Yu Yu Hakusho', '1990-12-03', 112)
    GO

    --ATUALIZA REGISTRO
    UPDATE dbo.Desenhos
       SET Quantidade_Episodios = 291
     WHERE ID_Desenho = 1
       AND Nome_Desenho = 'Dragonball Z'
    GO

    SELECT * FROM dbo.Desenhos
    GO


    ALTER TABLE dbo.Desenhos
     DROP COLUMN Data_Lancamento
    GO

    ALTER TABLE dbo.Desenhos
      ADD Data_Lancamento DATETIME NULL --NOT NULL
    GO

    UPDATE Desenhos
       SET Data_Lancamento = '1990-01-01'
    GO

    ALTER TABLE dbo.Desenhos
    ALTER COLUMN Data_Lancamento DATE

    TRUNCATE TABLE dbo.Desenhos
    GO

    select * from dbo.Desenhos

    DELETE FROM dbo.Desenhos
     WHERE ID_Desenho < 4

    ALTER TABLE dbo.Desenhos
    ALTER COLUMN Quantidade_Episodios TINYINT