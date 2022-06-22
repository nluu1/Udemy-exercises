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

######################################
## Filtering (more about rows)
head(stats)
filter <- stats$Internet.users < 2 
#Take the vector filter with selected values (TRUE) and display it in data frame
stats[filter,]

stats[stats$Birth.rate > 40,]

#Filter both conditions
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]

stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]

######################################
## Visualization with Qplot
library(ggplot2)
?qplot

#Enclose the values/commands (e.g: size, color) inside I() to prevent R to map into data incorrectly

qplot(data=stats,x=Internet.users)

qplot(data=stats, x=Income.Group, y=Birth.rate)

qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(10)) #enclose size in I()

qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(10),
      color=I("Blue"))

qplot(data=stats, x=Income.Group, y=Birth.rate,
      geom="boxplot")

## part 2
qplot(data=stats,x=Internet.users, y=Birth.rate)

qplot(data=stats,x=Internet.users, y=Birth.rate,
      size=I(4)) #Increase size for every points by 4

qplot(data=stats,x=Internet.users, y=Birth.rate,
      color=I("red"),size=I(4)) #add color red

qplot(data=stats,x=Internet.users, y=Birth.rate,
      color=Income.Group,size=I(5)) #categorize data by Income Group

