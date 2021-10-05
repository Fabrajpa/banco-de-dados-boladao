
    USE AdventureWorks2019
    GO

    --EOMONTH(DATA/Nome_da_coluna, [precisãoOpcional]) : retorno tipo 'date'
    SELECT GETDATE() AS [GETDATE()],
           
           EOMONTH( GETDATE() ) AS [EOMONTH],
           EOMONTH( GETDATE(), -4 ) AS [NEG],
           
           EOMONTH('2010-02-10') AS FEV,
           EOMONTH('2010-02-10', 3) AS MES
    GO

    SELECT BusinessEntityID,
           FirstName,
           ModifiedDate,
           EOMONTH(ModifiedDate, -3) as [-3 Meses],
           EOMONTH(ModifiedDate) AS ULTIMO_DIA_DO_MES,
           EOMONTH(ModifiedDate, 6) AS [+6 Meses]
      FROM Person.Person

    --DATEFROMPARTS(ANO, MES, DIA) [TODOS DO TIPO INTEIRO] : RETORNO SERA UM DATE
    SELECT DATEFROMPARTS('2015', '10', '7')
    
    -- TIMEFROMPARTS(HORA, MINUTO, SEGUNDO, FRACAO, PRECISAO): RETORNO SERA UM TIME
    SELECT TIMEFROMPARTS(18, 30, 40, 0, 0)

    -- DATETIMEFROMPARTS(ANO, MES, DIA, HORA, MINUTO, SEGUNDO, FRACAO)
    SELECT DATETIMEFROMPARTS(1991, 4, 12, 1, 58, 30, 30)