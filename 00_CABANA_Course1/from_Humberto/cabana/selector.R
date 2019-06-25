#Select informative loci and with a maximum na.rate of NA rate
#data is (alele x accession)
selector<-function(data,na.rate){
#Check NAs
myfna<-function(x)sum(is.na(x))
nasM<-apply(data[-c(1,2)],1,myfna)
#Rate of NAs
nasM<-nasM/dim(data[-c(1,2)])[2]
#Rate on the first allele of each marker
x<-seq(1,length(nasM),2)
nasM1<-nasM[x]
#Select with a maximum rate = na.rate
selec<-x[nasM1<=na.rate]
selec<-c(selec,selec+1) #Both alleles of each locus
selec<-sort(selec)
data<-data[selec,]
####
#Noninformative loci
check.i<-function(x)var(as.numeric(x),na.rm=T)
checker<-apply(data[-c(1,2)],1,check.i)
#Variance on the first allele of each marker
x<-seq(1,length(checker),2)
checker<-checker[x]
#Select informative
selec<-x[checker>0]
selec<-c(selec,selec+1) #Both alleles of each locus
selec<-sort(selec)
data<-data[selec,]
data
}