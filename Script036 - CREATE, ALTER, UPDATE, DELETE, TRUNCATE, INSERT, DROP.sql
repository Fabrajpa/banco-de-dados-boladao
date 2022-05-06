
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

    SELECT * FROM dbo.Desenhos
    GO

    
    INSERT INTO dbo.Desenhos (Nome_Desenho, Data_Lancamento, Quantidade_Episodios)
    VALUES ('Dragonball Z', '1989-04-26', 290),
           ('Cavaleiros do Zodíaco', '1985-12-01', 114),  --não trouxe a saga de hades
           ('Shurato', '1990-01-15', 38),
           ('Yu Yu Hakusho', '1990-12-03', 112)
    GO

    UPDATE dbo.Desenhos
       SET Quantidade_Episodios = 291
     WHERE ID_Desenho = 1
       AND Nome_Desenho = 'Dragonball Z'
    GO

    SELECT * FROM dbo.Desenhos
    GO

    ALTER TABLE dbo.Desenhos
      ADD Coisas_Desenho VARCHAR(20) --NULL
    GO

    UPDATE Desenhos
       SET Coisas_Desenho = 'COISAS'
    GO

    -- ALTERA A TABELA | DELETA A COLUNA
    ALTER TABLE dbo.Desenhos
     DROP COLUMN Coisas_Desenho
    GO

    --ALTERA A TABELA | ALTERA UMA COLUNA
    ALTER TABLE Desenhos
    ALTER COLUMN [Quantidade_Episodios] INT
    GO

    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
     WHERE COLUMN_NAME = 'Quantidade_Episodios'
    GO

    -- APAGA OS REGISTROS DA TABELA | MANTERÁ A TABELA
    TRUNCATE TABLE Desenhos
    GO

    select * from Desenhos

    DELETE FROM Desenhos
     WHERE ID_Desenho = 3
    GO

    DELETE FROM Desenhos
     WHERE ID_Desenho < 3
    GO

    DROP TABLE Desenhos