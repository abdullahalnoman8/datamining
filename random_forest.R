#install.packages("randomForest")

library(randomForest)
library(rpart)

n = nrow(iris)
set.seed(42)
train.id = sample(n,size=2/3*n)
test.id = setdiff(1:n, train.id)
trainingdata = iris[train.id, ]
validationdata = iris[test.id, ]

tree1 = rpart(Species ~., data=iris, method="class", subset=train.id)
tree1

pred = predict(tree1, iris[-train.id,], type = "class")
table(pred,iris[-train.id, "Species"])

rf = randomForest(Species ~., data = iris, subset = train.id)
pred2 = predict(rf,iris[-train.id, ], type="class")
table(pred2,iris[-train.id, "Species"])