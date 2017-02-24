# Baseplot-part1
Chandrasekar Ganesan  
February 24, 2017  
# Simple Base Graphics: Histogram

```r
library(datasets)
hist(airquality$Ozone)  # Draw a new plots
```

![](README_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

# Simple Base Graphics: Scatterplot

```r
library(datasets)
with(airquality, plot(Wind,Ozone))
```

![](README_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

# Simple Base Graphics: BoxPlot

```r
library(datasets)
airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone (ppb")
```

![](README_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
You can use cc

