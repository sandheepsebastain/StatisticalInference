data("ToothGrowth")
summary(ToothGrowth)

data1<-ToothGrowth[,c("dose","len")]
hist(data1$len)