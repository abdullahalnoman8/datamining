ff = read.csv(file = "D:/HIS 4th Semester/Data Mining/Sprint 2 Data pre-processing-20210421/Data/disease.txt",
head = TRUE,  sep = ",")

diseasetree = rpart(Disease ~., data = ff, method = "class")
pred = predict(diseasetree,ff, type="class")
pred

table(pred, ff[,"Disease"])

diseasetree = rpart(Disease ~., data = ff, method = "class")
p2 = predict(diseasetree, ff, type = "prob")
p2

pr3 = p2[,2]
library(ROCR)
pr = prediction(pr3, ff$Disease)
perf = performance(pr,"tpr", "fpr")
plot(perf)

#Area under the roc curve 

performance(pr,"auc")
list()

