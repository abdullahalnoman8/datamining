library(rpart)
library(rpart.plot)
churn = read.csv(file = "D://HIS 4th Semester//Data Mining//Sprint 2 Data pre-processing-20210421//Data//churn.txt")

n = nrow(churn)
set.seed(42)
train.id = sample(n,size = 0.7*n)
test.id = setdiff(1:n,train.id)

trainingdata = churn[train.id,]
validationdata = churn[test.id,]

tree1 = rpart(Churn. ~ .,data = trainingdata, method = "class")
tree1
names(churn)
train = trainingdata[, -4]
test = validationdata[, -4]
names(train)
names(test)

tree2 = rpart(Churn. ~ ., data = train, method = "class")
tree2

prp(tree2, box.col = c("pink","palegreen3")[tree2$frame$yval])

tree3 = rpart(Churn. ~ ., data = train,method="class", control = rpart.control(maxcompete = 3, maxdepth = 2))
tree3

prp(tree3, box.col = c("pink", "palegreen")[tree3$frame$yval])
