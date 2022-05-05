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
