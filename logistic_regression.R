ff= read.csv(file="D:/HIS 4th Semester/Data Mining/Sprint 2 Data pre-processing-20210421/Data/disease.txt", head=TRUE, sep=",")
attach(ff)
plot(x = ff$Age, y = ff$Disease, xlab = "Age", ylab = "Disease")

# Logistic Regression model to the data
mymodel = glm(Disease ~ Age,data = ff ,family = binomial())
summary(mymodel)
