library(pROC)
library(ggplot2)
library(tidyverse)
library(ROCR)
library("MASS")
library(ClassificadorArroz)

modelo_analise <- lda(Classe~., data= Rice_Treino, CV = F)

modelo_predict <- predict(modelo_analise,
                          Rice_Teste |>
                            dplyr::select(-Classe))

arred <- function(x){
  x <- scales::number(x, decimal.mark = ",",
                      big.mark = ".", accuracy = 0.001)
  return(x)
}

# Curva ROC LDA

modelo_analise <- lda(Classe~., data= Rice_Treino, CV = F)

modelo_predict <- predict(modelo_analise,
                          Rice_Teste |>
                            dplyr::select(-Classe))

curva_ROC_LDA <- pROC::roc(response = Rice_Teste$Classe,
                           predictor = modelo_predict$posterior[,2],
                           ci = T,
                           direction = "<")

youden_LDA <- pROC::coords(curva_ROC_LDA,
                           x = "best",
                           ret = c("threshold",
                                   "specificity",
                                   "sensitivity"),
                           best.method = "youden")

auc_LDA <- pROC::ci.auc(curva_ROC_LDA,
                        method = "bootstrap")

AUC_LDA <- paste0("LDA ","(","AUC = ",
                  arred(auc_LDA[2]), " [",
                  arred(auc_LDA[1]), "; ",
                  arred(auc_LDA[3]), "]",")")

ponto_LDA <- paste0(arred(youden_LDA$threshold), " (",
                    arred(youden_LDA$specificity), "; ",
                    arred(youden_LDA$sensitivity), " )")

# Feito por ggplot2

pROC::ggroc(curva_ROC_LDA, color = "#19ABA9") +
  geom_abline(slope = 1, intercept = 1, color = "grey60",
              linetype = "dashed")+
  labs(y = "Sensibilidade", x = "1-Especifidade")+
  #geom_point(aes(y = youden_LDA$sensitivity, x = youden_LDA$specificity),
  #           size = 1.8, color = "#FD4755")+
  annotate(geom = "text", label = AUC_LDA, color = "#19ABA9",
           y = 0, x = 0, size = 5, hjust =0.99, vjust=-0.01)+
  #annotate(geom = "text", label = ponto_LDA,
  #         y = youden_LDA$sensitivity, x = youden_LDA$specificity, color="#FD4755",
  #         size = 3.2, hjust = -0.05, vjust = 1.5)+
  scale_y_continuous(labels = scales::number_format(decimal.mark = ","))+
  scale_x_reverse(labels = scales::number_format(decimal.mark = ",")) +
  scale_x_reverse(expand = c(0.01, 0.001),breaks= seq(from = 0 , to = 1 ,by = 0.2),limits = c(1,-0.01),
                  labels = c("1,00","0,80","0,60","0,40","0,20","0,00"))+
  theme_classic()
