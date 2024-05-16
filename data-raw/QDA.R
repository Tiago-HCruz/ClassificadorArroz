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

tab2 <- table(qda.class, Rice_Teste$Classe)

#tab2

#Rice_Treino <- Rice_Treino |>
#  mutate(Classe = as.factor(Classe))

Acuracia_QDA <- round((sum(diag(tab2))/sum(tab2)*100),2)

#klaR::partimat(Classe~., data=Rice_Treino, method="qda",
#               plot.matrix = TRUE)

