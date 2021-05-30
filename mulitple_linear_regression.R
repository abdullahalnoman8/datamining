cereals = read.csv(file = "D://HIS 4th Semester//Data Mining//Sprint 2 Data pre-processing-20210421//Data//cereals.dat", sep = "")

# install.packages("rgl")

library(rgl)
attach(cereals)
plot3d(SUGARS,FIBER,RATING)

# Linear Regression where Sugars as independent variable
summary(lm(RATING ~ SUGARS))

# Linear Regression where Fiber is the independent variable
summary(lm(RATING ~ FIBER))

# Mulitple linear regression

summary(lm(RATING ~ SUGARS + FIBER))


#names(cereals)

cereals[66,]
