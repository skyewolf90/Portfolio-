library("rcompanion")
library("car")
library("Idpmise")
library('dplyr')
install.packages("car")

YouTubeChannels <- read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/YouTubeChannels.csv")


# Testing assumptions

# Normality
plotNormalHistogram(YouTubeChannels$Video.views)

#Square root it
YouTubeChannels$Video.viewsSQRT <- sqrt(YouTubeChannels$Video.views)
plotNormalHistogram(YouTubeChannels$Video.viewsSQRT)

#Better
YouTubeChannels$Video.viewsLOG <- log(YouTubeChannels$Video.views)
plotNormalHistogram(YouTubeChannels$Video.viewsLOG)
#Log went too far, stick with SQRT

# Homogeneity of Variance
bartlett.test(Video.viewsSQRT ~ Grade, data=YouTubeChannels)
# Does not meet the assumption for homogeneity of variance

# Do the Test, with unequal variance
ANOVA1 <- lm(Video.viewsSQRT ~ Grade, data=YouTubeChannels)
Anova(ANOVA1, Type="II", white.adjust=TRUE)

# Do the Post Hocs with unequal variance
pairwise.t.test(YouTubeChannels$Video.viewsSQRT, YouTubeChannels$Grade, p.adjust="bonferroni", pool.sd = FALSE)

# Find means and draw conclusions
YouTubeChannelsMeans <- YouTubeChannels %>% group_by(Grade) %>% summarize(Mean = mean(Video.views))
# All grades significantly differ from all other grades in the number of views they receive, with the higher grades typically getting more views.