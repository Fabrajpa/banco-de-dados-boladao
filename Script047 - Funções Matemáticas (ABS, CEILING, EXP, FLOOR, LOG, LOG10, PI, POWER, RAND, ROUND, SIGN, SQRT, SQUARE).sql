
    /*
        FUNÇÕES MATEMÁTICAS

        https://docs.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver16
    */

    SELECT ABS(-100), ABS(0), ABS(123)

    SELECT CEILING(-123.45), CEILING(-1), CEILING(56), CEILING(987.56)

    SELECT EXP(10)

    SELECT FLOOR(123.70), FLOOR(-123.45), FLOOR(978.12)

    SELECT LOG(10), LOG10(1456)

    SELECT PI()

    SELECT POWER(2, 4)

    SELECT RAND(), RAND()

    SELECT ROUND(123.9994, 3), 
           ROUND(123.99995, 3), 
           ROUND(123.4145, 1), 
           ROUND(123.45, -2), 
           ROUND(1515.75, 2, 2)

    SELECT SIGN(-100), SIGN(0), SIGN(56)

    SELECT SQRT(10)

    SELECT SQUARE(10)
