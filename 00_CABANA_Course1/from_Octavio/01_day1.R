library(pvclust)
library(ggplot2)
library(dplyr)

# Setting working directory
setwd("/Users/CamilaMV/Documents/CENICANA-temp/Courses/00_CABANA_Course1/")
main_dir = "/Users/CamilaMV/Documents/CENICANA-temp/Courses/00_CABANA_Course1/"

# Getting data from CabanaR
##### Box 2
# Run R and go to your 'CabanaR' directory
# Note that IN YOUR computer the next line may point to a different place!
load(paste0(main_dir,"from_Octavio/CabanaR/DummyExample.RData")) # Load some stuff

# You can list the objects currently in your environment with
ls()

# The object that we will be abalysing:
my.dummy
class(my.dummy)
length(my.dummy)
my.dummy[1]
my.dummy[1] == my.dummy[2] # Are those IDENTICAL?

# Let's split each one of the 4 sequences in my.dummy into 
#characters: 5 > 
temp <- strsplit(x=my.dummy, split="") # Let's try 

temp[[1]][1]
temp[[2]][1]
temp[[3]][1]
temp[[4]][1]

# Function info.sites
info.sites

# object dummy
my.dummy

# Using function info.sites with default setting and not default settings
info_sites_object_with_outmatrix_true = info.sites(x=my.dummy)
str(info_sites_object)

info_sites_object_with_outmatrix_false = info.sites(x=my.dummy,
                                                    out.as.matrix = FALSE)
str(info_sites_object_with_outmatrix_false)




