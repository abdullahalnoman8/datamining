time = c(2,2,3,4,4,5,6,7,8,9)
distance = c(10,11,12,13,14,15,20,18,22,25)
plot(time,distance)


# Simple Linear Regression Analysis

myvalues = lm(distance ~ time)
myvalues 
plot(distance,time)
abline(myvalues)

summary(myvalues)

# Residual analysis
my_residuals = residuals(myvalues)
my_residuals
myfit = fitted(myvalues)
myfit

plot(time,my_residuals)
plot(time,myfit)

plot(myfit,my_residuals)

# Update the data again for further analysis

xx =c(2 , 2, 3, 4, 4, 5, 6, 7, 8, 9, 16)
yy =c(10, 11, 12, 13, 14, 15, 20, 18, 22, 25, 39)

plot(xx,yy)

# Regression analysis
myvalues = lm(yy ~ xx)
summary(myvalues)

influence.measures(myvalues)

myinfluence = influence.measures(myvalues)
summary(myinfluence)
which(apply(myinfluence$is.inf, 1, any))

# Return to original Data set and update it with another observation value
yy=c(10,11,12,13,14,15,20,18,22,25,20)
xx=c(2,2,3,4,4,5,6,7,8,9,5)
plot(xx,yy)
myvalues=lm(yy~xx)
summary(myvalues)

myinfluence=influence.measures(myvalues)
summary(myinfluence)

# Return to original Data set and update it with another observation value

yy=c(10,11,12,13,14,15,20,18,22,25,23)
xx=c(2,2,3,4,4,5,6,7,8,9,10)
plot(xx,yy)
myvalues = lm(yy ~ xx)
summary(myvalues)

myinfluence=influence.measures(myvalues)
summary(myinfluence)


