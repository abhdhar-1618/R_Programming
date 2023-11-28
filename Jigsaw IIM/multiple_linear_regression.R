a<-read.csv("C:/Users/K201/Desktop/Butler.csv")
a
nrow(a) # number of rows
ncol(a) # number of columns

is.data.frame(a)

b<-lm(travel.hours~Miles.travelled+Number.of.deliveries, data=a) # stores results of linear regression model

summary(b)