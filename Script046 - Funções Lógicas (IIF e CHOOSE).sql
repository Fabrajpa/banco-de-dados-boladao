
    USE AdventureWorks2019
    GO

    /*
        Funcões lógicas
        IIF( teste_logico, 'SeForVeradeiro', 'SeForFalso' )
        CHOOSE( indice, expressões(argumentos))
    */

    SELECT IIF( 5=2, 'Verdadeiro', 'Falso' ) AS TesteIFF
    GO
    
    SELECT IIF( OrderQty >= 3, 'Muito bom', 'Vamos melhorar' ) AS Teste,
           CHOOSE(OrderQty, 'Indice 1', 'Indice 2', 'Indice 3', 'Indice 4', 'Indice 5', 'Indice 6', 'Indice 7', 'Indice 8' )  as Pos,
           CHOOSE( MONTH(ModifiedDate), 'Verão', 'Verão', 'Outono', 'Outuno', 'Outuno', 'Inverno', 'Inverno', 'Inverno', 'Primavera', 'Primavera', 'Primavera', 'Verão' ) As [Estações do Ano],
           * 
      FROM Sales.SalesOrderDetail
    GO

    SELECT CHOOSE( 3, 'Indice 1', 'Indice 2', 'Whey Protein', 'Indice 4' )
    GO