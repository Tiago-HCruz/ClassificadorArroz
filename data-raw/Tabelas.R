library(tidyverse)

source("data-raw/LDA.r")
source("data-raw/QDA.r")

#usethis::use_data(Acuracia, overwrite = TRUE)

tab1 <- tab1 |>
  as.data.frame.matrix() |>
  as_tibble() |>
  mutate(LDA_Predita = c("Cammeo", "Osmancik")) |>
  dplyr::select("LDA_Predita", "Cammeo", "Osmancik")

tab2 <- tab2 |>
  as.data.frame.matrix() |>
  as_tibble() |>
  mutate(LDA_Predita = c("Cammeo", "Osmancik")) |>
  dplyr::select("LDA_Predita", "Cammeo", "Osmancik")

tab_LDA <- tab1
tab_QDA <- tab2
usethis::use_data(tab_LDA, overwrite = TRUE)
usethis::use_data(tab_QDA, overwrite = TRUE)

