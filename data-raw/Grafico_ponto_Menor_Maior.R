
DB_Rice(yaml_listas$Tabelas[1]) |>
  select(Classe, Maior_Comprimento, Menor_Comprimento) |>
  ggplot(aes(x = Maior_Comprimento, y = Menor_Comprimento, colour = Classe)) +
  geom_point()+
  labs(title = "Gráfico do arroz entre os comprimentos",
       x = "Maior", y = "Menor", colour = "Arroz",
       caption = "Contém todas as observações")+
  theme_bw()

DB_Rice(yaml_listas$Tabelas[2]) |>
  select(Classe, Maior_Comprimento, Menor_Comprimento) |>
  ggplot(aes(x = Maior_Comprimento, y = Menor_Comprimento, colour = Classe)) +
  geom_point()+
  labs(title = "Gráfico do arroz entre os comprimentos",
       x = "Maior", y = "Menor", colour = "Arroz",
       caption = "Contém dados teste")+
  theme_bw()

DB_Rice(yaml_listas$Tabelas[3]) |>
  select(Classe, Maior_Comprimento, Menor_Comprimento) |>
  ggplot(aes(x = Maior_Comprimento, y = Menor_Comprimento, colour = Classe)) +
  geom_point()+
  labs(title = "Gráfico do arroz entre os comprimentos",
       x = "Maior", y = "Menor", colour = "Arroz",
       caption = "Contém dados treino")+
  theme_bw()
