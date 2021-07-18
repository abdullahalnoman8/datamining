library(randomForest)
library(rpart)
churn = read.csv(file = "D://HIS 4th Semester//Data Mining//Sprint 2 Data pre-processing-20210421//Data//churn.txt");


n = nrow(churn)
set.seed(42)
train.id = sample(n,size = 0.7*n)
test.id = setdiff(1:n,train.id)
trainingdata = churn[train.id, ]
validationdata = churn[test.id,]

train = trainingdata[, -4]
test = validationdata[, -4]
tree2 = rpart(train$Churn. ~., data = train, method = "class")
pred = predict(tree2, churn[-train.id,], type = "class")
table(pred, churn[-train.id, "Churn."])


churnfactor = factor(train$Churn.)
churnfactor2 = factor(test$Churn.)
test2 = data.frame(test, churnfactor2)
rf2 = randomForest(churnfactor ~., data = train, method ="class")
pred3 = predict(rf2, test2, type="class")
table(pred3, test2[, "churnfactor2"])