library(rpart)
library(rpart.plot)
churn = read.csv(file = "D://HIS 4th Semester//Data Mining//Sprint 2 Data pre-processing-20210421//Data//churn.txt")
library(nnet)

n = nrow(churn)
train.id = sample(n,size = 0.7*n)
test.id = setdiff(1:n,train.id)
trainingdata = churn[train.id, ]
testdata = churn[test.id, ]

churnfactor = factor(trainingdata$Churn.)
#mynn=nnet(churnfactor~.,data=trainingdata, size=2,maxit=200)
#mynn = nnet(churnfactor ~ ., data = trainingdata, size = 2, maxit = 200)

Day.Mins = trainingdata$Day.Mins
VMail.Plan = trainingdata$VMail.Plan
use_data = data.frame(Day.Mins, VMail.Plan, churnfactor)
mynn = nnet(churnfactor~.,data = use_data, size=2)
mynn
summary(mynn)
mynn = nnet(churnfactor~.,data = use_data,size=20,maxit=200)
summary(mynn)

