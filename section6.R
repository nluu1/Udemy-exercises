#Import dataset
getwd()
movies <- read.csv('~/R-exercises/dataset/P2-Movie-Ratings.csv',stringsAsFactors = T)

#------ GGplot hierarchy
# Data
# Aesthestics: how the data is mapped, what we see (color, size, axis)
# Geometries: ways to translate data into aesthetic, like geom point, geom bar, etc
# Statistics: new variables, transform more data
# Facets: multiple of the same charts for various categories
# Coordinates: normal coordinates (x,y), zooming, etc
# Theme: chart polish 

#Import library
library(ggplot2)

#-------- Data set preparation

#Clean data
colnames(movies) <- c("File","Genre","CriticRating","AudienceRating","BudgetMillions","Year")

#glimpse
head(movies)
tail(movies)
str(movies)
summary(movies)

#For some variables, like year, we don't want it to be numerical variable with descriptive statistic
#So we need to make it into factors, with categorical variable
#Make variables  Factor
factor(movies$Year) #check
movies$Year <- factor(movies$Year) #change

#-------- Aesthetics
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#-------- Geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
    geom_point()

#--- Add more aes like color, size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre, size=BudgetMillions)) + 
    geom_point() 




