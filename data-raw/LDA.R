library(tidyverse)
library("MASS")
library(ClassificadorArroz)

#### LDA

#attach(Rice)

modelo_analise <- lda(Classe~., data= Rice_Treino, CV = F)

#plot(modelo_analise)

#modelo_analise$means

modelo_predict <- predict(modelo_analise,
                          Rice_Teste |>
                            dplyr::select(-Classe))

lda.class <- modelo_predict$class

tab1 <- table(lda.class, Rice_Teste$Classe)

#tab1

Acuracia_LDA <- round((sum(diag(tab1))/sum(tab1)*100),2)

#klaR::partimat(Classe~., data=Rice_Treino, method="lda",
#               plot.matrix = TRUE#, imageplot = FALSE
#               )

