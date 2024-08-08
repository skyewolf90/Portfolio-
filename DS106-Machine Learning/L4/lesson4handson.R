IQ <-read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/IQ.csv")
head(IQ)


#PART 1

FitAll = lm(IQ ~ ., data = IQ)
summary(FitAll)

step(FitAll, direction = 'backward')

IQ = 90.733 + (-1.965) _ Test1 + 1.649 _ Test2 + 3.789 \* Test4


###Which model is the best? Why? test1,test2 and test4 they were found significate through backward elimintion, The lower AIC the better the model.


fitsome = lm(IQ ~ Test1 + Test2 + Test4, data = IQ)
summary(fitsome)

###From the best model, what is the adjusted R2 value and what does it mean? R2=0.2158 r2 measures the strength of the relationship between your model and the dependent variable 

##From the best model, how does each variable influence IQ?IQ = 90.733 + (-1.965) _ Test1 + 1.649 _ Test2 + 3.789 \* Test4



# PART 2


StepWise <-read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/stepwiseRegression.csv")
head(StepWise)

##run all stepwise
###WHICH stepwise did best? the all came out with the exact same outcome.SHOCKING!!!!
####WHICH STEPWISE would I choose? the hybrid, both are done at the same time it's genius

FitAll = lm(Y ~ ., data = StepWise)
summary(FitAll)
step(FitAll, direction = 'backward')
Start:AIC=220.74     X2           X4           X6          X10          X11          X12  
AIC=213.38     -0.06975      2.80806      5.98660    -11.97829     -0.13102    -25.98121 


fitstart = lm(Y ~ 1, data = StepWise)
summary(fitstart)
step(fitstart, direction = 'forward', scope = (~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12))
Start:AIC=1332.26    X6           X4          X12          X10           X2          X11  
AIC=213.38           5.98660      2.80806    -25.98121    -11.97829     -0.06975     -0.13102


step(fitstart, direction="both", scope=(~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12))
Start:  AIC=1332.26 X6           X4          X12          X10           X2          X11 
AIC=213.38          5.98660      2.80806    -25.98121    -11.97829     -0.06975     -0.13102