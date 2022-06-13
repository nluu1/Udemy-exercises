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

stats <- read.csv('~/R-exercises/dataset/P2-Demographic-Data.csv')
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