library(tidyverse)
library("MASS")
library(ClassificadorArroz)

modelo_analise <- lda(Classe~., data= Rice_Treino, CV = F)

plot(modelo_analise, type="both")

#Histograma_LDA_Class.pdf"
