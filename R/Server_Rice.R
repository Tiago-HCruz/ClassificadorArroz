#' @importFrom RSQLite SQLite
#' @importFrom DBI dbConnect
#'
#' @export
#'
#' @description
#' Uma função que abre o servidor SQL que por sua vez, existe diversos banco de dados
#' sobre o Arroz.
#'
#' @title função que abre o servidor SQL que hospedam os banco de dados.
#'
#' @format Servidor SQL
#'
#' @return Um servidos SQL
#'
#' @note não esqueça de deSconectar do servidor do sql

Server_Rice <- function(){

  source("data-raw/Server.R")
  message(paste("Não esqueça de se desconectar do servidor SQL,",
                "através do comando 'dbDisconnect(conexao_sql)'"))

}









