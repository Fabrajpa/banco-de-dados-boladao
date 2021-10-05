
    USE AdventureWorks2019
    GO

    /*
        TRANSLATE(Expression/Nome_da_Coluna, 'expressao a ser trocada', pelo o que voce ir� substituir)
    */

    SELECT REPLACE('A Melhor sele��o do mundo � o Brasil?', '�', 'c') AS DevDojo,
           TRANSLATE('A melhor sele��o do mundo � o Brasil?', '�� � ?', 'ca e !') AS [TRANSLATE]
    GO

    SELECT BusinessEntityID,
           TRY_CAST(RateChangeDate AS DATE) AS RateChangeDate,
           Rate,
           TRY_CAST(Rate AS VARCHAR(10)) AS rate2,
           STR(Rate, 30, 4) AS [STR],
           PayFrequency
      FROM HumanResources.EmployeePayHistory
    GO