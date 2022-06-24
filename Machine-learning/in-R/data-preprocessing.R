# Locating the working directory and dataset
getwd()
setwd("~/Udemy-exercises/Machine-learning")

# Import libraries
library(readr)

#install.packages('caTools')    --for training&test set
library(caTools)

#-- Importing dataset
#1:
#Data <- read.csv('~/Udemy-exercises/Machine-learning/dataset/Data.csv')
# OR
dataset <- read.csv("dataset/Data.csv")
View(dataset)

#-- Taking care of missing data
dataset$Age <- ifelse(is.na(dataset$Age),
                      ave(dataset$Age, FUN = function(x) mean(x, na.rm = T)),
                      dataset$Age)

dataset$Salary <- ifelse(is.na(dataset$Salary),
                      ave(dataset$Salary, FUN = function(x) mean(x, na.rm = T)),
                      dataset$Salary)

#-- Encoding categorical data
# Independent variable
dataset$Country <- factor(dataset$Country,
                          levels = c('France', 'Spain', 'Germany'),
                          labels = c(1,2,3))

# Dependent variable
dataset$Purchased <- factor(dataset$Purchased,
                          levels = c('No', 'Yes'),
                          labels = c(0,1))

#-- Split dataset into training and test set
#Note: in Python, we set split ratio for test set (20%)
     # in R, we set split ration for training set (80%)
set.seed(123)
split <-  sample.split(dataset$Purchased, SplitRatio = 0.8)
# if result of split return False, the result go to test set, true will go to training set

training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == F)

#-- Feature scaling for Age(#2) and Salary(#3)
training_set[,2:3] <- scale(training_set[,2:3])
test_set[,2:3] <- scale(test_set[,2:3])