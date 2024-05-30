library(tidyverse)
library("MASS")
library(ClassificadorArroz)

#### LDA

modelo_analise <- lda(Classe~., data= Rice_Treino, CV = F)

#modelo_analise$means

modelo_predict <- predict(modelo_analise,
                          Rice_Teste |>
                            dplyr::select(-Classe))

lda.class <- modelo_predict$class

tab1 <- table(lda.class, Rice_Teste$Classe)

#Acuracia_LDA <- round((sum(diag(tab1))/sum(tab1)*100),2)

