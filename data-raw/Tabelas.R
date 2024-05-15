library(tidyverse)

source("data-raw/LDA.r")
source("data-raw/QDA.r")

Acuracia <- tibble(LDA = Acuracia_LDA,
                   QDA = Acuracia_QDA)

#usethis::use_data(Acuracia, overwrite = TRUE)

tab1 |>
  as.data.frame.matrix() |>
  as_tibble()

tab2 |>
  as.data.frame.matrix() |>
  as_tibble()
