library(rpart)
library(rpart.plot)
data("iris")

n = nrow(iris)
set.seed(42)
train.id = sample(n, size = 2/3*n)
test.id = setdiff(1:n, train.id)

trainingdata = iris[train.id,]
validationdata = iris[test.id,]

tree1 = rpart(Species ~ ., data = iris, method = "class", subset = train.id)
tree1

pred = predict(tree1, iris[-train.id,], type = "class")
head(pred)

list(train = summary(trainingdata), test = summary(validationdata))
table(pred,iris[-train.id, "Species"])

rpart.control()
prp(tree1,box.col = c("pink","palegreen3","blue")[tree1$frame$yval])

