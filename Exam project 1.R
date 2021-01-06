#Dataset
library(readxl)
data<-read_excel(file.choose())
dim(data)
colnames(data)


#To consider only the variables involved in the analysis
data1<-data[,c(2,3,4,5,6,7)]
colnames(data1)
head(data)

#Multiple correspondence analysis (without Greenacre's adjustment of inertias)
library(ca)
an.1<-mjca(data1, supcol=1, lambda="Burt")
an.1
#K* principal axes
an.1$sv
1/5
an.1$sv > 1/5


#Multiple correspondence analysis (Greenacre's adjustment of inertias)
an<-mjca(data1,supcol=1)
an
summary(an)

# two-dimensional plots with the principal coordinates for the first two axes 
# with the labels for the active variables only
plot(an,what=c("none","active"))

# with the labels for the illustrative variables only
plot(an,what=c("none","passive"))

# with the labels for all variables 
plot(an,what=c("none","all"), col = c("#000000", "lightseagreen"), pch=c("none", "none", "???", "*"))
     