# O Servidor do Banco de Dados

conexao_sql <- DBI::dbConnect(
  drv = RSQLite::SQLite(),
  dbname = "Banco_de_Dados/Rice.sqlite"
)

# usethis::use_data(conexao_sql, overwrite = TRUE) #Salva o objeto em "data"
