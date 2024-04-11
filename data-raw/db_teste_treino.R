## code to prepare `db_teste_treino` dataset goes here

DB_T <- DB_Treino_Teste(2024, DB_Rice('DB_Base'), 0.8, 0.2)

source("data-raw/Server.R")

if(!"DB_Treino" %in% dbListTables(conexao_sql)){
  dbWriteTable(
    conn = conexao_sql,
    name = "DB_Treino",
    value = DB_T$train
  )
}

if(!"DB_Teste" %in% dbListTables(conexao_sql)){
  dbWriteTable(
    conn = conexao_sql,
    name = "DB_Teste",
    value = DB_T$test
  )
}
#usethis::use_data(db_teste_treino, overwrite = TRUE)
