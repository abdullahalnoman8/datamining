clothing = read.csv(file="D:\\HIS 4th Semester\\Data Mining\\Sprint 2 Data pre-processing-20210421\\Data\\clothing_store.txt")
# printing variable names
names(clothing)
# How many variables and observations are here
dim(clothing)
# select 70% of the data as a training data and remaining 30% as validation data
set.seed(42)
# number of observation
clothing_nobs = nrow(clothing)

# to get the row numbers of the sampled training data
clothing_train_no = sample(nrow(clothing), 0.7*clothing_nobs)

# to get the row numbers of the sampled validation data
clothing_validation_no = sample(setdiff(seq_len(nrow(clothing)), clothing_train_no), 0.30*clothing_nobs)

#To get the length of the future training and validation data:
length(clothing_train_no)
length(clothing_validation_no)

#Now, create the training and validation data sets from the total data
#set, using the randomly selected row numbers above:

training_data = clothing[clothing_train_no,]
validation_data = clothing[clothing_validation_no,]

# observations in training data and validation data

dim(training_data)
dim(validation_data)

# find unique variables
attach(training_data)
length(unique(HHKEY))

length(unique(RESP))
length(unique(PKNIT_TOPS))
length(unique(CLUSTYPE))
length(unique(CC_CARD))
length(unique(WEB))

# Distribution of the target variable
hist(RESP)
unique(RESP)

data_one = training_data[RESP==1,]
data_zero = training_data[RESP==0,]
dim(data_one)
dim(data_zero)

# Let us first discuss if there are any variables that we can reject in the
# analysis. The first would be the variable containing the customer id
# HHKEY. Why shouldn't we use this variable as an input variable in
# the analysis?
# Another variable that we are going to reject here is the variable
# ZIP CODE. Could you think of any potential information that this
# variable could contain?
# Create a new training dataset and a new validation dataset (to be
# used in the following tasks) without the variables HHKEY and ZIP CODE.


tr = training_data[,-1]
tr = tr[,-1]
names(tr)


val = validation_data[,-1]
val = val[,-1]
names(val)


attach(tr)
hi_trans=log(HI)
tr=tr[,-45]
tr=data.frame(tr,hi_trans)
names(tr)


attach(val)
hi_trans=log(HI)
val=val[,-45]
val=data.frame(val,hi_trans)

attach(tr)
amount23=TMONSPEND-OMONSPEND
amount456=SMONSPEND-TMONSPEND
names(tr)

tr=tr[,-26]
names(tr)

tr=tr[,-27]
names(tr)
tr=data.frame(tr,amount23,amount456)
names(tr)

attach(val)
amount23=TMONSPEND-OMONSPEND
amount456=SMONSPEND-TMONSPEND
val=val[,-26]
val=val[,-27]
val=data.frame(val,amount23,amount456)
names(val)

write.table(tr,"tr_clothing_prepared.txt",row.names=FALSE)
write.table(val,"val_clothing_prepared.txt",row.names=FALSE)


