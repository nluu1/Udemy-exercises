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

#-------- Geometry(adding object) needed for data to be plotted on then continue with aes()
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
    geom_point()

#-------- Add more aes like color, size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre, size=BudgetMillions)) + 
    geom_point() 

#-------- Plotting with Layers
#Geometry is essentially just an addition to object.

test <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                                color=Genre, size=BudgetMillions))
#point
test + geom_point()

#line
test + geom_line()

#multiple layers
test + geom_line() + geom_point()

#-------- Overiding Aesthestic (this does not alter the original graph, object remained)
q <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,
                             color=Genre, size=BudgetMillions))
q + geom_point()

#overide 1
q + geom_point(aes(size=CriticRating))

#override 2
q + geom_point(aes(color=BudgetMillions))

#override 3 - for this, x axis title has to be renamed with xlab()
q + geom_point(aes(x=BudgetMillions)) +
    xlab("Budget Millions")

#override 4 - here size is not wrapped in aes(), because we are not MAPPING aes() but just SETTING the aes()
q + geom_point(size=1) + geom_point() #setting aes()

##### Mapping vs Setting aes()
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#--------- Add Color eg1:
#1 Mapping: if we want to map a color corresponding to variable
r + geom_point(aes(color=Genre))

#2. Setting certain color to data, do not need aes()
r + geom_point(color="DarkGreen")

#ERROR
# r + geom_point(aes(color="DarkGreen"))

#--------- Add Color eg2:
#1 Mapping: if we want to map a color corresponding to variable
r + geom_point(aes(size=BudgetMillions))

#2. Setting certain color to data, do not need aes()
r + geom_point(size=10)

#ERROR
# r + geom_point(aes(size=10))

#-------- Histograms and Density Charts (Statistics)
s <- ggplot(data=movies, aes(x=BudgetMillions))

## -- Histograms
s + geom_histogram(binwidth = 10)

#color by mapping
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#add border (not inside aes())
s + geom_histogram(binwidth = 10, aes(fill=Genre),color="Black")

## -- Density Chart
s + geom_density(aes(fill=Genre))

s + geom_density(aes(fill=Genre),position="stack")

#-------- Starting Layer Tips (more on aes())
# t <- ggplot(data=movies, aes(x=AudienceRating))
# 
# t + geom_histogram(binwidth = 10,
#                    fill="White",
#                    color="Blue")

#By this method, we don't have to come back and recreate the t object 
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White",
                   color="Blue")

t <- ggplot() #skeleton plot

#-------- Statistical Transformation
?geom_smooth #allows observation of trends and etc

u <- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating,
                             color=Genre))
u + geom_point() + geom_smooth(fill=NA) #meaning we don't want any fill to remove shades

# boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))

u + geom_boxplot()

u + geom_boxplot(size=1.2)

u + geom_boxplot(size=1.2) + geom_point() #adding geompoint is not so usefull

# do this:
u + geom_boxplot(size=1.2) + geom_jitter() #rather, adds this to aid the eyes on what the boxplot mean
#or this:
u + geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)

#-------- Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))

v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")

#facets: facet_grid(rows ~ columns)
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black") +
    facet_grid(Genre~.) #want Genre as rows

v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black") +
    facet_grid(Genre~., scales="free") #free up empty spaces

#scatterplots:
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             color=Genre))

w + geom_point(size=3)

#facets:
w + geom_point(size=3) +
    facet_grid(Genre~.)

w + geom_point(size=3) +
    facet_grid(.~Year) #want Year as column

w + geom_point(size=3) +
    facet_grid(Genre~Year) #combination

#optimize chart
w + geom_point(aes(size=BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre~Year)

#-------- Coordinates (limits, zoom)

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             color=Genre))
m + geom_point()

#limit: only want to select/view a part of the graph by removing data

m + geom_point() +
    xlim(50,100) +
    ylim(50,100) ### this method won't work well all the time

#Why it won't work all the time?
n <- ggplot(data = movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") +
    ylim(0,50) #### this DOES NOT work
## Instead: use ZOOM
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") +
    coord_cartesian(ylim = c(0,50))

#-- Improvement
w + geom_point(aes(size=BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre~Year) +
    coord_cartesian(ylim=c(0,100))

#-------- Themes
o <- ggplot(data = movies, aes(x=BudgetMillions))

h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

h

#Add axis labels

h + 
    xlab("Money Axis") +
    ylab("Number of Movies") +
    theme(axis.title.x = element_text(color="DarkGreen", size=30),
          axis.title.y = element_text(color="Red", size=30))

#Tick mark formatting

h + 
    xlab("Money Axis") +
    ylab("Number of Movies") +
    theme(axis.title.x = element_text(color="DarkGreen", size=30),
          axis.title.y = element_text(color="Red", size=30),
          axis.text.x = element_text(size=20),
          axis.text.y = element_text(size=20))
?theme #more here

#Legend formatting

h + 
    xlab("Money Axis") +
    ylab("Number of Movies") +
    theme(axis.title.x = element_text(color="DarkGreen", size=30),
          axis.title.y = element_text(color="Red", size=30),
          axis.text.x = element_text(size=20),
          axis.text.y = element_text(size=20),
          legend.title = element_text(size=30),
          legend.text = element_text(size=20),
          legend.position = c(1,1), #0:left; 1:right
          legend.justification = c(1,1))

#Title formatting

h + 
    xlab("Money Axis") +
    ylab("Number of Movies") +
    ggtitle("Movie Budget Distribution") + #add title
    theme(axis.title.x = element_text(color="DarkGreen", size=30),
          axis.title.y = element_text(color="Red", size=30),
          axis.text.x = element_text(size=20),
          axis.text.y = element_text(size=20),
          legend.title = element_text(size=30),
          legend.text = element_text(size=20),
          legend.position = c(1,1), 
          legend.justification = c(1,1),
          plot.title = element_text(color="DarkBlue",
            #format title                        size=40,
                                    family="Courier"))
