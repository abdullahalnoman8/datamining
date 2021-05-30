churn=read.csv(file="D:/HIS 4th Semester/Data Mining/Sprint 2 Data pre-processing-20210421/Data/churn.txt")

names(churn)

churnfactor = factor(churn$Churn.)

mymodel = glm(churnfactor ~ churn$Day.Mins + churn$Eve.Mins + churn$Night.Mins + churn$Intl.Mins
              +churn$Int.l.Plan + churn$VMail.Plan + churn$CustServ.Calls, family = binomial())

summary(mymodel)