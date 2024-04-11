#' @importFrom dplyr tbl
#' @importFrom RSQLite SQLite
#' @importFrom DBI dbConnect
#' @importFrom dplyr as_tibble
#'
#' @export
#'
#' @description
#' Carrega um Banco de dados que estão armazenada no servidor do SQL.
#'
#' @note Vale observar que ao ativar essa função o servidor do banco de dados será
#' aberta e com isso, não se esqueça de desconectar do servidor.
#'
#' @title Banco de dados.
#'
#' @return Retorna um banco de dados.
#'
#' @examples
#' DB_Rice('DB_Base') |> head()

DB_Rice <- function(Banco_de_dados){
  conexao_sql <- dbConnect(
    drv = SQLite(),
    dbname = "Banco_de_Dados/Rice.sqlite"
  )

  return(tbl(conexao_sql, Banco_de_dados) |> as_tibble())

  dbDisconnect(conexao_sql)
}
