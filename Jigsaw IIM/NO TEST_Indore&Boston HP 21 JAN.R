#### https://rpubs.com/ezrasote/housepricing

## Installing packages

install.packages('readr')
install.packages('ggplot2')
install.packages('mlbench')
install.packages('corrplot')
install.packages('Amelia')
install.packages('caret')
install.package('plotly')
install.packages('caTools')
install.packages('reshape2')
install.packages('dplyr')

## Loading packages


library(readr)
library(ggplot2)
library(corrplot)
library(mlbench)
library(Amelia)
library(plotly)
library(reshape2)
library(caret)
library(caTools)
library(dplyr)
library(caret)

### Reading/importing data

indorehp <- read.csv("E:/Main/File Uploads/IndoreHP_Train.csv")

str(indorehp)
#View(indorehp)

### Data Examination

head(indorehp)
summary(indorehp)

## Data Cleaning
## missmap and amelia package used

missmap(indorehp,col=c('yellow','black'),y.at=1,y.labels='',legend=TRUE)

## Exploratory Data Analysis using ggplot

corrplot(cor(select(indorehp,-RIVER_FLG)))

cor(indorehp,indorehp$MEDV)

#visualizing the distribution of the target variable MEDV USING GGPLOT2

indorehp %>% 
  ggplot(aes(MEDV)) +
  stat_density() + 
  theme_bw()

#visualizing the distribution of the target variable MEDV USING PLOTLY

ggplotly(indorehp %>% 
           ggplot(aes(MEDV)) +
           stat_density() + 
           theme_bw())

### effect of the variables in the dataframe on MEDV.

indorehp %>%
  select(c(CRIM, ZN, INDUS, RIVER_FLG, nitric.oxides.concentration, X.rooms.dwelling,MEDV,AGE,DIS,RAD,TAX,PTRATIO,B,LSTAT)) %>%
  melt(id.vars = "MEDV") %>%
  ggplot(aes(x = value, y = MEDV, colour = variable)) +
  geom_point(alpha = 0.7) +
  stat_smooth(aes(colour = "black")) +
  facet_wrap(~variable, scales = "free", ncol = 2) +
  labs(x = "Variable Value", y = "Median House Price ($1000s)") +
  theme_minimal()


######## BREAK ##############


## Train and Test Data

set.seed(87542)

split <- sample.split(indorehp,SplitRatio =0.7)

train <- subset(indorehp,split==TRUE)
test <- subset(indorehp,split==FALSE)

model <- lm(MEDV ~ CRIM + ZN + INDUS + RIVER_FLG + nitric.oxides.concentration + X.rooms.dwelling + AGE + DIS + RAD + TAX + PTRATIO + B + LSTAT,data = train)

summary(model)

res <- residuals(model)

# Convert residuals to a DataFrame 

res <- as.data.frame(res)

ggplot(res,aes(res)) +  geom_histogram(fill='blue',alpha=0.5)

##plot(model)

# Predictions

test$predicted.MEDV <- predict(model,test)

pl1 <-test %>% 
  ggplot(aes(MEDV,predicted.MEDV)) +
  geom_point(alpha=0.5) + 
  stat_smooth(aes(colour='black')) +
  xlab('Actual value of MEDV') +
  ylab('Predicted value of MEDV')+
  theme_bw()

ggplotly(pl1)


error <- test$MEDV-test$predicted.MEDV
rmse <- sqrt(mean(error)^2)
rmse

pl1

test

head(test)
View(test)

library(writexl)

### use view code to see the data

write_xlsx(test, "E:/Main/File Uploads/indore_test_final34.xlsx")
