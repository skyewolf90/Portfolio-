library("ggplot2")

nonlinear <-read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/nonlinear.csv")
head(nonlinear)
## graphing X1 and Y1

quadPlot <- ggplot(nonlinear, aes(x = X1, y=Y1)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot

X1sq <- nonlinear$X1^2
quadModel <- lm(nonlinear$Y1~nonlinear$X1+X1sq)
summary(quadModel)


##graphing X2 and Y2
quadPlot <- ggplot(nonlinear, aes(x = X2, y=Y2)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot

X2sq <- nonlinear$X2^2
quadModel <- lm(nonlinear$Y2~nonlinear$X2+X2sq)
summary(quadModel)

##both graphs model a Quadratic Relationship!
###Looking at the overall F-statistic shown on the bottom and associated p-value, this quadratic model is significant! 