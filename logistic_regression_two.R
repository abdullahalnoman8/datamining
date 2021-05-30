churn=read.csv(file="D:/HIS 4th Semester/Data Mining/Sprint 2 Data pre-processing-20210421/Data/churn.txt")

names(churn)

churnfactor = factor(churn$Churn.)
# churnfactor
mymodel = glm(churnfactor ~ churn$VMail.Plan, family = binomial())
summary(mymodel)

sum(churn$Churn. == "True.")
sum(churn$Churn. == "False.")
sum(churn$VMail.Plan == "no")
sum(churn$VMail.Plan == "yes")

length(churn$VMail.Plan)

# Odd ratio
 pc1=0.0868
 pc0=0.16715
 (pc1/(1-pc1))/(pc0/(1-pc0))