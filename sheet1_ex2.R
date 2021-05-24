library(DataExplorer)
plot_missing(airquality)
library('mlr')
airquality
imputed = impute(airquality, cols = list(Ozone = 100))
imp_ozone=imputed$data[,1]
imputed2 = impute(airquality, cols = list(Ozone = imputeMedian()))
imp_ozone2=imputed2$data[,1]

imputed3 = impute(airquality, cols = list(Ozone = 0))
imp_ozone3=imputed3$data[,1]
imputed4 = impute(airquality, cols = list(Ozone = imputeNormal()))
imp_ozone4=imputed4$data[,1]
imputed5 = impute(airquality, cols = list(Ozone = imputeHist()))
imp_ozone5=imputed5$data[,1]
par(mfrow=c(2,3))
hist(Ozone,breaks=25,ylim=(c(0,45)),main="Original data")
hist(imp_ozone,breaks=25,ylim=(c(0,45)),main="Imputation with 100")
hist(imp_ozone2,breaks=25,ylim=(c(0,45)),main="Imputation with median")
hist(imp_ozone3,breaks=25,ylim=(c(0,45)),main="Imputation with 0")
hist(imp_ozone4,breaks=25,ylim=(c(0,45)),main="Imputation with normal distr.")
hist(imp_ozone5,breaks=25,ylim=(c(0,45)),main="Imputation with histogram")
mean(Ozone,na.rm = TRUE)
mean(imp_ozone)
mean(imp_ozone2)
mean(imp_ozone3)
mean(imp_ozone4)
mean(imp_ozone5)