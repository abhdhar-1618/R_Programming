##----------------------Introduction to R--------------------------------#

# Some important shortcuts
# Use # for writing a comment
# Shift + Ctrl + C to comment and de-comment
# Hit Ctrl+Enter to run a line/ selected code
# Zoom In - Shift + Ctrl + +
# Zoom Out - Ctrl + -

# Google for R 
# www.rseek.org

# Let's start coding
# Print function



#getting help in R - use ? or help function

# Or 


## OPERATORS IN R ----
## 1 ##
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

# ## 2. ##
# Logical operators in R
# ! - NOT
# & - AND
# | - OR

# ## 3. ##
# Relational operators in R
# ==  (check equality)
# >=  (gte)
# >   (gt)
# <=  (lte)
# <   (lt)
# !=  (not equal to)

## 4. ##
# Other important operators
# :         - for sequence
# $         - indenxing (the 'element name' operator)
# = or <-   - assignment
# ~         - model formulae



# Simple mathematical operations

# Op 1 - print 3

# or


#Op 2 - x/y,x+y... etc.



# Exercise -
# Find out integer and remainder part when 10 is divided by 0.6?

# Remainder - %%



# Integer division - %/%



# Functions in R
# Base R and functions that are linked to a package that is installed


# Syntax: function_name(arg1=,arg2=,..)

# Base Mathematical functions in R


# Find out sum of 3 and 2



# Excercise - get sum of 
# a.) 1 to 5 




# Excercise - get sum of 
# b.) 1 to 1000




# Other mathematical functions in R - 
# sqrt (x), exp(x), log(x), log(x,n) - log of x to base n
# log10(x) - log base 10, factorial(x), abs(x)
# floor(x) - greatest int < x
# ceiling(x) - smallest int > x
# Statistical functions in R - 
# Mean, min, max, N, sd, quantile, percentile






# Exercise- 
# Find mean of these numbers 1,2,3,4,3,2,1





# what do you observe?





# Now check the syntax of mean function



# Now check the syntax of sum function



# Assignment operator
# <- or = is used as assignment operator in R


# Assign a value of 5 to an object p. Print the value of p
# Items in R are stored as objects




# We can do Simple arithmetic operations
# Create an object q, which is 5 more than the current value of p




# Say a store sells shirts and tees.
# Create 2 objects to capture unit sales for day 1 -
# 60 for shirts and 40 for tees




# Exercise -
# Find total sales and save it in Sales_total object




# Day 2 sales are 70 and 20 resp. for Shirts and Tees
# Replace the day 1 values with day 2 in the objects




# This is called as Overwriting values of objects




# Print value of Sales_Total object. What do you observe?





#Overwriting can change data types as well of the object




# Checking the class/ type of the object x - use class function



#deleting/ removing an object from working environment - use rm function
# Remove x and the try to print x







# Programatically figuring out objects
# ls will give the list of all objects
# that exists in existing environment





# Data structures in R
## 1. VECTORS ##
# Vectors and working with vectors
# Vector : Most Simplest structure in R .
# It Can have only one data type

# How to create a vector?
# It consists of either numbers,strings, or logical values
# but not all of them together.
# It contains only 1 type of class
# Type of vector : Class of the variables
# (Integer,character,logical)


# create a numeric vector xNum having 1 element of value 5



# Now create a char vector xChar of 4 elements 1,2,-5 and 6





# Vectors shouldn't have mixed type of data
# Let's try to create one with mixed data types




# check the class of above vector



# try some other variations of vectors with mixed data types



# Note from above exercise - 
# hierarchy of data types - Char > Numeric > Logical



# Integer class example - use of L






# Missing values in data
# NA
# NA means missing value
# Why do you think we will have any missing value in data?




# Arithmetic operations on vectors
# Create 2 vectors, with Weight (kg) and Height of 3 people
# Calculate BMI - (kg/m2)




# Try introducing an NA in one of the above vectors and check results




#Create 3 vectors with 5 elements in each
# 1. Customer name
# 2. Age and 
# 3. whether or not Customer defaulted in paying loan


# 1. Customer name
Customer_Name<-c('Sam','Nick','Chris','Joe','Amenda')
Customer_Name

# 2. Age
Customer_Age<-c(18,25,34,NA,17)
Customer_Age

# 3. wether or not Customer defaulted in paying loan
Customer_Default<-c(TRUE,FALSE,TRUE,FALSE,NA) 
Customer_Default



# What is the class (data type) of above vectors?



#How many elements are there in the vectors?




# How do I even check if at all missing values exist in my data? 
# And how many of them are there?




# checking missing values/ it displays logical values in output




#Exercise - 
# get count of missing values




# Say I have 2 numeric vectors with score of 2 players in 5 ODIs
Player1 <- c(24,51,45,70,19)
Player2 <- c(34,72,11,70,56)

# Exercise -
# Get the number of matches in which Player1 scored half centuries?




# Exercise - 
# Get number of matches in which Player 2 did well compared to Player 1





# factors
# data structure to store categorical variables.
gender<- c(1,2,1,2,1,2,1,2)
class(gender)




# you can use as.factor as well if you just want to change the data type




# Traversing a vector
#Searching with referencing within vectors

brand<-c("Nike","Adidas","Sketchers","Puma","NewBalance")
brand

# Get brand at position 1



# Get brand at position 4



# Get all brands but the first one



# Find brands at position 2 and 4?




## 2. MATRIX ##
# Matrix - A single data table with values of same data type
# in rows and columns

matrix1 <- matrix(c(1,2,3,1,5,7),
                  nrow = 4, 
                  ncol = 3)
matrix1


# Traversing a matrix

# Value at position 2,2

# Row 2

# col 2


## 3. LISTS ##
# Lists : Recursive vectors. 
# Can handle different data types or various sizes

# Create of list of 3-4 participants who joined a webinar
# Have their names, with their age and if they registered for
# a online certificate program. Call the list as my_list

# use list function



#Note the $ sign against each variable to distinguish the output as list variables


#To get a variable out of the list - 2 ways - 
# use $ or indexer brackets ["<ob name>"]




# Let us check basic difference in classes. 
# Note one is vector and other is list itself



# So how to traverse in a list



# or Getting 2nd entity inside variable Age of my_list. This is double referencing



# Double square brackets are a must when we do double referencing






#dataframes
# Data frames - nxm
#Each column can be a different Data types. 
#Consider the following vectors : 

product=c("Bag","shoes","belt","belt")

total_price=c(500,1000,150,10000)

color=c("Blue","red","red","blue")

quantity=c(5,2,3,4)

#Creare a dataframe
product_details <- data.frame(product,total_price,color,quantity,
                              stringsAsFactors=FALSE)

#Understand the idea of StringsAsFactors



#To get idea about the variables and datatypes in a dataframe - use str command
# What are factor variables v/s Character variables?




#Selecting data out of a data frame/ traversing through the data



# Exercise
# Select data point at 2nd row ,3rd col position


# Select 2nd row


# select 3 column


# Select total price and quantity




##Importing tabular data##

# Checks needed to ensure that data is imported correctly
#1. Delimiter in the file (sep argument)
#2. How missing values are populated in the data (na.strings)


# Using read.table command
# we will also use str and summary commands



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
