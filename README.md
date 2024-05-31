# Classificador de Arroz

O Pacote tem o intuito de auxiliar na demonstração e investigação dos modelos da Análise Discriminante Linear (LDA), Análise Discriminante Quadrática (QDA) e Regressão Logística para classificar a classe do arroz de acordo com as suas variáveis de medidas em pixels. Desse modo, o pacote traz consigo um banco de dados base com observações do arroz e funções que obtém um subconjunto do mesmo, dividindo o banco de dados em Treino e Teste, além disso, traz contigo diversos exemplos que podem ser utilizados como inspiração nesse banco de dados.

## Instalação do Pacote
O pacote pode ser instalado no software R pelo comando `devtools::install_github("Tiago-HCruz/PGVendasVG", force = TRUE)`

## Banco de Dados
Para esse pacote, foi utilizada o banco de dados "Rice (Cammeo and Osmancik)" que pode-se encontrar na seguinte referência logo abaixo:  
Rice (Cammeo and Osmancik). (2019). UCI Machine Learning Repository. https://doi.org/10.24432/C5MW4Z.

Ademais, para consultar o banco de dados no pacote temos duas maneiras, uma pela função `DB_Rice()` e pelo objeto `DB_Base`.
Dessa maneira, a seguir segue as definições das variáveis:  
* **Area**: o número de pixels dentro dos limites do grão de arroz
* **Area_Convexa:**  A contagem de pixels da menor casca convexa da região formada pelo grão de arroz.
* **Classe:** Qual classificação o arroz pertence, Cammeo ou Osmancik.
* **Excentricidade:** Mede o quão redonda é a elipse do grão de arroz.
* **Extensao:** proporção entre a região formada pelo grão de arroz e a caixa delimitadora.
* **Maior_Comprimento:** A distância mais longa pode ser traçada no grão de arroz, ou seja, a altura.
* **Menor_Comprimento:** A distância menos longa que pode ser traçada no grão de arroz, ou seja, o comprimento.
* **Perímetro:** Cálculo da circunferência calculada pela distância entre os pixels ao redor dos limites do grão de arroz.

*Obs.: Para auxiliar a trabalhar com o banco de dados, pode-se utilizar o objeto `yaml_listas` que contém listado os banco de dados e as variáveis*

## Funções 
Nesse pacote foi criado funções para auxiliar na análise dos modelos a classificar o arroz, seja as funções a seguir: 
* **DB_Rice:** Carrega um Banco de dados que está armazenado no servidor do SQL do pacote.
* **DB_Treino_Teste:** Essa função tem como objetivo subdividir o banco de dados original em dois, Banco de dados treino e teste. Aliás, vale reparar que deve-se definir a porcentagem de dados que deve ser colocada nos dois subconjunto de dados.
* **Server_Rice:** Uma função que abre o servidor SQL que por sua vez, existem diversos banco de dados sobre o Arroz.

## Exemplos
No pacote pode se encontrar exemplos para auxiliar ou mesmo motivar em algumas ideias.
* **CrossOver_EMA:** Erro Médio Quadrático dos modelos LDA, QDA e Regressão Linear. Obtido pelo método da Validação cruzada. 
* **Quant_Rice:** Quantidade de Arroz no banco de dados geral, treino e teste.
* **Rice_Teste:** Banco de dados teste, utilizado para modelar de acordo com a metodologia. Para obter, foi utilizado a semente "2024" retirado aleatoriamente 20% dos dados original. 
* **Rice_Treino:** Banco de dados treino, utilizado para obter resultado a partir do modelagem feito no banco de dados teste. Para obter, foi utilizado a semente "2024" retirado aleatoriamente 80% dos dados original, vale ressaltar que as observações não se repeter do banco de dados teste. 
* **tab_LDA:** Matriz de confusão do modelo Análise Discriminante Linear.
* **tab_QDA:** Matriz de confusão do modelo Análise Discriminante Quadrática.
