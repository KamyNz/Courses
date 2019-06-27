#Exercises Further comments on genetic diversity
sim.p<-function(n){
	a<-list()
	for (i in 1:n){
		x<-floor(runif(1)*10)+1 #Decide number of classes
		y<-runif(x) #Random probabilities
		y<-y/sum(y) #Normalize
		a[[i]]<-y}
		a
	}
x<-sim.p(10000)
#Shannon diversity
#x log x
MyLog2p<-function(x){if(x==0) 0 else x*log(x,2)}
entropy<-function(x){-sum(sapply(x,MyLog2p),na.rm=T)}
#Gini-Simpson index
gs<-function(x){1-sum(x^2)}
#Allele richness
ar<-function(x){length(x)}
Entropy<-lapply(x,entropy)
Entropy<-unlist(Entropy)
GS<-lapply(x,gs)
GS<-unlist(GS)
ExpEnt<-2^Entropy
AR<-lapply(x,ar)
AR<-unlist(AR)
pairs(cbind(Entropy,ExpEnt,GS,AR))

