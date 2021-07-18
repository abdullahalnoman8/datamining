x=c(1,1.1,5,5.1,1.5,5.2,7.9,1.2,8.1,9)
plot(x)
library(amap)
mycluster = kmeans(x,3)
mycluster

mycluster$size

mycluster$cluster


mycluster$centers

mycluster$withinss

plot(x, col= mycluster$cluster)

points(mycluster$centers, col = 1:3, pch = 8, cex=2)

set.seed(42)
set.seed(4333)

mycluster
