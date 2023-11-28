a<-read.csv("C:/Users/K201/Desktop/Armand's.csv")
a[,1]
a[,2]
a[,3]
n<-length(a[,2])


x<-a[,2]  # stores population figures
y<-a[,3] # stores sales figures


x_ave<-mean(x)
y_ave<-mean(y)

sum_1<-0
sum_2<-0
for(i in 1:n)
{
  sum_1<-sum_1+(y[i]-y_ave)*(x[i]-x_ave)
  sum_2<-sum_2+(x[i]-x_ave)^2
}

beta_hat<-sum_1/sum_2  # estimated beta

alpha_hat<-y_ave-beta_hat*x_ave  # estimated alpha


y_est<-rep(0, n) # creates a zero vector of length n

for(i in 1:n)
{
  y_est[i]<-alpha_hat+beta_hat*x[i]
}


TSS<-0
SSR<-0

for(i in 1:n)
{
  TSS<-TSS+(y[i]-y_ave)^2
  SSR<-SSR+(y_est[i]-y_ave)^2
}

r_square<-SSR/TSS
