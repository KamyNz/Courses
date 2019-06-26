rm(list = ls())
library(pvclust)
library(ggplot2)
library(dplyr)

# Setting working directory
setwd("/Users/CamilaMV/Documents/CENICANA-temp/Courses/00_CABANA_Course1/")
main_dir = "/Users/CamilaMV/Documents/CENICANA-temp/Courses/00_CABANA_Course1/"

# Day 2
mi.arbol <- function(ni=5, nv=5, lambda=5, method="average"){
  
  # Function to produce a random dendrogram
  # ni - Number of individuals
  # nv - Number of variables
  # lambda - Poisson parameter
  hclust(dist(matrix(rpois(ni*nv, lambda=lambda), nrow=ni, ncol=nv, dimnames=list(LETTERS[1:ni], c(1:nv)))), method=method)
  
}

# Getting data from CabanaR
##### Box 2
# Run R and go to your 'CabanaR' directory
# Note that IN YOUR computer the next line may point to a different place!
load(paste0(main_dir,"from_Octavio/CabanaR/DummyExample.RData")) # Load some stuff

# Function info.sites
info.sites

# object dummy
my.dummy

# Using function info.sites with default setting and not default settings
info_sites_object_with_outmatrix_true = info.sites(x=my.dummy)
str(info_sites_object_with_outmatrix_true)
info_sites_object_with_outmatrix_true

# Step 1: Getting poison distribution for dendogram
# Understanding poison distribution 


# Step 2: Getting dendogram
dendogram1 = mi.arbol(ni = 5,nv = 5, lambda = 5,
                      method = "average")

plot(dendogram1)

# Step 3: Using function SNP.dist over result of info.sites
my.dummy.info = info.sites(x = my.dummy)
my.dummy.dist = SNP.dist(my.dummy.info)

# Step 3: Doing exercise with dummy data of sequences

# Step 4: 
hclust_complete = plot(hclust(my.dummy.dist,"complete"))
hclust_single = plot(hclust(my.dummy.dist,"single"))
hclust_average = plot(hclust(my.dummy.dist,"average"))
hclust_ward_D = plot(hclust(my.dummy.dist,"ward.D"))

# Step 5: Exploring objects of function hclust
a1 <- mi.arbol()
# putting seed
set.seed(1959)
plot(mi.arbol(method = "complete"))
set.seed(1959)
plot(mi.arbol(method = "ward.D"))

# using a2
a2<-a1
str(a2)

## Example, of using sample.inc => function that 
## allows me to get a sample of all dendogram

# Input 
#u.ac - Lista unicos 
#ac - primeras dos letras de cada accesion
#which(ac==u.ac[2])

for(i in 1:length(u.ac)){
  sample.temp = sample(ac==u.ac[i],size = 1)
  print(sample.temp)
}

sample.inc <- function(){}
sample.inc <- edit(sample.inc,editor = "emacs")



