library(caret)
library(dplyr)

#pmltraining <- read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv", sep = ",", header = TRUE, na.string=c("NA","#DIV/0!",""))

nafields <- function(){
  a = c()
  for(i in 1:dim(pmltraining)[2]){
    if (sum(is.na(pmltraining[,i])) / dim(pmltraining)[1] >= 0.75)
        {
         a <- append(a, i) 
          
    }
  }
  a
}

nas <- nafields()

subsetdata <- pmltraining[,-nas]
subsetdata <- subsetdata[,-c(1,3,4,5)]

showXY <- function() {
  par(mfrow=c(1, 2), mar = c(5, 4, 1, 1))
  plot(sub1[, 1], col = sub1$activity, ylab = names(sub1)[1])
  plot(sub1[, 2], col = sub1$activity, ylab = names(sub1)[2])
  legend("bottomright",legend=unique(sub1$activity),col=unique(sub1$activity), pch = 1)
  par(mfrow=c(1,1))
  
}

myplclust <- function( hclust, lab=hclust$labels, lab.col=rep(1,length(hclust$labels)), hang=0.1,...){
  ## modifiction of plclust for plotting hclust objects *in colour*!
  ## Copyright Eva KF Chan 2009
  ## Arguments:
  ##    hclust:    hclust object
  ##    lab:        a character vector of labels of the leaves of the tree
  ##    lab.col:    colour for the labels; NA=default device foreground colour
  ##    hang:     as in hclust & plclust
  ## Side effect:
  ##    A display of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height,2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x<0)]
  x <- x[which(x<0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot( hclust, labels=FALSE, hang=hang, ... )
  text( x=x, y=y[hclust$order]-(max(hclust$height)*hang), labels=lab[hclust$order], col=lab.col[hclust$order], srt=90, adj=c(1,0.5), xpd=NA, ... )}

adelmo <- subset(subsetdata, user_name == 'adelmo')

sub1 <- adelmo[c(11:13)]
mdist <- dist(sub1)
hclustering <- hclust(mdist)


myplclust(hclustering, lab.col = unclass(adelmo$classe))