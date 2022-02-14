
    -- criação de uma nova base
    CREATE DATABASE DEVDOJO
    GO

    -- selecionamos a base a ser utilizada
    USE DEVDOJO
    GO

    -- FOREIGN KEY: CHAVE ESTRANGEIRA
    -- FUNCIONARIO -> DEPARTAMENTO

    -- deletamos a tabela se ela existir
    DROP TABLE IF EXISTS FUNCIONARIO
    GO

    -- deletamos a tabela se ela existir
    DROP TABLE IF EXISTS DEPARTAMENTO
    GO

    CREATE TABLE DEPARTAMENTO (
        --ID_DEPARTAMENTO INT PRIMARY KEY,
        COD_DEPARTAMENTO VARCHAR(10) PRIMARY KEY,
        DESC_DEPARTAMENTO VARCHAR(30) NOT NULL
    )
    GO 
    --PRODUTO
    --SKU-1032554

    CREATE TABLE FUNCIONARIO (
        MATRICULA INT NOT NULL IDENTITY(1000, 10), 
        NOME VARCHAR(100) NOT NULL, --CONSTRAINT
        SOBRENOME VARCHAR(100) NOT NULL,
        DT_NASCIMENTO DATE NOT NULL, --NULL
        CPF VARCHAR(11) NOT NULL UNIQUE,
        TELEFONE VARCHAR(9) NOT NULL,
        EMAIL VARCHAR(100) NOT NULL,

        COD_DEPARTAMENTO VARCHAR(10),
        
        DATA_CRIACAO DATETIME DEFAULT GETDATE(), --constraint default utilizará o valor que passarmos como 'padrão', não havendo a necessidade de ter nos 'inserts'
        
        CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (MATRICULA), -- nao aceita null, não aceita registros duplicados: valores únicos
        CONSTRAINT CH_CHECA_NASCIMENTO CHECK (DT_NASCIMENTO >= '1900-01-01'), --faz a checagem do valor a ser inserido e proibi se estiver fora da regra
        
        CONSTRAINT FK_COD_DEPARTAMENTO FOREIGN KEY (COD_DEPARTAMENTO)
        REFERENCES DEPARTAMENTO (COD_DEPARTAMENTO)
    )
    GO

    /*
        Maneira de criar uma constraint (neste exemplo uma foreign key) quando a tabela já estiver criada, interessante atribuir nomes as constraints:
            ALTER TABLE FUNCIONARIO
            ADD CONSTRAINT FK_COD_DEPARTAMENTO
            FOREIGN KEY (COD_DEPARTAMENTO)
            REFERENCES DEPARTAMENTO (COD_DEPARTAMENTO)
    */

    INSERT INTO DEPARTAMENTO
    VALUES ('DBZ', 'Dragonball Z'),
           ('CDZ', 'Cavaleiros do Zodíaco'), 
           ('YuYu', 'Yu-Yu Hakusho') 
    GO
  
    -- aqui não passamos as colunas que tem a constraint IDENTITY e nem o DEFAULT
    INSERT INTO FUNCIONARIO (NOME, SOBRENOME, DT_NASCIMENTO, CPF, TELEFONE, EMAIL, COD_DEPARTAMENTO)
    VALUES ('William', 'Suane', '2015-01-01', '12345678911', '924242424', 'william.suane@will.com', 'CDZ'),
           ('Wildnei', 'Suane', '2010-01-01', '12345678912', '924242424', 'wildnei.suane@wilnei.com', 'DBZ'),
           ('Fabricio', 'Chousa', '1991-01-01', '12345678930', '924242356', 'fabricio.chousa@chousa.com', 'YuYu')
    GO
    
    INSERT INTO FUNCIONARIO (NOME, IDADE)
    VALUES ('Joao', 40),
           ('Rita', 35)
    
    --SELECT GETDATE()
    SELECT * FROM DEPARTAMENTO
    SELECT * FROM FUNCIONARIO
    GO
