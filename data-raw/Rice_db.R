library(RSQLite)
library(tidyverse)

source("data-raw/Server.R")

if(!"DB_Base" %in% dbListTables(conexao_sql)){
  dbWriteTable(
    conn = conexao_sql,
    name = "DB_Base",
    value = farff::readARFF("Banco_de_Dados/Rice_Cammeo_Osmancik.arff") |>
      as_tibble() |>
      mutate(Area = as.integer(Area)) |>
      rename(Perimetro = Perimeter,
             `Maior_Comprimento` = Major_Axis_Length,
             `Menor_Comprimento` = Minor_Axis_Length,
             `Excentricidade` = Eccentricity,
             `Area_Convexa` = Convex_Area,
             `Extensao` = Extent,
             `Classe` = Class) |>
      dplyr::select("Classe", 1:7)
  )
}

#dbExecute(conexao_sql, paste("DROP TABLE DB_Base"))

#usethis::use_data_raw("Rice_db") #Cria um R script em data-raw

DB_Base <- tbl(conexao_sql, "DB_Base") |> as_tibble()

usethis::use_data(DB_Base, overwrite = TRUE)

dbDisconnect(conexao_sql)


