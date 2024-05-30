# Classificador de Arroz

O Pacote tem o intuito de auxiliar na demonstração e investigação dos modelos da Análise Descritiva Linear (LDA), Análise Descritiva Quadrática (QDA) e Regressão Logística para classificar a classe do arroz de acordo com as suas variáveis de medidas em pixels. Desse modo, o pacote traz consigo um banco de dados base com observações do arroz e funções que obtém um subconjunto do mesmo, dividindo o banco de dados em Treino e Teste, além disso, traz contigo diversos exemplos que podem ser  utilizados nesse banco de dados.

O pacote ser instalado no software R pelo comando "devtools::install_github("Tiago-HCruz/PGVendasVG", force = TRUE)"

Para esse pacote, foi utilizada o banco de dados "Rice (Cammeo and Osmancik)" que pode-se encontrar na seguinte referência logo abaixo:

Rice (Cammeo and Osmancik). (2019). UCI Machine Learning Repository. https://doi.org/10.24432/C5MW4Z.

Segue a seguir as definições das variaveis:

* Area: o número de pixels dentro dos limites do grão de arroz
* Area_Convexa:  a contagem de pixels da menor casca convexa da região formada pelo grão de arroz.
* Classe: Qual classificação o arroz pertence, Cammeo ou Osmancik.
* Excentricidade: Mede o quão redonda é a elipse do grão de arroz.
* Extensao: proporção entre a região formada pelo grão de arroz e a caixa delimitadora.
* Maior_Comprimento: A distancia mais longa que pode ser traçada no grão de arroz, ou seja, a altura.
* Menor_Comprimento: A distancia menos longa que pode ser traçada no grão de arroz, ou seja, o comprimento.
* Perímetro: Calculo da circunferência calculada pela distância entre os pixels ao redor dos limites do grão de arroz.
