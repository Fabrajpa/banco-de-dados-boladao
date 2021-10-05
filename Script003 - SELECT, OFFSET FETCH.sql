
    SELECT --TOP 10
           BusinessEntityID,
           PersonType,
           Title,
           FirstName,
           MiddleName,
           LastName,
           ModifiedDate 
      
      FROM Person.Person
     --WHERE MiddleName = 'N'
     ORDER BY BusinessEntityID
    OFFSET 50 ROWS -- IGNORE (PULAR) Quantidade_de_linhas ROWS = LINHAS
     --ORDER BY 4,5,6 -- EVITEM
     /*ORDER BY FirstName ,  --DEFAULT ASC
              MiddleName DESC, 
              LastName */



    SELECT --TOP 10
           BusinessEntityID,
           PersonType,
           Title,
           FirstName,
           MiddleName,
           LastName,
           ModifiedDate 
      
      FROM Person.Person
     --WHERE MiddleName = 'N'
     ORDER BY BusinessEntityID
    OFFSET 50 ROWS -- IGNORE (PULAR) Quantidade_de_linhas ROWS = LINHAS
     FETCH NEXT 10 ROWS ONLY -- EXECUTE AS PROXIMAS 1- LINHAS SOMENTE
     --ORDER BY 4,5,6 -- EVITEM
     /*ORDER BY FirstName ,  --DEFAULT ASC
              MiddleName DESC, 
              LastName */


    SELECT DISTINCT
           BusinessEntityID,
           --PersonType,
           --Title,
           FirstName,
           --MiddleName,
           LastName
           --ModifiedDate 
      
      FROM Person.Person
     --WHERE MiddleName = 'N'
     ORDER BY LastName
    OFFSET 50 ROWS -- IGNORE (PULAR) Quantidade_de_linhas ROWS = LINHAS
     FETCH NEXT 10 ROWS ONLY -- EXECUTE AS PROXIMAS 1- LINHAS SOMENTE
     --ORDER BY 4,5,6 -- EVITEM
     /*ORDER BY FirstName ,  --DEFAULT ASC
              MiddleName DESC, 
              LastName */


    