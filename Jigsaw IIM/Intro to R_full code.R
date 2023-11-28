##----------------------Introduction to R--------------------------------#

# Some important shortcuts
# Use # for writing a comment
# Shift + Ctrl + C to comment and de-comment
# Hit Ctrl+Enter to run a line/ selected code
# Zoom In - Shift + Ctrl + +
# Zoom Out - Ctrl + -

# Google for R 
# www.rseek.org

# Print function
print ("Hello Students! How are you all doing today?")

#getting help in R
?print
# Or 
help(print)

# Arithmetic Operators in R
# + x
# - x
# x + y
# x - y
# x * y
# x / y
# x ^ y
# x %% y    X mod Y - remainder part after division (also know as modulo)
# x %/% y   Integer part of the division

# Logical operators in R
# ! - NOT
# & - AND
# | - OR

# Relational operators in R
# ==  (check equality)
# >=  (gte)
# >   (gt)
# <=  (lte)
# <   (lt)
# !=  (not equal to)

# Other important operators
# :         - for sequence
# $         - indexing (the 'element name' operator)
# = or <-   - assignment
# ~         - model formula



# Simple mathematical operations

# Op 1
3
# or
print (3)

#Op 2
3+2
3*2
3/2


# Exercise - try above operation/s with print
print(3+2)

#sprintf("sum of 3 and 2 is %s" , 3+2)
paste("sum of 3 and 2 is" ,3+2, sep = "     ")  # has a separator
paste0("sum of 3 and 2 is  " ,3+2)

?paste
# Find out integer and remainder part when 10 is divided by 0.6?

# Remainder
10 %% 0.6

# Integer division
10 %/% 0.6

#Functions in R
#Base R and functions that are linked to a package that is installed

# Syntax: function_name(arg1=,arg2=,..)

# Base Mathematical functions in R

# Find out sum of 3 and 2
sum(3,2)

# Exercise - get sum of a.) 1 to 5 b.) 1 to 1000



sum(1,2,3,4,5)

sum (1:1000)




# Other mathematical functions in R - 
# sqrt (x), exp(x), log(x), log(x,n) - log of x to base n
# log10(x) - log base 10, factorial(x), abs(x)
# floor(x) - greatest int < x
# ceiling(x) - smallest int > x
# Statistical functions in R - 
# Mean, min, max, N, sd, quantile, percentile


#Can do arithmetic operations
pi
sqrt(25)
2^2+5

log(1000)
log(1000, base = 10)

# Solve- Find mean of these numbers 1,2,3,4,3,2,1


mean(1,2,3,4,3,2,1)
#what do you observe


mean(c(1,2,3,4,3,2,1))
?mean


sum(1,2,3,4,3,2,1)
?sum

# <- or = is used as assignment operator in R
# Assign a value of 5 to an object p
# Items in R are stored as objects

p<-5   #Use Ctrl+Enter to execute a line of code
# or p = 5
p

# Can do Simple arithmetic operations
q<-p+5
q

# Say a store sells shirts and tees.
# Create 2 objects to capture sales for day 1 -
# 60 for shirts and 40 for tees

Sales_Shirts <- 60
Sales_Tees<-40

# Find total sales and save it in Sales_total object

Sales_Total <- Sales_Shirts + Sales_Tees
Sales_Total

# Day 2 sales are 70 and 20 resp. for Shirts and Tees
# Replace the day 1 values with day 2 in the objects

# Overwrting values of objects
Sales_Shirts <-70
Sales_Tees <- 20

# Print value of Sales_Total object. What do you observe?

Sales_Total

#Overwriting can change data types as well of the object
x<-5
x
x<-"Jigsaw"
x

#Checking the class of the object x
class(x)

#deleting/ removing an object from working environment
rm(x)
x
rm(Sales_Shirts, Sales_Tees, Sales_Total)

?rm

#Programatically figuring out objects
# ls will give the list of all objects
# that exists in existing environment

ls()

# removing everything from the environment
rm(list = ls())

# Data Structures in R
# Vectors, working with vectors
# Vector : Most Simplest structure in R .Only one data type

# How to create a vector?
# It consists of either numbers,strings, or logical values
# but not all of them together.
# It contains only 1 type of class
# Type of variables : Class of the variables
# (Integer,character,logical)

# c is the combining operator
x<-5 #it is a numeric vector of 1 element
x<-c('1','2','-5','6') # char vector of 4 elements
x

a<-3
a1<-c(a,a*4,-7*a)
a1

# NA
# NA means missing value
# Why do you think we will have any missing value in data?

# Create 3 vectors with 5 elements in each
# 1. Customer name
# 2. Age and 
# 3. whether or not Customer defaulted in paying loan


# 1. Customer name
Customer_Name<-c('Sam','Nick','Chris','Joe','Amenda')
Customer_Name

# What is the class (data type) of above vector?
class(Customer_Name)

#How many elements are there in the vector?
length(Customer_Name)

# 2. Age
Customer_Age<-c(18,25,34,NA,17)
Customer_Age
class(Customer_Age)
length(Customer_Age)

# 3. whether or not Customer defaulted in paying loan
Customer_Default<-c(TRUE,FALSE,TRUE,FALSE,NA) 
Customer_Default
class(Customer_Default)
length(Customer_Default)

# How do I even check if at all missing values exist in my data? 
# And how many of them are there?


# checking missing values/ it displays logical values in output
is.na(Customer_Name)
is.na(Customer_Age)
is.na(Customer_Default)

#count of missing
sum(is.na(Customer_Name))
sum(is.na(Customer_Age))
sum(is.na(Customer_Default))


# Arithmetic operations on vectors

# Create 2 vectors, with Weight (kg) and Height of 3 people
# Calculate BMI - (kg/m2)

weight<-c(90,65,75)
height<-c(170,168,145)
weight/(height^2)*(100^2)

# Try introducing an NA in one of the above vectors and check results

# Say I have 2 numeric vectors with score of 2 players in 5 ODIs
Player1 <- c(24,51,45,70,19)
Player2 <- c(34,72,11,70,56)

# Get the number of matches in which Player1 scored half centuries?


Player1_logical <- Player1 >= 50
sum(Player1_logical)

# Get number of matches in which Player 2 did well compared to Player 1

Player1_2 <- Player2 > Player1
sum(Player1_2)

#Vectors shouldn't have mixed type of data
# Note hierarchy of data types - Char > Numeric > Logical
p<-c(1,2,"g")
class(p)
p<-c(TRUE,FALSE,"G")
p<-c(TRUE,FALSE,3)
class(c(TRUE,FALSE,1))


x<-c(1,2,3,4)
class(x)
x1<-c(1.2,2.4,3.5,4.5)
class(x1)
x2<-c(1L,2L,3L,4L)
class(x2)


#factors
# data structure to store categorical variables.
gender<- c(1,2,1,2,1,2,1,2)
class(gender)
gender <- factor(gender, levels = c(1,2), labels = c("Male","Female"))
table(gender)

x <- c("yes","no","no","yes","no")
y <- as.factor(x)
class(y)
table(y)

#Searching with referencing within vectors
brand<-c("Nike","Adidas","Sketchers","Puma","NewBalance")
brand
brand[1]
brand[4]
brand[-1]
brand[1:2]

# Find brands at position 2 and 4?


brand[c(2,4)]

#assigning names
names(brand)<-c("b1","b2","b3","b4","b5")
names(brand)[4]
brand["b4"]
brand[c("b1","b2")]

# To get the length of a vector
length(brand)


# Matrix - A single data table with values of same data type
# in rows and columns

matrix1 <- matrix(c(1,2,3,1,5,7),
            nrow = 4, 
            ncol = 3)
matrix1

matrix1[,2]
matrix1[2,]
matrix1[2,2]



#Lists : Recursive vectors. 
#Can handle different data types or various sizes

# Create of list of 3-4 participants who joined a webinar
# Have their names, with their age and if they registered for
# a online certificate program. Call the list as my_list


my_list <- list( name = c("Prakhar", "Shivam", "Rajesh"), age = c (65, 54,43),
                 registered = c (TRUE, FALSE))

#Note the $ sign against each variable to distinguish the output as list variables
my_list

#To get a variable out of the list - 2 ways
my_list$age
my_list["age"]

class(my_list$age)
class(my_list["age"])

#Check list class. Note the difference
class(my_list$age)
class(my_list["age"])

my_list$age[2]
my_list[["age"]][2]

my_list[["age"]]

# Getting 2nd entity inside variable Age of my_list. This is double referencing
my.list[["age"]][2]

# Double square brackets are a must when we do double referencing
my_list[[3]]
my_list [[3]][2]


#dataframes
#Each column can be a different Data types. 
#Consider the following vectors : 

product=c("Bag","shoes","belt","belt")

total_price=c(500,1000,150,10000)

color=c("Blue","red","red","blue")

quantity=c(5,2,3,4)

#Create a dataframe
product_details <- data.frame(product,total_price,color,quantity,
                              stringsAsFactors=FALSE)

?data.frame

#Understand the idea of StringsAsFactors
product_details <- data.frame(product,total_price,color,quantity)

product_details
View(product_details)

class(product_details)

#To get idea about the variables and datatypes in a dataframe
# What are factor variables v/s Character variables?
str(product_details)

product_details[2,3]

#Selecting data out of a data frame/ traversing through the data
product_details[,2]
product_details[,c("total_price", "color")]


product_details[2,]

product_details[2,]

product_details[c(3,4),]

product_details[product_details$product == "belt" | product_details$color == "red" ,]

product_details[2,2]

head(product_details,2)
tail(product_details,2)

vec1<- c(1,2,3,4,5)

# Data frames - nxm

# Other functions in R


##Importing tabular data##

# Checks needed to ensure that data is imported correctly
#1. Delimiter in the file (sep argument)
#2. How missing values are populated in the data (na.strings)


# Using read.table command
import1<-read.table("D:\\Jigsaw Jitendra\\IPBA\\Training\\R\\Batch 10\\sample2.csv",sep=",",header = TRUE)

summary(import1) #Focus on the missing values
str(import1) #Are column data types correct
class(import1)

import2<-read.table("D:\\Jigsaw Jitendra\\IPBA\\Training\\R\\Batch 10\\sample1.txt")
#Do you see any error?

import2<-read.table("D:\\Jigsaw Jitendra\\IPBA\\Training\\R\\Batch 10\\sample1.txt",sep="\t")

import2#What is wrong?

import2<-read.table("D:\\Jigsaw Jitendra\\IPBA\\Training\\R\\Batch 10\\sample1.txt",
                    sep="\t",header=TRUE)
import2
summary(import2)
str(import2)

import2<-read.table("D:\\Jigsaw Jitendra\\IPBA\\Training\\R\\Batch 10\\sample1.txt",
                    sep="\t",header=TRUE,
                    na.strings = c(NA,"Missing",""))

import2<-read.csv("F:\\Jitendra\\IPBA\\Training\\R\\sample2.csv",
                  header=TRUE,
                  stringsAsFactors = FALSE)

import2$Location <- as.factor(import2$Location)

summary(import2)

str(import2)

##Data import is considered successfully: 
#1.Delimiters are identified correctly, 
#2.Missing values in the data are recognized as missing (NA)

#Syntax of various read. functions
# read.table(file, header = FALSE, sep = "", quote = "\"'",
#            dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),
#            row.names, col.names, as.is = !stringsAsFactors,
#            na.strings = "NA", colClasses = NA, nrows = -1,
#            skip = 0, check.names = TRUE, fill = !blank.lines.skip,
#            strip.white = FALSE, blank.lines.skip = TRUE,
#            comment.char = "#",
#            allowEscapes = FALSE, flush = FALSE,
#            stringsAsFactors = default.stringsAsFactors(),
#            fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)
# read.csv(file, header = TRUE, sep = ",", quote = "\"",
#          dec = ".", fill = TRUE, comment.char = "", .)
# 
# read.csv2(file, header = TRUE, sep = ";", quote = "\"",
#           dec = ",", fill = TRUE, comment.char = "", .)
# 
# read.delim(file, header = TRUE, sep = "\t", quote = "\"",
#            dec = ".", fill = TRUE, comment.char = "", .)
# 
# read.delim2(file, header = TRUE, sep = "\t", quote = "\"",
#             dec = ",", fill = TRUE, comment.char = "", .)


#Getting tables from web pages
#Many web pages contain tabular data as comma separated or tab separated
#UCI Abalone data set
web2<-read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data",header=FALSE)
web2

# Extras-Other functions in R

#SEQUENCE
sequence <- seq(100,200)
sequence

sequence_by <- seq(from = 10, to = 20, by = 0.5)
sequence_by

#REPEAT
repeat1 <- rep (1,5)
repeat1

#repeat a seq n times
rep(1:5,2)

# repeat each number in seq n times
rep(1:5, each = 2)

# Get seq 1,1,1.5,1.5,2,2

rep(seq(1,2,by=0.5), each = 2)

# Saving an object to working directory
save(repeat1, file ="repeat1.rda")
rm(repeat1) #removing from environment
ls() # checking environmet object list

# reloading saved object from directory to environment
load("repeat1.rda")
ls()

#Saving entire set of objects in directory
save.image("all_work.RData")
rm(list = ls())

load ("all_work.RData")