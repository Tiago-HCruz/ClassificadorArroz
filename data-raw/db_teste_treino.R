library(RSQLite)
library(tidyverse)

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

Rice_Treino <- DB_T$train
Rice_Teste <- DB_T$test

usethis::use_data(Rice_Treino, overwrite = TRUE)
usethis::use_data(Rice_Teste, overwrite = TRUE)
