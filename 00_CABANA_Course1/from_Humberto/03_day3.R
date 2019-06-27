rm(list = ls())
library(pvclust)
library(ggplot2)
library(dplyr)
library(impute)


# Setting working directory
#setwd("/Users/CamilaMV/Documents/CENICANA-temp/Courses/00_CABANA_Course1/")
main_dir = "/Users/CamilaMV/Documents/CENICANA-temp/Courses/00_CABANA_Course1/"
setwd(paste0(main_dir,"from_Humberto/cabana/"))

# Step 0:
#Import data
dat<-read.csv("tables/CleanWheat.csv",head=T)
dim(dat)

# Step 1: Shannon Diversity

#A function for Shannon entropy
#x log x
MyLog2p<-function(x){if(x==0) 0 else x*log(x,2)}
#The entropy function
entropy<-function(x){-sum(sapply(x,MyLog2p),na.rm=T)}
#Remember that alleles are in rows
#and wheat lines are in columns
#Take the row averages as allelic frequencies
freq<-apply(dat[-c(1,2)],1,function(x) mean(x,na.rm=T))
#Per locus entropy
a<-NA;length(a)<-dim(dat)[1]/2;for(i in 1:length(a)){a[i]<-entropy(freq[c(2*i-1,2*i)])}
head(a)

#Distribution of Shannon diversities across loci
hist(a,xlab="Shannon diversity",col="green",main="Histogram of Shannon diversity")

###########
# Round 2
###########

# Step 1: #Prepare a data subset for the workshop
sample<-dat[c(1:102)] #First 100 lines
dim(sample)

#Clean the sample: Only informative loci, with a maximum NA rate of 50%
#Use selector.R (by HR)
source("selector.R")
sample<-selector(sample,na.rate=0.5)
dim(sample)

# Step 2: Average Distance
#Average distance
sam<-sample[-c(1,2)] #Take identifiers out

#Wheat lines are in columns
#We need to transpose
sam<-t(sam) #Important: dist calculates distance between rows
d<-dist(sam) #Distance object
mean(d) #Average distance

# Step 3: Principal component Analysis
library(impute)
for.pc<-sample[-c(1,2)]
imputed.for.pc<-impute.knn(as.matrix(for.pc))
imputed.for.pc<-imputed.for.pc$data

# Comparing non imputed and imputed
for.pc[1:10,1:10]
# imputed 
imputed.for.pc[1:10,1:10]

imputed.for.pc<-t(imputed.for.pc)
#Principal components
pc<-prcomp(imputed.for.pc)
names(pc)
plot(pc$x[,1],pc$x[,2],col="red",xlab="PC1",ylab="PC2")

#Which are those isolated lines?
x<-as.data.frame(pc$x)
a<-x[x$PC1<-4 & x$PC2>4,]
row.names(a)
