#Part 1: Vector
#In R, vector length count starts with 1
#In R, number in vector auto store as num/double
#Use L after number to make it integer

v1 <- c(1,2,3,4)
#Checking for type of data
is.numeric(v1)
is.integer(v1)
is.double(v1)
is.character(v1)

v2 <- c(11L,10L,13L)

v3 <- c("hi","bye","3")

#Coercion Hierarchy of data type in R:
#logical < integer < numeric < character

#sequence function-like':'
#seq(x:y) or seq(x,y,step)

seq(1,15)
seq(1:12) #':'is same as ','
#but using ",", you can specify the step:
seq(1,15,2) #step by 2

z <- seq(1,15,4) #store in variable

#replicate function: rep(x,number of times to rep)
rep(3,50)
d <- rep(3,50)
rep("a",5)
x <- c(80,20)
y <- rep(x,10)
y
###############################
##Part 2: using brackets to access vectors
x <- c(1,123,534,13,14) #combine
y <- seq(201,250,11) #sequence
z <- rep("Hi!",3) #replicate
w <- c("a","b","c","d","e")
w
w[1]
w[2]
w[-1] #get a list EXCEPT 1
w[-2]
w[1:3] #get a range of vector
w[c(1:3,5)]
w[c(-2,-4)]
w[-3:-5]
w[1:3]

################################
##Part 3: Vectorized operations
x <- rnorm(5)
x
#specific programming loop
for(i in x){
    print(i)
}
#conventional loop
for(j in 1:5){
    print(x[j])
}
################################
##Part 4: different approach in R
N <-  100
a <- rnorm(N)
b <- rnorm(N)
##2 approaches below produce the same resultS:
#vectorized approach: used more in R
c <- a*b #R work on vectors

#de-vectorized approach
d <- rep(NA,N) #make an empty vector
for(i in 1:N){ #we have N elements
    d[i] <- a[i]*b[i]
} 
###############################
##Part 5: Functions in R

rnorm()

c()
seq()
rep()

print()

is.numeric()
is.interger()
is.double()
is.character()

typeof()

sqrt()
paste()

#Type question mark next to function to bring up help
?rnorm()
rnorm(n=5,mean=10,sd=8)

?seq()
seq(from=10,to=00,by=100)
seq(from=10,to=20,length.out=100)

?rep()
rep(5:6, times=10)
rep(5:6,each=10)

#####################################
##Part 6: Packages

install.packages("ggplot2")

qplot() #no access to function yet

library(ggplot2) #activate package

qplot() #now it works
qplot(data=diamonds, carat, price,
      colour=clarity,facets=.~clarity)
