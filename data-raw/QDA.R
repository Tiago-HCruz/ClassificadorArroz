library(tidyverse)
library("MASS")
library(ClassificadorArroz)

#### QDA


modelo_analise <- qda(Classe ~ ., data= Rice_Teste, CV = F)

modelo_predict <- predict(modelo_analise,
                          Rice_Teste |>
                            dplyr::select(-Classe))

qda.class <- modelo_predict$class

tab2 <- table(qda.class, Rice_Teste$Classe)

#tab2

Rice_Treino <- Rice_Treino |>
  mutate(Classe = as.factor(Classe))

#Acuracia_QDA <- round((sum(diag(tab2))/sum(tab2)*100),2)
