/*
    ALL (SUBQUERY)
    AND
    OR
    SOME | ANY (SUBQUERY)
    BETWEEN
    EXISTS (SUBQUERY)
    IN | NOT IN
    LIKE | NOT LIKE
*/
    SELECT * FROM Person.Person
     WHERE BusinessEntityID IN (1, 2, 3, 4, 659, 580, 900, 4500)

    SELECT * FROM Person.Person
     WHERE FirstName NOT IN ('Ken', 'Gigi', 'Aaron', 'A.')
     ORDER BY FirstName

    SELECT * FROM Person.Person
     --WHERE BusinessEntityID > 600 AND BusinessEntityID < 800
     WHERE BusinessEntityID BETWEEN 1 AND 8000
       --AND FirstName = 'Fabricio'
       AND ( MiddleName = 'DevDojo' OR MiddleName = 'G' OR LastName = 'Boladao' )
        
     --ORDER BY FirstName

    SELECT * FROM Person.Person
     --WHERE FirstName LIKE 'G%'
     WHERE FirstName LIKE '____a'

    SELECT * FROM Person.Person
     --WHERE FirstName LIKE 'G%'
     WHERE FirstName LIKE '[ABCDEFG]___a'
     ORDER BY FirstName

    SELECT * FROM Person.Person
     --WHERE FirstName LIKE 'G%'
     WHERE FirstName NOT LIKE '[ABCDEFG]___a'
     ORDER BY FirstName


    SELECT * FROM Person.Person
     --WHERE FirstName LIKE 'G%'
     WHERE FirstName LIKE '[^ABCDEFG]__a'
     ORDER BY FirstName