Quant_Rice |>
  pivot_longer(!Classe, names_to = "Dados", values_to = "Quantidade") |>
  ggplot(aes(x = Dados, y = Quantidade, fill = Classe))+
  geom_col(position = "dodge") +
  labs(title = "Grafico de barras entre os Banco de dados")
