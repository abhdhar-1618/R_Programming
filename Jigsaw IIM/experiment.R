library(sjPlot)
library(dplyr)
library(sjlabelled)
library(sjmisc)
library(ggplot2)
library(writexl)
theme_set(theme_sjplot())

indorehp <- read.csv("E:/Main/File Uploads/IndoreAD_Train.csv")

hist(indorehp$MEDV, breaks = 100)

model <- lm(MEDV ~.,data=indorehp)
summary(model)
model2 <- lm(MEDV ~ nitric.oxides.concentration + B + CRIM,data = indorehp)
summary(model2)
plot_model(model2,show.values = TRUE, value.offset = 0.2)
par(mfrow=c(2,2))
plot(model2)
indorehp$pred <-predict(model2,newdata = indorehp)
par(mfrow=c(1,1))
ggplot(indorehp,aes(x=MEDV,y=pred)) + geom_point() + 
  geom_smooth(method = "lm",color="blue") + 
  theme_bw()

error <-indorehp$pred - indorehp$MEDV
rmse <- sqrt(mean(error^2))
rmse


library(writexl)
write_xlsx(indorehp, "E:/Main/File Uploads/indore_test_final11.xlsx")
