#Package installation
#Humberto Reyes
#From Bioconductor
source("https://bioconductor.org/biocLite.R")
#biocLite("impute")
#Packages from CRAN
#install.packages(c("ggplot2", "pvclust","dplyr"), dependencies=T)

library(pvclust)
library(ggplot2)
library(dplyr)

# Setting working directory
setwd("/Users/CamilaMV/Documents/CENICANA-temp/Courses/00_CABANA_Course1/")

# Making searches
?? Fisher # Putting regular expression

nan_object = 0/0
str(nan_object)

is.na(nan_object)
is.infinite(nan_object)
is.finite(nan_object)

# Using data(CO2)
data(CO2)
df_co2 = CO2

# Factor nominal
fnominal = factor(rep(letters[1:3],each=3))
fnominal
# Factor ordinal
fordinal = factor(rep(letters[1:3],each=3),order=T)
fordinal

# Data Frames are a class of objects that can have columns with numbers or factors.
# Let's create a data.frame
? data.frame
temp.df <- data.frame(Treatment=rep(c("A", "B"), each=10), 
                      Result=c(rnorm(10, 10), rnorm(10, 11)))
summary(temp.df) # Note that your results for "Result" will be different!
tapply(temp.df$Result, temp.df$Treatment, summary)
summary(aov(Result ~ Treatment, data=temp.df)) # Summary of ANOVA
boxplot(Result ~ Treatment, data=temp.df) # Result not shown

## function, getAnywhere (to get code of a function in R)
getAnywhere("aov") #Retrieve an R Object, Including from a Namespace
argsAnywhere(aov)

# To edit funcitons in the system, and recalling it to new function
mi.aov <- edit(aov)







