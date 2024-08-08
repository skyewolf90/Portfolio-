## Install packages
install.packages("corpcor")
install.packages("GPArotation")
install.packages("psych")
install.packages("IDPmisc")

## Load Packages
library("corpcor") 
library("GPArotation") 
library("psych") 
library("IDPmisc")

Student <- read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/studentSurvey.csv")
View(Student)

#Area1-Area12 data
Student1 <- Student[, 31:42]
head(Student1)
# Test Assumptions
## Multicollinearity - looking for things > .9, there are none
Areamatrix1 <- cor(Student1 ) 
print(round(Areamatrix1, 2))
# Subsetting Data
Area1 <- Student[, 31:42]
head(Area1)

# Test Assumptions
## Multicollinearity - looking for things > .9, there are none
Areamatrix <- cor(Area1) 
print(round(Areamatrix, 2))

## Bartlett's test
cortest.bartlett(Area1)
#determinant test
det(Areamatrix)

## Trying without that last one since we didn't meet determinant
Area2 <- Student[, 31:42] 
Areamatrix2 <- cor(Area2)
det(Areamatrix2)
#Whether this data is suitable for factor analysis
no
#The appropriate number of factors for this data
## Factor Analysis
pcModel1 <- principal(Area1, nfactors=12, rotate="none") 
pcModel1
plot(pcModel1$values, type="b")
##2nd test
pcModel2 <- principal(Area1, nfactors = 2, rotate = "none") 
pcModel2

residuals <- factor.residuals(Areamatrix, pcModel2$loadings) 
residuals <- as.matrix(residuals[upper.tri(residuals)])
largeResid <- abs(residuals) > .05
sum(largeResid)
sum(largeResid/nrow(residuals))

print.psych(pcModel2, cut = .3, sort=TRUE)
print.psych(pcModel2, cut = .3, sort=TRUE)
##obligue
pcModel3 <- principal(Area2, nfactors = 3, rotate = "oblimin") 
print.psych(pcModel3, cut=.3, sort=FALSE)
#orthogonal
pcModel4 <- principal(Area2, nfactors = 3, rotate = "varimax") 
print.psych(pcModel4, cut=.3, sort=FALSE)
library("psych")
Student1$Area1_3r <- NA
Student1$Area1_3r[Student1$Area1_3 == 1] <- 5
Student1$Area1_3r[Student1$Area1_3 == 2] <- 4
Student1$Area1_3r[Student1$Area1_3 == 3] <- 3
Student1$Area1_3r[Student1$Area1_3 == 4] <- 2
Student1$Area1_3r[Student1$Area1_3 == 5] <- 1

Student1$Area1_5r <- NA
Student1$Area1_5r[Student1$Area1_5 == 1] <- 5
Student1$Area1_5r[Student1$Area1_5 == 2] <- 4
Student1$Area1_5r[Student1$Area1_5 == 3] <- 3
Student1$Area1_5r[Student1$Area1_5 == 4] <- 2
Student1$Area1_5r[Student1$Area1_5 == 5] <- 1

Student1$Area1_6r <- NA
Student1$Area1_6r[Student1$Area1_6 == 1] <- 5
Student1$Area1_6r[Student1$Area1_6 == 2] <- 4
Student1$Area1_6r[Student1$Area1_6 == 3] <- 3
Student1$Area1_6r[Student1$Area1_6 == 4] <- 2
Student1$Area1_6r[Student1$Area1_6 == 5] <- 1

Student1$Area2_1r <- NA
Student1$Area2_1r[Student1$Area2_1 == 1] <- 5
Student1$Area2_1r[Student1$Area2_1 == 2] <- 4
Student1$Area2_1r[Student1$Area2_1 == 3] <- 3
Student1$Area2_1r[Student1$Area2_1 == 4] <- 2
Student1$Area2_1r[Student1$Area2_1 == 5] <- 1

Student1$Area2_3r <- NA
Student1$Area2_3r[Student1$Area2_3 == 1] <- 5
Student1$Area2_3r[Student1$Area2_3 == 2] <- 4
Student1$Area2_3r[Student1$Area2_3 == 3] <- 3
Student1$Area2_3r[Student1$Area2_3 == 4] <- 2
Student1$Area2_3r[Student1$Area2_3 == 5] <- 1

Student1$Area2_4r <- NA
Student1$Area2_4r[Student1$Area2_4 == 1] <- 5
Student1$Area2_4r[Student1$Area2_4 == 2] <- 4
Student1$Area2_4r[Student1$Area2_4 == 3] <- 3
Student1$Area2_4r[Student1$Area2_4 == 4] <- 2
Student1$Area2_4r[Student1$Area2_4 == 5] <- 1
Student2 <- Student1[, c(1,2,4,8,11,12,13,14,15,16)]
alpha(goodArea)
alpha(badArea)
alpha(Student2)

#The best model fit for this data
#How the items group together into factors, if there is more than one factor indicated
#Whether the scale is considered reliable through inter-rater reliability
#Whether the scale is considered reliable through inter-item reliability