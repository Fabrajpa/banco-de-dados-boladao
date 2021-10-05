
    USE AdventureWorks2019
    GO

    SELECT --value,
           --LEFT(value, 1) AS [1L],
           --UPPER( LEFT(value, 1) ) AS [1LU],
           --RIGHT(value, LEN(value)-1 ) AS [ALL_RIGHT],
           STRING_AGG( CONCAT( UPPER( LEFT(value, 1) ), RIGHT(value, LEN(value)-1) ), ' ') AS DevDojo
      FROM STRING_SPLIT('william suane grande mestre jedi do devdojo brabo do java', ' ')