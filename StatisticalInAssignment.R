#Exponential Distribution
library(ggplot2)
expdist<-rexp(1000, 0.2) 
distmean<-mean(expdist)
distvar<-var(expdist)
distsd<-sd(expdist)


sampledist = NULL
for (i in 1 : 1000) sampledist = c(sampledist, mean(rexp(40,0.2)))
samplemean<-mean(sampledist)
samplevar<-var(sampledist)
samplesd<-sd(sampledist)

distdf<-rbind(rbind(data.frame(fill="blue", Distribution=expdist, Type="Original",Average=distmean,distlow=min(expdist),disthigh=max(expdist),distlowerq=quantile(expdist,0.25),distupperq=quantile(sampledist,0.75)),
                    data.frame(fill="green", Distribution=sampledist,Type="Sample",Average=samplemean,distlow=min(sampledist),disthigh=max(sampledist),distlowerq=quantile(sampledist,0.25),distupperq=quantile(sampledist,0.75))))

ggplot(distdf, aes(x=Distribution, fill=fill)) +
  geom_histogram(binwidth=1, colour="black") +
  facet_grid(.~Type)

ggplot(distdf, aes(x=Type,y=Distribution, fill=fill)) +
  geom_boxplot(aes(ymin = distlow, ymax=disthigh,lower = distlowerq, middle = Average, upper = distupperq),stat="identity")

