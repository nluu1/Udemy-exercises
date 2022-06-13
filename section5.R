#############################
## Importing data into R

#Method 1: manually
stats <- read.csv(file.choose())
stats

#Method 2: Set WD and read data from there
getwd()

#for windows
setwd("C:\\Users\\Nhi\\Documents\\R-exercises")

# #for Mac
# setwd("/Users/Nhi/Desktop/...")

stats <- read.csv('~/R-exercises/dataset/P2-Demographic-Data.csv',stringsAsFactors = T)
stats

##########################################
## Exploring dataset
View(stats)
#Check number of rows/columns, head/tail to make sure it's right
nrow(stats)
ncol(stats)
head(stats,n=10)
tail(stats,n=8)
str(stats) #glimpse at dataframe structure
# str() standas for struction, not string
# runif() not run-if, but r-unif() in R
summary(stats)

#########################################
## Working within data frame with $ 
head(stats,n=5)
#Locating Country Angola Birth rate
stats[3,3]
stats["Angola",3] #Gives NA
#In dataframe, there is name for columns, but no names for rows
#Thus we have to utilize the $ sign to navigate through rows

#Locating column Internet users in 2 ways:
stats$Internet.users
stats[,"Internet.users"]

#Locate 2nd row in the column Internet users:
stats$Internet.users[2]

#Fixing NULL problem when assigning levels
# stats$Income.Group<- as.factor(stats$Income.Group)
## Or insert option stringsAsFactors = T when read.csv()
levels(stats$Income.Group)

########################################################
## Basic Operations with Dataframe

### Subsetting
stats[1:10,] #first 10 rows, all columns
stats[3:9,]
stats[c(4,100),]#row 4th and 100th, all columns

### Dimensions
### [] in dataframe does not change into vector with rows like in matrix
stats[1,]
is.data.frame(stats[1,]) #data.frame

### HOWEVER with columns:
stats[,1]
is.data.frame(stats[,1]) #NOT data.frame
stats[,1,drop=F] #use drop=F to preserve data.frame

### Math operations within columns (vectorized column)
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

### Adding column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users

stats$xyz <- 1:5 #This insufficient length vector produce a recycled vector throughout all columns

### Removing column (similar to name remove)
stats$MyCalc <- NULL
stats$xyz <- NULL
