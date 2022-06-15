# R-exercises
This is my notes and codes for R exercises on Udemy

## Section 1: Overview of contents 

## Section 2: Core Concepts
>:page_facing_up:: section2.R

- Types of variables, operators, and usage of each
- While and For Loop
- If/else statement
- >:blue_book:: Dealing with large numbers in normal distribution

## Section 3: Fundamentals 
>:page_facing_up:: section3.R

- Vector, type of datas, and coercion hierarchy
- Functions used with vectors: c() seq() rep()
- Vectorized operations: specific and conventional
- R packages
- Different approaches in R
- >:blue_book:: Financial statement analysis (section3-statement-analysis.R)


## Section 4: Matrices
>:page_facing_up:: section4.R | section4-p2.R

#### Part I
- Building matrices with matrix() cbind() rbind()
- Naming dimensions, colnames(), rownames()
#### Part II
- Matrix operations
- Visualizing Matplot()
- Subsetting
- Creating functions
- Deriving insights
- >:blue_book:: Basketball Free Throw (section4-basketball-freethrow.R)

## Section 5: DataFrame
>:page_facing_up:: section5.R | section5-p2.R

>:paperclip: dataset: P2-Demographic-Data.csv | P2-Section5-Homework-Data.csv

#### Part I
- Importing/Reading data into R
- Exploring datasets: head(), tail(), summary(), str()
- Working within dataframe wtih $
- Basic operations with dataframes: adding/removing columns, factors, levels, etc
- Filtering a dataframe
- Qplot 
##### Part II
- Building/merging data frame from vectors
- More on Qplot
- >:blue_book:: World Trends (section5-world-trends.R)

## Section 6: Advanced Visulization with GGplot (ongoing)
>:page_facing_up:: section6.R | 

>:paperclip: dataset: P2-Movie-Ratings.csv | Section6-Homework-Data.csv

- GGplot2: Grammar of Graphics 
```
 Data
 Aesthestics: how the data is mapped, what we see (color, size, axis)
 Geometries: ways to translate data into aesthetic, like geom point, geom bar, etc
 Statistics: new variables, transform more data
 Facets: multiple of the same charts for various categories
 Coordinates: normal coordinates (x,y), zooming, etc
 Theme: chart polish
```
- Factors in R
- Aesthetics & ggplot()
- Plotting with layers
- Overriding Aesthetics
- Mapping vs Setting
- Histograms and Density Charts
- Starting layer tips
- Statistical Transformation
- Using facets
- Coordinates
- Themes
- >:blue_book:: Movie Domestic % Gross (section6-domestic-gross.R)
