library(tidyverse)
library("MASS")
library(ClassificadorArroz)


Rice_ <- DB_Treino_Teste(2024, DB_Base, 0.8, 0.2)

#### QDA

#attach(Rice)

modelo_analise <- qda(Classe ~ ., data= Rice_$train, CV = F)

#  plot(modelo_analise)

modelo_analise$means

modelo_predict <- predict(modelo_analise,
                          Rice_$test |>
                            dplyr::select(-Classe))

qda.class <- modelo_predict$class

tab1 <- table(qda.class, Rice_$test$Classe)

tab1

round((sum(diag(tab1))/sum(tab1)*100),2)

klaR::partimat(Classe~., data=Rice_$train, method="qda",
               plot.matrix = TRUE#, imageplot = FALSE
)

