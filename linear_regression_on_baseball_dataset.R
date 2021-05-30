baseball= read.csv(file = "D://HIS 4th Semester//Data Mining//Sprint 2 Data pre-processing-20210421//Data//baseball.txt", sep="",)
baseball_new = baseball[baseball$at_bats >= 100,]
baseball_new$at_bats
dim(baseball_new)
plot(baseball_new$bat_ave, baseball_new$homeruns)

# Regression Analysis
myreg=lm(baseball_new$homeruns~baseball_new$bat_ave)
summary(myreg)

# Residual Analysis 
myres=residuals(myreg)
plot(baseball_new$bat_ave,myres)
qqnorm(myres)
qqline(myres)

# Transformation of the variable

ln_home_runs = log(baseball_new$homeruns)
bat_ave = baseball_new$bat_ave
plot(bat_ave, ln_home_runs)
total = data.frame(ln_home_runs, bat_ave)
total
totalnew = total[total$ln_home_runs>=-10,]
dim(total)
dim(totalnew)
myregression = lm(totalnew$ln_home_runs ~ totalnew$bat_ave)
summary(myregression)

# Residuals Analysis for new model
myresiduals = residuals(myregression)
plot(totalnew$ln_home_runs,myresiduals)
qqnorm(myresiduals)
qqline(myresiduals)


