library(RSQLite)

conexao_sql <- DBI::dbConnect(
  drv = RSQLite::SQLite(),
  dbname = "Banco_de_Dados/Rice.sqlite"
)

dbGetQuery(conexao_sql, paste("SELECT * FROM DB_Base",
                              "WHERE Classe GLOB 'Cammeo'"))

dbGetQuery(conexao_sql, paste("SELECT * FROM DB_Base",
                              "WHERE Classe GLOB 'Osmancik'"))

dbDisconnect(conexao_sql)
#usethis::use_data(Rice_Cammeo_Osmancik_db, overwrite = TRUE)





