## code to prepare `yaml_listas` dataset goes here
library(yaml)

yaml_listas <- read_yaml("yaml/info_listas.yaml")

usethis::use_data(yaml_listas, overwrite = TRUE)
