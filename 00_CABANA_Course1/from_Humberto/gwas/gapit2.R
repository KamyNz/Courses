#Gapit
setwd("~/courses/InifapSNP/NotasDia4")
#Cargar paquetes
library('MASS') # required for ginv
library(multtest)
library(gplots)
library(compiler) #required for cmpfun
library("scatterplot3d")
library(ape)
library(EMMREML)
#Gapit
source("EmmaSource.R")
source("GapitSource.R")
#Importar archivos
myY  <- read.table("datos/mdp_traits.txt", head = TRUE)
myG <- read.delim("datos/mdp_genotype_test.hmp.txt", head = FALSE)
#Correr GAPIT
myGAPIT <- GAPIT(
Y=myY,
G=myG,
PCA.total=3,
)
