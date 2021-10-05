/*
                                Tipos de Dados: Numéricos exatos (inteiros ou decimais)
    +--------------+----------------------------------------------------------------------------+---------------+
    |     Tipo     |                              Intervalo	                                    | Armazenamento |
    |--------------|----------------------------------------------------------------------------|---------------|
    | bigint	   |  -2^63 (-9.223.372.036.854.775.808) a 2^63-1 (9.223.372.036.854.775.807)   |    8 bytes    |
    | int	       |  -2^31 (-2.147.483.648) a 2^31-1 (2.147.483.647)	                        |    4 bytes    |
    | smallint     |  -2^15 (-32.768) a 2^15-1 (32.767)	                                        |    2 bytes    |
    | tinyint	   |  0 a 255	                                                                |    1 byte     |
    | money	       |  -922.337.203.685.477,58 a 922.337.203.685.477,58	                        |    8 bytes    |
    | smallmoney   |  -214.748,3648 a 214.748,3647	                                            |    4 bytes    |
    |--------------|----------------------------------------------------------------------------|---------------|
    | bit	       |  1 (TRUE), 0 (FALSE) OU null	                                                            | 
    |                 "Se houver 8 ou menos colunas bit em uma tabela, as colunas serão armazenadas             |
    |                  como 1 byte. Se houver de 9 a 16 colunas bit, as colunas serão armazenadas               |
    |                  como 2 bytes, e assim por diante."                                                       |
    |--------------|--------------------------------------------------------------------------------------------|
    | decimal      | - 10^38 +1 a 10^38 - 1  ambos são equivalentes                                             |
    | numeric      | - 10^38 +1 a 10^38 - 1  ambos são equivalentes                                             |
    |___________________________________________________________________________________________________________| 
 

                                        Tipos de Dados: Numéricos aproximados
    +--------------+--------------------------------------------------------------------------------------------+
    |     Tipo     |                              Intervalo	                            |     Armazenamento     |
    |--------------+--------------------------------------------------------------------+-----------------------|
    | float	       |  - 1,79E+308 a -2,23E-308, 0 e 2,23E-308 a 1,79E+308               | Depende do valor de n |
    | real	       |  - 3,40E + 38 a -1,18E - 38, 0 e 1,18E - 38 a 3,40E + 38           |       4 bytes         |
    |___________________________________________________________________________________________________________|
    
    |-----------------------------------------------------------------------------------------------------------|
    |           https://docs.microsoft.com/pt-br/sql/t-sql/data-types/numeric-types?view=sql-server-ver15       |
    |-----------------------------------------------------------------------------------------------------------|




                                        Tipos de Dados: Cadeias de Caracteres
    +--------------+--------------------------------------------------------------------------------------------+
    |     Tipo     |                              Descrição	                                                    |
    |--------------+--------------------------------------------------------------------------------------------|
    | char(n)	   |     Caracteres de tamanho fixo. Máximo 8000 caracteres                                     |
    | varchar(n)   |     Caracteres de tamanho variável. Máximo 8000 caracteres                                 |
    | varchar(max) |     Caracteres de tamanho variável. Máximo 1.073.741.824 caracteres                        |
    |                                                                                                           |
    | https://docs.microsoft.com/pt-br/sql/t-sql/data-types/char-and-varchar-transact-sql?view=sql-server-ver15 |
    |                                                                                                           |
    |___________________________________________________________________________________________________________|





                                        Tipos de Dados: Cadeias de Caracteres Unicode
    +---------------+---------------------------------------------------------------------------------------------+
    |     Tipo      |                             Descrição	                                                      |
    |---------------+---------------------------------------------------------------------------------------------|
    | nchar(n)	    |     Caracteres de tamanho fixo. Máximo 4000 caracteres                                      |
    | nvarchar(n)   |     Caracteres de tamanho variável. Máximo 4000 caracteres                                  |
    | nvarchar(max) |     Caracteres de tamanho variável. Máximo 536.870.912 caracteres                           |
    |                                                                                                             |
    | https://docs.microsoft.com/pt-br/sql/t-sql/data-types/nchar-and-nvarchar-transact-sql?view=sql-server-ver15 |
    |                                                                                                             |
    |_____________________________________________________________________________________________________________|





                                     Tipos de Dados: Cadeias de Caracteres Binários
    +----------------+------------------------------------------------------------------+---------------------------+
    |     Tipo       |                            Descrição	                            |        Use quando...      |
    |----------------+------------------------------------------------------------------+---------------------------|
    |   binary(n)    | Dados binários de comprimento fixo com um tamanho de n bytes,    |      os tamanhos das      |
    |                | em que n é um valor de 1 a 8.000. O tamanho do armazenamento     |     entradas de dados     |
    |                | é n bytes.                                                       |      de coluna forem      |
    |                |                                                                  |      consistentes.        |
    |----------------|------------------------------------------------------------------+---------------------------|
    |  varbinary(n)  | Dados binários de tamanho variável.                              |     os tamanhos das       |
    |                | n pode ser um valor de 1 a 8.000                                 |   entradas de dados de    |
    |                |                                                                  |    de coluna variarem     |
    |                |                                                                  |    consideravelmente.     |
    |----------------+------------------------------------------------------------------+---------------------------|
    | varbinary(max) |   tamanho de armazenamento máximo é de 2^31-1 bytes.             |                           |
    |                                                                                                               |
    | https://docs.microsoft.com/pt-br/sql/t-sql/data-types/binary-and-varbinary-transact-sql?view=sql-server-ver15 |
    |                                                                                                               |
    |_______________________________________________________________________________________________________________|



                            Tipos de Dados: Cadeias de Caracteres Binários/Unicode/Não Unicode
    +---------+-----------------------------------------------------------------------------------------------------+
    |  Tipo   |                                     Descrição	                                                    |
    |---------+-----------------------------------------------------------------------------------------------------|
    | text    | Dados não Unicode de comprimento variável. Máximo de caracteres de 2^31-1 (2.147.483.647)           |
    | ntext   | Dados Unicode de comprimento variável. Máximo de caracteres de 2^30 - 1 (1.073.741.823) bytes       |
    | image   | Dados binários do comprimento variável de 0 a 2^31-1 (2.147.483.647) bytes                          |
    |---------------------------------------------------------------------------------------------------------------|
    | IMPORTANTE: Os tipos de dados ntext, text e image serão removidos em uma versão futura do SQL Server.         |
    | Evite usar esses tipos de dados em novos trabalhos de desenvolvimento e planeje modificar os aplicativos      |
    | que os utilizam atualmente. Em vez disso, use nvarchar(max), varchar(max)e varbinary(max) .                   |
    |                                                                                                               |
    | https://docs.microsoft.com/pt-br/sql/t-sql/data-types/ntext-text-and-image-transact-sql?view=sql-server-ver15 |
    |                                                                                                               |
    |_______________________________________________________________________________________________________________|


                                            Tipos de Dados: Data e Hora
    +---------------------------------------------------------------------------------------------------------------+
    |      Tipo      |              Valores	            |         Formato         |          Valor Padrão           |
    |----------------+----------------------------------+-------------------------+---------------------------------|
    | date           | 0001-01-01 a 9999-12-31          | AAAA-MM-DD              |            1900-01-01           |
    | ---------------+----------------------------------+-------------------------+---------------------------------|
    | datetime       | 1753-01-01 a 9999-12-31          | AAAA-MM-DD hh:mm:ss     |       1900-01-01 00:00:00       |
    |                  Hora 00:00:00 a 23:59:59.997     |                         |                                 |
    |----------------+----------------------------------+-------------------------+---------------------------------|
    | datetime2      | 0001-01-01 a 9999-12-31          | AAAA-MM-DD hh:mm:ss     |       1900-01-01 00:00:00       |
    |                  Hora 00:00:00 a 23:59:59.9999999 | [segundos fracionários] |                                 |
    |----------------+----------------------------------+-------------------------+---------------------------------|
    | datetimeoffset | 0001-01-01 a 9999-12-31          | AAAA-MM-DD hh:mm:ss     |    1900-01-01 00:00:00 00:00    |
    |                  Hora 00:00:00 a 23:59:59.9999999 | [.nnnnnnn] [{+|-}hh:mm] |                                 |
    |----------------+----------------------------------+-------------------------+---------------------------------|
    | smalldatetime  | 1900-01-01 a 2079-06-06          | AAAA-MM-DD hh:mm:ss     |       1900-01-01 00:00:00       |
    |                  Hora 00:00:00 a 23:59:59         | [segundos arredondados] |                                 |
    |----------------+----------------------------------+-------------------------+---------------------------------|
    | time           | 00:00:00.0000000 a               | hh:mm:ss[.nnnnnnn]      |             00:00:00            |
    |                  23:59:59.9999999                 |                         |                                 |
    |                                                                                                               |
    |        https://docs.microsoft.com/pt-br/sql/t-sql/data-types/date-and-time-types?view=sql-server-ver15        |
    |                                                                                                               |
    |_______________________________________________________________________________________________________________|

*/