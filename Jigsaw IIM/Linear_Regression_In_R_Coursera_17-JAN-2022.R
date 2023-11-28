cars <- read.csv("E:/Main/File Uploads/cars.csv")
### cars <-read.csv("cars.csv", header = TRUE, stringsAsFactors = FALSE)


# Guided project - Building and analysing linear regression model in R
# Instructor - Dr. Nikunj Maheshwari

# Required libraries have been installed but needs to be loaded
library(sjPlot)
library(dplyr)
library(sjlabelled)
library(sjmisc)
library(ggplot2)
library(writexl)
theme_set(theme_sjplot())

# Task 1 - Load dataset and summarize it

head(cars)
str(cars)
summary(cars)
# Task 2 - Clean your dataset

cols <- names(cars)[vapply(data, is.character, logical(1))]
cars[,cols] <- lapply(cars[,cols],trimws)
cars[cars=='N/A'] = NA
sapply(cars, function(x) mean(is.na(x)))
cars$Market.Category <- NULL
cars <- cars[complete.cases(cars), ]
str(cars)
# Task 3 - Split into training and test set

cars_num <- cars %>% select_if(is.numeric)

hist(cars_num$MSRP, breaks = 100)

cars_num <-cars_num %>%
  filter(MSRP>15000) %>%
  filter(MSRP<50000)

set.seed(444)
size <- floor(0.8 * nrow(cars_num))
train_ind <- sample(seq_len(nrow(cars_num)), size = size)

train <- cars_num[train_ind, ]
test <- cars_num[-train_ind, ]

# Task 4 - Fit linear regression model and interpret model summary statistics

model <- lm(MSRP ~., data = train)
summary(model)
plot_model(model,show.values = TRUE, value.offset = 0.2)
model2 <- lm(MSRP ~ Engine.HP + highway.MPG + Engine.Cylinders,data = train)
summary(model2)
plot_model(model2,show.values = TRUE, value.offset = 0.2)
# Task 5 - Plot and analyse model residuals

par(mfrow=c(2,2))
plot(model)

# Task 6 - Predict future values and calculate model error metrics
test$pred <-predict(model,newdata = test)

par(mfrow=c(1,1))
ggplot(test,aes(x=MSRP,y=pred)) + geom_point() + 
geom_smooth(method = "lm",color="blue") + 
theme_bw()  

head(test)
test

error <-test$pred - test$MSRP
rmse <- sqrt(mean(error^2))
rmse

mae <- mean(abs(error))
mae

library(Metrics)

obs <- c(10, 11.2, 9.7, 12.4, 10.5)

pred <- c(10.9, 8.5, 9.4, 13.8, 9.9)

mae(obs, pred)
### End of project

library(writexl)
library(WriteXLS)
write_xlsx(test, "E:/Main/File Uploads/test.xlsx")
