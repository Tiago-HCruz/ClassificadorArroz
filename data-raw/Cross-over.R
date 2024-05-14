library(tidyverse)
library("MASS")
library(ClassificadorArroz)

#Validação Cruzada

set.seed(2024)
amostra_aleatorizada <- sample(nrow(DB_Base))

#LDA

MAE=c()
mae=c()

for (i in 1:10){
  size_amostra <- as.integer(nrow(DB_Base)/10)
  amostra <- amostra_aleatorizada[((i*size_amostra)-(size_amostra-1)):(i*size_amostra)]
  Treino <- DB_Base[-amostra,]
  Teste <- DB_Base[amostra, ]
  met_lda <- lda(Classe ~ ., data = Treino)
  met_pred <- predict(met_lda, Teste)
  mae <- c(mae, mean(abs(as.integer(met_pred$class == 'Cammeo') - as.integer(Treino$Classe == 'Cammeo'))))
}

MAE=c(MAE, mean(mae))
MAE

#LDQ

#MAE=c()
mae=c()

for (i in 1:10){
  size_amostra <- as.integer(nrow(DB_Base)/10)
  amostra <- amostra_aleatorizada[((i*size_amostra)-(size_amostra-1)):(i*size_amostra)]
  Treino <- DB_Base[-amostra,]
  Teste <- DB_Base[amostra, ]
  met_qda <- qda(Classe ~ ., data = Treino)
  met_pred <- predict(met_qda, Teste)
  mae <- c(mae, mean(abs(as.integer(met_pred$class == 'Cammeo') - as.integer(Treino$Classe == 'Cammeo'))))
}

MAE=c(MAE, mean(mae))
MAE

# Regressão Logistica # A Resolver !!!!

#MAE=c()
mae=c()

for (i in 1:10){
  size_amostra <- as.integer(nrow(DB_Base)/10)
  amostra <- amostra_aleatorizada[((i*size_amostra)-(size_amostra-1)):(i*size_amostra)]
  Treino <- DB_Base[-amostra,]
  Teste <- DB_Base[amostra, ]
  m_glm <- glm(Classe ~ ., data = Treino, family = binomial)
  m_pred <- predict(m_glm, Teste, type = "response")
  glm.pred <- rep("Osmancik", 3429)
  glm.pred[m_pred > 0.5] = "Cammeo"

  mae <- c(mae, mean(abs(as.integer(glm.pred=="Cammeo")-as.integer(Teste$Classe == "Cammeo"))))
}
MAE=c(MAE, mean(mae))
MAE

#plot(MAE, ylim=c(.45, 1) , col='green', type='p',
#     pch=19, main='cross validation for the Rice',
#     ylab='mean absolute error')

#text(MAE, c('lda', 'qda', 'glm'), pos=c(3,3), cex=1.25, col="purple")


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
