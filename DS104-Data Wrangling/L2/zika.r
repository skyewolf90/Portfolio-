library(readr)
library(readxl)
ZikaColombia<-read_excel("C:/Users/Lenovo/Desktop/Data-Science-Program/DATASETS/ZikaColombia.xlsx")
ZikaUS<-read_excel("C:/Users/Lenovo/Desktop/Data-Science-Program/DATASETS/ZikaUS.xlsx")
Zika <- rbind(ZikaColombia, ZikaUS)
View(Zika)