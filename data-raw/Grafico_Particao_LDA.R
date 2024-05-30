# O código a seguir para criar um dataframe e remover as linhas duplicadas sempre é executado e age como um preâmbulo para o script:

# dataset <- data.frame(Area, Area_Convexa, Classe, Excentricidade, Extensao, Maior_Comprimento, Menor_Comprimento, Perimetro, Area.1, Area_Convexa.1, Classe.1, Excentricidade.1, Extensao.1, Maior_Comprimento.1, Menor_Comprimento.1)
# dataset <- unique(dataset)

# Cole ou digite aqui seu código de script:

library(tidyverse)
library("MASS")
library(ClassificadorArroz)

#### LDA

Rice_Treino <- Rice_Treino |>
  mutate(Classe = as.factor(Classe))

klaR::partimat(Classe~., data=Rice_Treino, method="lda",
               plot.matrix = TRUE#, imageplot = FALSE
               ,image.colors = c("#19ABA9", "#FD4755"),
               col.wrong = "#edebeb", col.correct = "#F6A96C"
)



