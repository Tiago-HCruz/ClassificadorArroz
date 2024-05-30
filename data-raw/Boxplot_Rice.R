DB_Rice(yaml_listas$Tabelas[1]) |>
  select(Classe, Area) |>
  ggplot(aes(y = Area, fill = Classe)) +
  geom_boxplot() +
  labs(title = "Boxplot da area do arroz",
       y = "Area", fill = "Arroz",
       caption = "Contém todas as observações")+
  theme_bw()


DB_Rice(yaml_listas$Tabelas[1]) |>
  select(Classe, Perimetro) |>
  ggplot(aes(y = Perimetro, fill = Classe)) +
  geom_boxplot() +
  labs(title = "Boxplot da area do arroz",
       y = "Perimetro", fill = "Arroz",
       caption = "Contém todas as observações")+
  theme_bw()
