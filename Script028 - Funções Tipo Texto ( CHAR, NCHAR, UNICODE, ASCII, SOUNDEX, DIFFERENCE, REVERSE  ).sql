
    USE AdventureWorks2019
    GO

    /*
        CHAR([Numero[ate255]])
        NCHAR([Numero[ate255]]) retorna 1 caracter
        ASCII() retorna o valor da tabela ASCII
        UNICODE('UmCaracter') retorno int

        SOUNDEX( character_expression ) returns varchar
        
        DIFFERENCE( character_expression, character_expression )
            0 a 4, onde 0 indica pouco ou nenhuma semelhança e 4 indica forte semelhança

        REVERSE ( expressao )
    */

    SELECT CHAR(210)  AS [CHAR],
           NCHAR(200) AS [NCHAR],
           ASCII('d') AS [ASCII],
           UNICODE('D') AS [UNICODE],

           SOUNDEX('Fabricio') AS [SOUNDEX],
           SOUNDEX('DevDojo') AS [SOUNDEX_2],
           DIFFERENCE( SOUNDEX('Fabricio'), SOUNDEX('DevDojo') ) AS [DIFFERENCE],
           DIFFERENCE( 'Fabricio', 'DevDojo' ) AS [DIFFERENCE_2],
           DIFFERENCE( 'Fabricio', 'FabrYcYo') as dif3,
           DIFFERENCE( 'Java', 'DevDojo' ) as dif4,
           REVERSE('DevDojo é o melhor do mundo em Java') as dif5

    SELECT REVERSE(FirstName) AS REV,
           SOUNDEX(FirstName) AS S1,
           SOUNDEX(LastName) AS S3
      FROM Person.Person