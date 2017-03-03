# README
Chandrasekar Ganesan  
March 2, 2017  



## Hierarchical Clustering - Example

```r
set.seed(1234)
par(mar=c(0,0,0,0))
x <- rnorm(12, mean=rep(1:3, each=4), sd=0.2)
y <- rnorm(12, mean=rep(1,2,1, each=4), sd=0.2)
plot(x, y, col='blue', pch=19, cex=2)
text(x + 0.05, y + 0.05, labels(as.character(1:12)))
```

![](README_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

>Hierarchical Clusterring - Dist

```r
dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)
```

```
##             1          2          3          4          5          6
## 2  0.34120511                                                       
## 3  0.57493739 0.24102750                                            
## 4  0.26381786 0.52578819 0.71861759                                 
## 5  1.32829783 1.03674741 0.91735828 1.55702849                      
## 6  1.34289555 1.06377512 0.96021156 1.57849918 0.08150268           
## 7  1.12653104 0.84893905 0.75865878 1.36197257 0.21110433 0.21666557
## 8  1.29969142 0.95848707 0.73404628 1.45063548 0.61704200 0.69791931
## 9  2.13629539 1.83167669 1.67835968 2.35675598 0.81160529 0.81322878
## 10 2.06419586 1.76999236 1.63109790 2.29239480 0.73617872 0.72567124
## 11 2.14702468 1.85183204 1.71074417 2.37461984 0.81885779 0.80884612
## 12 2.05664233 1.74662555 1.58658782 2.27232243 0.74039824 0.75094539
##             7          8          9         10         11
## 2                                                        
## 3                                                        
## 4                                                        
## 5                                                        
## 6                                                        
## 7                                                        
## 8  0.65062566                                            
## 9  1.02071213 1.09596506                                 
## 10 0.93949958 1.09784758 0.14090406                      
## 11 1.02259080 1.16375491 0.11624471 0.08317570           
## 12 0.95130649 0.99022086 0.10848966 0.19128645 0.20802789
```

>Hierarchical Clustering- hclust

```r
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
#dendograms
plot(hClustering)
```

![](README_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

>Headmap

```r
dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)
```

![](README_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

## K-Means Clustering & Dimension Reduction

### K-means clustering

How do we define *close*?

#### Most important step
  + garbage in -> garbage out

#### Distance or similarity
  + Continuous - euclidean distance
  + Continuous - correlation similarity
  + Binary - manhattan distance
  + Pick a distance / similarity that makes sense for your problem

#### A partitioning approach
  + Fix a number of clusters
  + Get "centroids" of each cluster
  + Assign things to closest centroid
  + Recalculate centroids
  
#### Requires
  + A defined distance metric
  + A number of clusters
  + An initial guess as of cluster centroids
  
#### Produces
  + Final estimate of cluster centroids
  + An assignment of each point of clusters
  
  
> K-means Clustering - Example


```r
set.seed(1234)
par(mar=c(0,0,0,0))
x <- rnorm(12, mean=rep(1:3, each=4), sd=0.2)
y <- rnorm(12, mean=rep(1,2,1, each=4), sd=0.2)
plot(x, y, col='blue', pch=19, cex=2)
text(x + 0.05, y + 0.05, labels=as.character(1:12))
```

![](README_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

#### K-means()

* Important paraments: x, centers, iter.max, nstart


```r
dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers=3)
names(kmeansObj)
```

```
## [1] "cluster"      "centers"      "totss"        "withinss"    
## [5] "tot.withinss" "betweenss"    "size"         "iter"        
## [9] "ifault"
```

```r
kmeansObj$cluster
```

```
##  [1] 3 3 3 3 1 1 1 1 2 2 2 2
```

```r
#K-means()
par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch=19, cex = 2)
points(kmeansObj$centers, col=1:3, pch=3, cex=2)
```

![](README_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

#### Heatmaps


```r
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
kmeansObj2 <- kmeans(dataMatrix, centers= 3)
par(mfrow = c(1,2), mar = c(1,4,0.1,0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")
```

![](README_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

### Dimension Reduction
> Let's generates a Matrix data and plot as image


```r
# A Random Matrix Plot
set.seed(1234)
par(mar=rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow=40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])
```

![](README_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

> Cluster the data


```r
par(mar = rep(0.2, 4))
heatmap(dataMatrix)
```

![](README_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

```r
# Observe there is no interesting pattern to the data
```

> What if we add a pattern ?


```r
set.seed(678910)
for(i in 1:40){
  # flip a coin
  coinFlip <- rbinom(1, size=1, prob=0.5)
  #if the coin is head adda common pattern to that row
  if (coinFlip){
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,3), each=5)
  }
}
par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])
```

![](README_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

> Run the heatmap again


```r
par(mar = rep(0.2, 4))
heatmap(dataMatrix)
```

![](README_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

> Patterns in rows and columns


```r
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1,xlab="Row Mean", ylab="Row", pch=19)
plot(colMeans(dataMatrixOrdered),xlab="Column", ylab="Column Mean", pch=19)
```

![](README_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

***

### **Related Problems**

You have multivariate variables *X1*,....,*Xn* so *X1* = (*X^11^*,.......*X^1m^*)

* Find a new set of multivariate variables that are uncorrelated and explain as much variance as possible.
* If you put all the variables in one matrix, find the best matrix created with fewer variables (lower rank) that explains the original data

The first goal is **statistical** and the second goal is **data compression**.

#### **Related Solution**

**SVD - Singular Value Decomposition**

If *X* is a matrix with each variable in a column and each observation in a row then the SVD is a "matrix decomposition"

                    X = *UVD^T^*
                    
where the columns of *U* are the orthogonal (left singular vectors), the columns of *V* are orthogonal (right singular vector) and *D* is a diagonal vector matrix (singular values)

** PCA - Principal components analysis **

The principal components are equal to the right singular values if you first scale (subtract the mean, divide by the standard deviation) of the variables.


### Components of the SVD - *u* and *v*


```r
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1,3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[,1], 40:1, xlab="Row", ylab="First Left Singular vector", pch=19)
plot(svd1$v[,1], xlab="Column", ylab="First Right Singular vector", pch=19)
```

![](README_files/figure-html/unnamed-chunk-14-1.png)<!-- -->

