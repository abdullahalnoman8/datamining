set.seed(43)

library(amap)
data("USArrests")
hc_ave = hcluster(USArrests, link = "ave")
plot(hc_ave)
hc_sin = hcluster(USArrests, link = "single")
hc_com = hcluster(USArrests, link = "complete")
plot(hc_sin)

plot(hc_com)