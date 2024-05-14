library(tidyverse)
library("MASS")
library(ClassificadorArroz)


#Rice_ <- DB_Treino_Teste(2024, DB_Base, 0.8, 0.2)

#### QDA

#attach(Rice)

modelo_analise <- qda(Classe ~ ., data= Rice_Teste, CV = F)

#  plot(modelo_analise)

#modelo_analise$means

modelo_predict <- predict(modelo_analise,
                          Rice_Teste |>
                            dplyr::select(-Classe))

qda.class <- modelo_predict$class

tab1 <- table(qda.class, Rice_Teste$Classe)

#tab1

Acuracia_QDA <- round((sum(diag(tab1))/sum(tab1)*100),2)

#klaR::partimat(Classe~., data=Rice_Treino, method="qda",
#               plot.matrix = TRUE#, imageplot = FALSE
#)

