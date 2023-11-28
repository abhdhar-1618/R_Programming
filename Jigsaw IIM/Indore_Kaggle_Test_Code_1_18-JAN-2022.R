library(sjPlot)
library(dplyr)
library(sjlabelled)
library(sjmisc)
library(ggplot2)
library(writexl)
indorehp <- read.csv("E:/Main/File Uploads/IndoreHP_Train.csv")
indorehp
head(indorehp)
str(indorehp)
summary(indorehp)

indorehp_num <- indorehp %>% select_if(is.numeric)

hist(indorehp_num$MEDV, breaks = 100)
hist(indorehp$MEDV, breaks = 100)

# indorehp <-indorehp %>%
#   filter(MEDV>10) %>%
#   filter(MEDV<60)
# hist(indorehp$MEDV, breaks = 100)

set.seed(111)
size <- floor(0.7 * nrow(indorehp_num))
train_ind <- sample(seq_len(nrow(indorehp_num)), size = size)
train_ind

train <- indorehp_num[train_ind, ]
test <- indorehp_num[-train_ind, ]
train
test
model <- lm(MEDV ~., data = train)
summary(model)
plot_model(model,show.values = TRUE, value.offset = 0.2)
par(mfrow=c(2,2))
plot(model)

##model2 <- lm(MSRP ~ Engine.HP + highway.MPG + Engine.Cylinders,data = train)

model2 <- lm(MEDV ~ CRIM + ZN + INDUS + RIVER_FLG + nitric.oxides.concentration + X.rooms.dwelling + AGE + DIS + RAD + TAX + PTRATIO + B + LSTAT,data = train)
summary(model2)
plot_model(model2,show.values = TRUE, value.offset = 0.2)
par(mfrow=c(2,2))
plot(model2)


test$pred <-predict(model2,newdata = test)
par(mfrow=c(1,1))
ggplot(test,aes(x=MEDV,y=pred)) + geom_point() + 
  geom_smooth(method = "lm",color="blue") + 
  theme_bw()

head(test)
test


error <-test$pred - test$MEDV
rmse <- sqrt(mean(error^2))
rmse
library(writexl)
write_xlsx(test, "E:/Main/File Uploads/indore_test_final4.csv")
