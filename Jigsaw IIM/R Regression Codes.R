a=read.csv("E:\\Main\\IPBA Jigsaw Docs\\Live Class Study Materials\\8-JAN-2022\\Butler.csv")
a
nrow(a)
ncol(a)

b=lm(Time~Miles+Deliveries, data = a)
summary(b)
predict(b)

sum((a[,4]-predict(b))^2)
X=matrix(c(a[,2], a[,3]), nrow = nrow(a))
X

X%*%solve(t(X)%*%X)%*%t(X)
diag(X%*%solve(t(X)%*%X)%*%t(X))

final_output=rep(0, nrow(a))

observed_y=a[,3]
predicted_y=predict(b)

for(i in 1:nrow(a))
  
  
  

  
a=read.table("E:\\Main\\IPBA Jigsaw Docs\\Live Class Study Materials\\8-JAN-2022\\carstopping.txt")    
a  

plot(a[,2], a[,1])

b=lm(StopDist~Speed, data=a)
summary(b)

fitted_values_model=predict(b)
error_estimated=a[,1]-fitted_values_model

plot(fitted_values_model, error_estimated)
abline(h=0, col="red")