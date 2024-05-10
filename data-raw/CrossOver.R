library(ClassificadorArroz)
library(MASS)
library(tidyverse)

# Banco de Dados com interação com os modelos
CO_Teste_Treino <- function(semente, Banco_Dados, i){
  set.seed(semente)
  amostra_aleatorizada <- sample(nrow(Banco_Dados))

  size_amostra <- as.integer(nrow(Banco_Dados)/5)
  amostra <- amostra_aleatorizada[((i*size_amostra)-(size_amostra-1)):(i*size_amostra)]
  Treino <- DB_Base[-amostra,]
  Teste <- DB_Base[amostra, ]

  return(list(Treino = Treino, Teste = Teste))
}

#Erro absoluto dos modelos vazio
ema_lda=c()
ema_qda=c()
ema_reg_log=c()

for (i in 1:5){
  Treino <- CO_Teste_Treino(2024, DB_Base, i)$Treino
  Teste <- CO_Teste_Treino(2024, DB_Base, i)$Teste

  # LDA: Analise Descritiva Linear
  met_lda <- lda(Classe ~ ., data = Treino)
  met_pred <- predict(met_lda, Teste)
  ema_lda <- c(ema_lda, mean(abs(as.integer(met_pred$class == 'Cammeo') - as.integer(Treino$Classe == 'Cammeo'))))

  # QDA: Analise Descritiva Quadratica
  met_qda <- qda(Classe ~ ., data = Treino)
  met_pred <- predict(met_qda, Teste)
  ema_qda <- c(ema_qda, mean(abs(as.integer(met_pred$class == 'Cammeo') - as.integer(Treino$Classe == 'Cammeo'))))

  # Reg. Log: Regressão Logistica
  m_glm <- glm(Classe ~ Perimetro + Area_Convexa, data = Treino, family = binomial)
  m_pred <- predict(m_glm, Teste, type = "response")
  glm.pred <- rep(dplyr::distinct(DB_Base, Classe)[[2,1]] |> as.vector(),
                  nrow(DB_Base) - (nrow(DB_Base)/5))
  glm.pred[m_pred > 0.5] = dplyr::distinct(DB_Base, Classe)[[1,1]] |> as.vector()
  ema_reg_log <- c(ema_reg_log, mean(abs(as.integer(glm.pred=="Cammeo")-as.integer(Teste$Classe == "Cammeo"))))
}

# Erro absoluto
CrossOver_ema <- tibble::tibble(LDA = ema_lda, QDA = ema_qda,
                        `Regressao Logistica` = ema_reg_log)
# Erro medio absoluto
CrossOver_EMA <- tibble::tibble(LDA = mean(ema_lda), QDA = mean(ema_qda),
                        `Regressao Logistica` = mean(ema_reg_log))


#
CrossOver_EMA <- CrossOver_EMA %>% pivot_longer(col = c("LDA", "QDA", "Regressao Logistica"),
                               names_to = "Modelos",  values_to = "Erro Medio Quadratica")

usethis::use_data(CrossOver_EMA, overwrite = TRUE)
