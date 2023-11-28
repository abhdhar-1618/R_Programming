library(ggplot2)
library(datasets)
head(iris)
table(iris$Species)
View(iris)

plot(iris$Petal.Length)

plot(iris$Sepal.Length~iris$Petal.Length)

plot(iris$Sepal.Length~iris$Petal.Length,ylab="SEPAL LENGHT",xlab="PETAL LENGHT",main="SEPAL LENGHT vs PETAL LENGHT")

plot(iris$Sepal.Length~iris$Petal.Length,ylab="SEPAL LENGHT",xlab="PETAL LENGHT",main="SEPAL LENGHT vs PETAL LENGHT",col="green",pch=16)

hist(iris$Sepal.Width)

hist(iris$Sepal.Width,xlab="SEPAL WIDTH",main="Distribution of Sepal Width",col="aquamarine3")

boxplot(iris$Sepal.Length~iris$Species)
boxplot(iris$Sepal.Length~iris$Species,xlab="Species",ylab="Sepal Length",main="Sepal Length of different Species",col="burlywood")

ggplot(data=iris)
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length))
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length))+geom_point()
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,col=Species))+geom_point()
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,col=Species,shape=Species))+geom_point()

read.csv("E:/Main/YOUTUBE/EDUREKA Classes/house_data_train.csv")->house
View(house)
library(dplyr)
library(ggplot2)

### For removing the 1st column from the dataset

house %>% select(c(-1))->house
View(house)

##Geometry

## Histogram

ggplot(data=house,aes(x=SalePrice))+geom_histogram()
ggplot(data=house,aes(x=SalePrice))+geom_histogram(bins=70,fill="palegreen4")
ggplot(data=house,aes(x=SalePrice))+geom_histogram(bins=70,fill="palegreen4",col="green")

## Position
ggplot(data=house,aes(x=SalePrice,fill=CentralAir))+geom_histogram()
ggplot(data=house,aes(x=SalePrice,fill=CentralAir))+geom_histogram(position="fill")

## Bar Plot

ggplot(data=house,aes(x=CentralAir))+geom_bar()
## CentralAir-PavedDrive
ggplot(data=house,aes(x=CentralAir,fill=PavedDrive))+geom_bar()
ggplot(data=house,aes(x=CentralAir,fill=PavedDrive))+geom_bar(position="fill")
## CentralAir-PavedDrive-Fence... EXPERIMENT


### Frequency-Polygon
ggplot(data=house,aes(x=SalePrice))+geom_freqpoly()
ggplot(data=house,aes(x=SalePrice))+geom_freqpoly(bins=60)
ggplot(data=house,aes(x=SalePrice,col=CentralAir))+geom_freqpoly(bins=60)

### Box_Plot

ggplot(data=house,aes(x=factor(BedroomAbvGr),y=SalePrice))+geom_boxplot()
ggplot(data=house,aes(x=factor(BedroomAbvGr),y=SalePrice,fill=factor(BedroomAbvGr)))+geom_boxplot()
ggplot(data=house,aes(x=factor(BedroomAbvGr),y=SalePrice,fill=CentralAir))+geom_boxplot()


## Smoothline

ggplot(data=house,aes(y=SalePrice,x=GrLivArea))+geom_smooth()
ggplot(data=house,aes(y=SalePrice,x=GrLivArea,col=CentralAir))+geom_smooth(se=F)

#method="lm"
ggplot(data=house,aes(y=SalePrice,x=GrLivArea))+geom_point()+geom_smooth(method="lm",se=F)
ggplot(data=house,aes(y=SalePrice,x=GrLivArea,col=CentralAir))+geom_point()+geom_smooth(method="lm",se=F)

##FACETING

ggplot(data=house,aes(y=SalePrice,x=GrLivArea,col=factor(Fireplaces)))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid(~Fireplaces)


##THEMES-1

ggplot(data=house,aes(x=factor(BedroomAbvGr),y=SalePrice,fill=factor(BedroomAbvGr)))+geom_boxplot()
ggplot(data=house,aes(x=factor(BedroomAbvGr),y=SalePrice,fill=factor(BedroomAbvGr)))+geom_boxplot()->OJ1
OJ1+labs(title="Price WRT Bedrooms",x="Bedrooms",fill="Bedrooms")
OJ1+labs(title="Price WRT Bedrooms",x="Bedrooms",fill="Bedrooms")->OJ2
OJ2+theme(panel.background=element_rect(fill="palegreen2" ) )
OJ2+theme(panel.background=element_rect(fill="palegreen2" ) )->OJ3
OJ3+theme(plot.title=element_text(hjust=0.5,face="bold",colour="cadetblue") )
OJ3+theme(plot.title=element_text(hjust=0.5,face="bold",colour="cadetblue") )->OJ4
OJ4+scale_y_continuous(labels=dollar)


###changelog github testing

### Edureka Class Link https://www.youtube.com/watch?v=N5gYo43oLE8&t=728s

























