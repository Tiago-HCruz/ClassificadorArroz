#' @export
#'
#' @description
#' Essa função tem como objetivo de subdividir o banco de dados original em dois,
#' Banco de dados treino e teste. Alias, vale reparar que deve-se definir a
#' porcentagem de dados base deve ser colocadas nos dois subconjunto de dados.
#'
#' @title Banco de dados Treino e Teste.
#'
#' @param semente: o número da semestre.
#' @param df: o banco de dados que devera ser subdividido.
#' @param porc_train: a porcentagem de observações do banco de dados que
#' deve ser realocado no banco de dados treino.
#' @param porc_test: a porcentagem de observações do banco de dados que
#' deve ser realocado no banco de dados test.
#'
#' @format Uma lista contendo dois banco de dados.
#'
#' @return Retorna uma lista que contém dois banco de dados, treino e teste.
#'
#' @examples DB_Treino_Teste(2024, DB_Base |> head(50), 0.8, 0.2)
#'

DB_Treino_Teste <- function(semente, df, porc_train, porc_test){
  set.seed(semente)

  ind <- sample(2, nrow(df),
                replace = TRUE,
                prob = c(porc_train, porc_test))

  training <- df[ind==1,]
  testing <- df[ind==2,]

  return(list(train = training,
              test = testing))

}



