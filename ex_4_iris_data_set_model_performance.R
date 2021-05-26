data("iris")
library(rpart)
library(rpart.plot)
iristree = rpart(Species ~ ., data = iris,method = "class")
no_of_rows = nrow(iris)
no_of_rows
set.seed(42)

# divide the test data and training data, 2/3 of whole data is training data
train.id = sample(no_of_rows,size = (2/3)*no_of_rows)
train.id

test.id = sample(setdiff(1:no_of_rows,train.id))
test.id

# creating standard decision tree
traintree = rpart(Species ~ . , data = iris, method = "class", subset = train.id)


# make prediction with the decision tree model for the test data set
pred = predict(traintree, iris[-train.id,], type = "class")

# show predicted values 
head(pred)

# create confusion matrix
table(pred, iris[-train.id, "Species"])
