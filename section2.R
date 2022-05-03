### Part 1: uncomment to view
# #interger
# #by default, number will be stored as double 
# #add a capital L to tell R the data is interger
# x <- 2L
# typeof(x)
# 
# #double
# y <- 2.5
# typeof(y)
# 
# #complex
# z <-  3 + 2i
# typeof(z)
# 
# #character
# a <-  "h"
# typeof(a)
# 
# #logical
# q1 <-  T
# typeof(q1)
# q2 <- FALSE
# typeof(q2)

#############################

# ##Part 2: uncomment to view
# 
# A <-  10
# B <-  5
# C <-  A + B
# C
# 
# var1 <- 2.5
# var2 <- 4
# 
# result <-  var1/var2
# result
# 
# answer <- sqrt(var2)
# answer
# 
# greeting <-  "Hello"
# name <- "Nhi"
# message <- paste(greeting,name)
# message

#############################

# ##Part 3: Logical operators
# 4 < 5
# 10 > 100
# 4 == 5
# 4 != 5
# # / means "OR"
# # ! means "NOT"
# # isTRUE(x)
# 
# result = 4 < 5
# isTRUE(result)
# result2 <- !TRUE
# #or result2 <- !(5 > 1)
# result2
# 
# result | result2
# result & result2

#############################

# ##Part 4: While loop
# while(FALSE){
#     print("Hello")
# }
# counter <- 1
# while(counter<12){
#     print(counter)
#     counter <- counter +1
# }

#############################

# ##Part 5: For loop
# counter <- 1
# while(counter<12){
#     print(counter)
#     counter <- counter +1
# }
# 
# for(i in 5:10){
#     print("Hello N")
# }

#############################

# ##Part 6: IF/ELSE

##Random variables: rnorm()

##nested if/else
# rm(answer)
# x <- rnorm(1)
# if(x>1){
#     answer <- "Greater than 1"
# } else{
#     
#     if(x>=-1){
#         answer <- "Between -1 and 1"
#     } else{
#         answer <- "Less than -1"
#     }
# }

##Elif
# rm(answer)
# x <- rnorm(1)
# if(x>1){
#     answer <- "Greater than 1"
# } else if(x>=-1){
#     answer <- "Between -1 and 1"
# } else{
#     answer <- "Less than -1"
# }

#############################
##Section 2 Practice

#Normal Distribution
#mean = 0; stdev = 1
#Count how many of these numbers fall between -1 and 1
#and divide the total quantity of N

#Know: E(X) = 68.2%
#Check Mean(X) -> E(X) while increasing N

##in R, i is not an index, but i IS the variable itself
#---------------------------
#Specify sample size N
N <- 1000
#Reset counter
counter <- 0
#Make a for loop and if statement
for(i in rnorm(N)){
    if (i>-1 & i<1){
        counter <- counter +1
    }
}
#Calculate hit ratio
answer <-  counter/N
#Print answer in console
answer