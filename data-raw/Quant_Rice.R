## code to prepare `Quant_Rice` dataset goes here
library(DBI)
library(RSQLite)

Server_Rice()

if(!"DB_Quantidade" %in% dbListTables(conexao_sql)){
  dbWriteTable(
    conn = conexao_sql,
    name = "DB_Quantidade",
    value = dbGetQuery(conexao_sql,
                       paste("WITH Quant_Total (Classe, Treino, Teste)",
                             "AS (",
                             "WITH Quant_Treino (Classe, Treino)",
                             "AS (SELECT Classe, COUNT(*) AS 'Treino'",
                             "FROM DB_Treino GROUP BY Classe),",
                             "Quant_Teste (Classe, Teste)",
                             "AS (SELECT Classe, COUNT(*) AS 'Teste'",
                             "FROM DB_Teste GROUP BY Classe)",
                             "SELECT Quant_Treino.*, Teste FROM Quant_Treino",
                             "INNER JOIN Quant_Teste",
                             "ON Quant_treino.Classe = Quant_Teste.Classe)",
                             "SELECT * ,",
                             "(Treino + Teste) AS Total",
                             "FROM Quant_Total"
    ))
  )

  myquery = paste0("INSERT INTO DB_Quantidade VALUES(",
                   paste0("'",
                          data.frame(Classe = "Total",
                                     Treino = sum(DB_Rice('DB_Quantidade')$Treino),
                                     Teste = sum(DB_Rice('DB_Quantidade')$Teste),
                                     Total = sum(DB_Rice('DB_Quantidade')$Total)),
                          "'", collapse = ", "), ");")

  dbGetQuery(conexao_sql, myquery)
}

#usethis::use_data(Quant_Rice, overwrite = TRUE)
