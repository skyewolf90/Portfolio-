install.packages("tidyverse")
library(gmodels)
library(tidyverse)
library(dplyr)


loans <- read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/loans.csv")
head("loans")
colnames(loans)
 
# Does the term of the loan influence loan status? If so, how?

CrossTable(loans$term,loans$loan_status, fisher=TRUE, chisq = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")
## p-value is significant. Loan term does influence loan status.
## 36 month terms look more likely to be paid back

#How has the ability to own a home changed from 2007 to 2011?


loans1 <- separate(loans, Date, c("Ignore", "Issue_Month", "Issue_Year"), sep="/")
head(loans1)
loans1$Issue_YearR <- NA

loans1$Issue_YearR[loans1$Issue_Year == "2007"] <- 0
loans1$Issue_YearR[loans1$Issue_Year == "2011"] <- 1

loans1$RentvOwn <- NA

loans1$RentvOwn[loans1$home_ownership == "rent" <- 0]
loans1$RentvOwn[loans1$home_ownership == "own" <- 1]
head(loans1)

CrossTable(loans1$RentvOwn,loans1$Issue_MonthR, fisher=TRUE, chisq = TRUE, mcnemar = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")
## p-value says there is a difference
## standardized residuals shows that ratio of rent:own is similar from 2007 to 2011


Goodness of Fit Chi-Square

loans %>% group_by(loan_status) %>% summarize(count=n())
observed = c(3382, 502, 18173)
expected = c(0.1,0.75,0.15)
chisq.test(x = observed, p = expected)

## the p-value is significant difference between our sample and population