# O código a seguir para criar um dataframe e remover as linhas duplicadas sempre é executado e age como um preâmbulo para o script:

# dataset <- data.frame(undefined, undefined.1, undefined.2, undefined.3, undefined.4, undefined.5, undefined.6, undefined.7)
# dataset <- unique(dataset)

# Cole ou digite aqui seu código de script:
library(tidyverse)
library("MASS")
library(ClassificadorArroz)

Rice_Treino <- Rice_Treino |>
  mutate(Classe = as.factor(Classe))

klaR::partimat(Classe~., data=Rice_Treino, method="qda",
               plot.matrix = TRUE,
               image.colors = c("#19ABA9", "#FD4755"),
               col.wrong = "#edebeb", col.correct = "#F6A96C")
