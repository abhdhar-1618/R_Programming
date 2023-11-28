#--------------------------------Linear Regression -------------------------------------

# Case study - 
# A retailer does various marketing investments and campaigns
# (offline and online) to boost sales of its products along with adjusting prices
# As a marketing budgeting manager for the retailer, the client would like
# to understand 
# a.) Is price an important factor to drive sales? 
# b.) How spends and other campaigns are performing? 
# c.) Where should the budget be diverted if a particular channel is not performing

### https://www.latentview.com/marketing-mix-modeling/#Impact-of-variables-on-marketing-mix-models


## Install important libraries

install.packages("car")
install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)  #data manipulation
library(ggplot2)  #data visualization
library(car)  #has relevant functions needed while performing linear regression

setwd("E:/Main/File Uploads")


##Loading Data
mmix<-read.csv("MMix.csv",header=TRUE,stringsAsFactors=FALSE, na.strings = "")

#use na.strings

##mmix <- MMix
##Checking Data Characteristics
#dimensions
dim(mmix)
#structure of data
str(mmix)
#top and bottom records of data
head(mmix)

tail(mmix)

# Data cleaning
#Removing USD from TV, Radio and Instore spend values
mmix$TV <- gsub("USD ", "", mmix$TV)
class(mmix$TV)
mmix$TV <- as.numeric(mmix$TV)

mmix$Radio <- gsub("USD ", "", mmix$Radio)
class(mmix$Radio)
mmix$Radio <- as.numeric(mmix$Radio)

mmix$InStore <- gsub("USD ", "", mmix$InStore)
class(mmix$InStore)
mmix$InStore <- as.numeric(mmix$InStore)


#Dv = Sales

# #checking missing values
colSums(is.na(mmix))

# #Treating missing values

mmix$PromoType[is.na(mmix$PromoType)] <- "NO_OFFER"

# Change to factor variable
mmix$PromoType <- as.factor(mmix$PromoType)

#--------------------------------Exploratory Analysis -------------------------------------

#------ Univariate analysis----------

#summary statistics
summary(mmix$NewVolSales)

summary(mmix)

#checking sales distribution graphically
hist(mmix$NewVolSales)
boxplot(mmix$NewVolSales)


# Likewise
hist(mmix$BasePrice)
hist(mmix$InStore)
hist(mmix$Radio)
hist(mmix$TV)

##Bivariate analysis 

#Correlations
cor(mmix$NewVolSales,mmix$BasePrice)
cor(mmix$NewVolSales,mmix$Radio)
cor(mmix$NewVolSales,mmix$TV)
cor(mmix$NewVolSales,mmix$InStore)

#Viz for continuous variables
qplot(mmix$BasePrice, mmix$NewVolSales)
qplot(mmix$InStore, mmix$NewVolSales)
qplot(mmix$Radio, mmix$NewVolSales)
qplot(mmix$TV, mmix$NewVolSales)

#Viz for categorical variables
qplot(mmix$NewVolSales, mmix$Facebook)  #this does not give any good interpretation

#Facebook campaign
boxplot(mmix$NewVolSales~ mmix$Facebook, col = "red")

#Twitter campaign
boxplot(mmix$NewVolSales~ mmix$Twitter, col = "red")

#Website campaign
boxplot(mmix$NewVolSales~ mmix$WebCamp, col = "red")

#Online campaign
boxplot(mmix$NewVolSales~ mmix$Online, col = "red")

#Inserts
boxplot(mmix$NewVolSales~ mmix$Inserts, col = "blue")

#Promotion type
boxplot(mmix$NewVolSales~ mmix$PromoType, col = "blue")


# Find relationship b/w categorical variables using frequency/ counts 
# What is your interpretation here?
table(mmix$PromoType, mmix$Qtr)

#------
#--------------------------------Building models -------------------------------------

##Building Simple Linear Regression Model
?lm
?zoo
attach(mmix)

Reg<-lm(NewVolSales~BasePrice,data=mmix)

#Checking summary of the regression object "Reg"
summary(Reg)

#y=a+bx
#sales=a+b(base.price)
#Newvolsales=53487-2176(baseprice)

#Metrics to assess a model:
#Rsquare
#Coefficients
#P values : Significance levels of the IDV's
#Residuals distribution

#Factor variables as IDV's
#Remember one of the factor type becomes a baseline.The estimates of the other
#types of factor are only given by the model.

#Getting the formula
#formula(Reg)

#Using categorical variables in regression
Reg<-lm(NewVolSales~PromoType,data=mmix)
summary(Reg)

##Multivariate Regression Model
#Iteration 1
Mulreg<-lm(NewVolSales~BasePrice+PromoType,data=mmix)
summary(Mulreg)

names(mmix)
#Iteration 2
Mulreg<-lm(NewVolSales~BasePrice+PromoType+Radio+TV+InStore+Facebook+Twitter+WebCamp+Inserts,data=mmix)

#Mulreg
summary(Mulreg)

#Iteration 3
Mulreg<-lm(NewVolSales~BasePrice+PromoType+InStore+Twitter+ WebCamp,data=mmix)
#Mulreg
summary(Mulreg)

# Will you stop here and deliver this model to the business and say that 
# TV and Radio spends do not work at all?

install.packages("zoo")
library(zoo) # for rolling averages

#Iteration 4
Mulreg<-lm(NewVolSales~BasePrice+PromoType+InStore+Twitter+ WebCamp + rollmean(TV, k = 4, fill = NA, align =  "right"),
           data=mmix)
#Mulreg
summary(Mulreg)

# So create a variable for lagged TV spend using rollmean
mmix$TV_lag <- rollmean(TV, k = 4, fill = NA, align =  "right")

Mulreg<-lm(NewVolSales~BasePrice+PromoType+InStore+Twitter+ WebCamp + TV_lag,
           data=mmix)
#Mulreg
summary(Mulreg)

# Try the same for Radio spends as HW
mmix$Radio_lag <- rollmean(Radio, k = 4, fill = NA, align = "right")

Mulreg<-lm(NewVolSales~BasePrice+PromoType+InStore+Twitter+ WebCamp + TV_lag + Radio_lag,
           data=mmix)

summary(Mulreg)



#--------------------------------Testing models -------------------------------------

#Multicollinearity Check

vif(Mulreg)

?vif

##Getting predicted values
PredSales<-predict(Mulreg)
PredSales


##Finding Residuals
#Residuals are the errors which is Actual - Predicted 
ResSales<-resid(Mulreg)
ResSales

#checking for normality assumption
hist(ResSales)
# OR
hist(Mulreg$residuals)

#Quantile Quantile plot
qqPlot(Mulreg$residuals)


 
# ##Plotting Residuals vs Predicted Values
# ##Checking Heteroskedastcity - exists if there is a pattern between predicted values and error
# 
plot(PredSales,ResSales,abline(0,0))

##Plotting actual vs predicted values
#plot(mmix$NewVolSale,col="blue",type="l")
plot(mmix$NewVolSale[4:104],col="blue",type="l")
lines(PredSales,col="red",type="l")

## -- END OF CASE STUDY -- ##


##### --------EXTRAS-------- (FOR SELF PRACTICE AND LEARNING)----
  
  #checking outliers
x<-boxplot(mmix$NewVolSales)
boxplot(mmix$NewVolSales)

# Check outliers for Independent Variables
#boxplot(Radio)
#boxplot(TV)
#boxplot(InStore)
#boxplot(Base.Price)

# Outlier treatment - Way 1
#To get list of outliers
list_out<- x$out
list_out
#gives the positions in the data where outliers are present
index<-which(mmix$NewVolSales %in% list_out)

#---Shortlist the outliers from the dataset and replace
mmix$NewVolSales[index]

#na.rm=TRUE --> making sure missing values are removed before calculating mean
mean_sales<-mean(mmix$NewVolSales,na.rm=TRUE)
mmix$NewVolSales[index]<-mean_sales

# Outlier treatment - way 2
qn = quantile(mmix$NewVolSales, c(0.05, 0.95), na.rm = TRUE)
# qn = quantile(mmix$NewVolSales, c(0.25, 0.75), na.rm = TRUE)

summary(NewVolSales)

y<- IQR(NewVolSales)
q1 <- quantile(NewVolSales, 0.25)
q3 <- quantile(NewVolSales, 0.75)

?within
mmix<- within(mmix, { NewVolSales1 = ifelse(NewVolSales < (q1-1.5*y), qn[1], NewVolSales)
NewVolSales1 = ifelse(NewVolSales > (q3+1.5*y), qn[2], NewVolSales)})

# Check summary statistics
summary(NewVolSales)
summary(mmix$NewVolSales1)
qn[1]
qn[2]


## Log transformations ----
# skewness reduction when log transformed
hist(log(mmix$NewVolSales))
hist(log(mmix$BasePrice))
hist(log(mmix$InStore))
hist(log(mmix$Radio))

##What is the use of log variables?
##To make a variable in scale with the other variable
qplot(mmix$InStore, log(mmix$NewVolSales))
qplot(mmix$Radio, log(mmix$NewVolSales))

qplot(log(mmix$InStore), log(mmix$NewVolSales))
qplot(log(mmix$Radio), log(mmix$NewVolSales))

##Creating New Variables

#Data TRansformations
mmix$LnSales<-log(mmix$NewVolSales)
mmix$LnPrice<-log(mmix$BasePrice)
mmix$OfflineSpend<-mmix$Radio+mmix$TV+mmix$InStore

summary(mmix$OfflineSpend)
summary(mmix$NewVolSales)

qplot(mmix$NewVolSales, mmix$OfflineSpend)

# Creating price buckets
summary(mmix$BasePrice)

#Create price buckets - converting numeric variable into categorical
mmix$Price_Bkt[mmix$BasePrice < 15.03]<-"Low"
mmix$Price_Bkt[mmix$BasePrice >= 15.03 & mmix$BasePrice < 15.33]<-"Avg"
mmix$Price_Bkt[mmix$BasePrice >= 15.33 & mmix$BasePrice < 15.64]<-"High"
mmix$Price_Bkt[mmix$BasePrice >= 15.64]<-"V.High"

#Create price buckets - converting numeric variable into categorical
mmix$Price_Bkt[mmix$Base.Price < 15.03]<-"1Low"
mmix$Price_Bkt[mmix$Base.Price >= 15.03 & mmix$Base.Price < 15.64]<-"2Avg"
mmix$Price_Bkt[mmix$Base.Price >= 15.64]<-"3V.High"

mmix$Spend_Bkt[mmix$OfflineSpend < 391]<-"1LowSpend"
mmix$Spend_Bkt[mmix$OfflineSpend >= 391 & mmix$OfflineSpend < 510]<-"2AvgSpend"
mmix$Spend_Bkt[mmix$OfflineSpend >= 510]<-"3HighSpend"

mmix$Sales_Bkt[mmix$NewVolSales < 19049]<-"1LowSales"
mmix$Sales_Bkt[mmix$NewVolSales >= 19049 & mmix$NewVolSales < 20943]<-"2AvgSales"
mmix$Sales_Bkt[mmix$NewVolSales >= 20943]<-"3HighSales"

# Idea of lag impact of a promotion spend
?lag

cor(mmix$NewVolSales,mmix$Radio)
qplot(mmix$Radio, mmix$NewVolSales)

#Let us find if radio spend has a Lagged impact on sales
#Today's spend on a radio promotion might lead to sales n days down the line
cor(mmix$NewVolSales,lag(mmix$Radio,7), use = "complete.obs")

#what happens if I see correlation b/w log transformed sales and lag radio

#Create a lag variable in data
mmix$Radio_lag <- lag(mmix$Radio, 7)

qplot(mmix$Radio_lag, log(mmix$NewVolSales)) # this is still skewed radio spend
#let us do log transformation
qplot(log(mmix$Radio_lag), log(mmix$NewVolSales))

# lag of TV spend

cor(mmix$TV, mmix$NewVolSales)
qplot(mmix$TV, mmix$NewVolSales)

# TV Lag 8,11, 15
cor(lag(mmix$TV,15), mmix$NewVolSales, use = "complete.obs")

# Create a variable for lagged TV spend
mmix$TV_lag <- lag(mmix$TV, 15)

# Let us plot lagged value v/s sales (direct and log transformed)
qplot(mmix$TV_lag, log(mmix$NewVolSales))
qplot(log(mmix$TV_lag), log(mmix$NewVolSales)) # why?

hist(mmix$TV_lag)

#Constant  variance check
plot(Mulreg$fitted.values,Mulreg$residuals) #Funnel shape #try more transformations

# Try y transformation
mmix$LogNewVolSale <- log(NewVolSales)

#--------------------------------Training and Test Splits -------------------------------------

##Try on a different validation data
sampling<-sort(sample(nrow(mmix), nrow(mmix)*.7))
# head(sampling)
length(sampling)


#Select training sample
train<-mmix[sampling,]
test<-mmix[-sampling,]
nrow(train)
nrow(test)

PredSalesTest= predict(Mulreg,data=test)
plot(test$NewVolSales,col="blue",type="l")
lines(PredSalesTest,col="red",type="l")

