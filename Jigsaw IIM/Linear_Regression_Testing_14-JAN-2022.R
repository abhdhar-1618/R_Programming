cars <- read.csv("E:\\Main\\File Uploads\\Car_Price_Prediction.csv")
cars <- read.csv("E:/Main/File Uploads/Car_Price_Prediction.csv")
cars
summary(cars)
head(cars)
plot(cars)

#Splitting Data into training and test

set.seed(2)
library(caTools)
split <- sample.split(cars, SplitRatio = 0.7)
split
train <- subset(cars, split="TRUE")
test <- subset(cars, split="FALSE")
train
test

#Creation of model

Model <- lm(price ~.,data=train)
summary(Model)

#Prediction

pred <- predict(Model, test)
pred
#comparing predicted vs actual values

plot(pred,type = "l",lty = 1.8,col = "red")
lines(pred, type="l",col = "blue")

#Finding Accuracy

rmse <-sqrt(mean(pred-cars$price)^2)
rmse

## Video Title:- Linear Regression in R | Linear Regression in R With Example | Data Science Algorithms | Simplilearn
## Video Link :- https://www.youtube.com/watch?v=2Sb1Gvo5si8



