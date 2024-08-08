library("caret")
library("magrittr")
library("dplyr")
library("tidyr")
library("lmtest")
library("popbio")
library("e1071")
#install.packages("lmtest")
#install.packages("popbio")



minerals <- read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/minerals.csv")
head(minerals)

table(minerals$Antimony)

minerals$AntimonyR <- NA
minerals$AntimonyR[minerals$Antimony  < 1] <- 0
minerals$AntimonyR[minerals$Antimony >= 1] <- 1
head(minerals)

Model = glm(AntimonyR ~ Gold, data = minerals, family = binomial)
summary(Model)

probabilities <- predict(Model, type = "response")
minerals$Predicted <- ifelse(probabilities > .5, "pos", "neg")
head(minerals)

minerals$PredictedR <- NA
minerals$PredictedR[minerals$Predicted == 'pos'] <- 1
minerals$PredictedR[minerals$Predicted == 'neg'] <- 0
head(minerals)

minerals$AntimonyR <- as.factor(minerals$AntimonyR)
minerals$Gold <- as.factor(minerals$Gold)
str(minerals)

conf_mat <- caret::confusionMatrix(minerals$AntimonyR, minerals$Gold)
conf_mat

minerals$PredictedR <- as.numeric(minerals$PredictedR)
minerals$Gold <- as.numeric(minerals$Gold)

minerals1 <- minerals %>% 
  dplyr::select_if(is.numeric)

predictors <- colnames(minerals1)

minerals2 <- minerals1 %>%
  mutate(logit=log(probabilities/(1-probabilities))) %>%
  gather(key= "predictors", value="predictor.value", -logit)

ggplot(minerals2, aes(logit, predictor.value))+
  geom_point(size=.5, alpha=.5)+
  geom_smooth(method= "loess")+
  theme_bw()+
  facet_wrap(~predictors, scales="free_y")

plot(Model$residuals)

dwtest(Model, alternative="two.sided")

infl <- influence.measures(Model)
summary(infl)

there is a 95% chance that if there are high traces of antimony, there will be gold close by