## This is the lab for Monday, week 1. 
## Add working R code inbetween the questions
## The sections refer to the sections in https://rspatial.org/intr/index.html which will be a useful reference for the lab if you have not used R before



#this is my favorite r package, so I will be using some functions to perform tasks. I hope that is okay
library(tidyverse)


#Basic Data Types


## 1) create a vector with all uneven numbers between 1 and 25
q1 <- seq(1,25,2)



## 2) create, and assign to a variable, a vector with the names of four California cities 
#note that a vector can be anything that contains different little variables 
q2 <- c("Anaheim", "Davis", "Sacramento", "Los Angeles")


## 3) test whether the names in the variable created above include a space, and create a new variable with only these names
#note that a vector can be anything that contains different little variables 
q3_spacecities <- c("Los Angeles")


## 4) change the above created (character) variable into a categorical variable (factor)
class(q3_spacecities)
q4 <-as.factor(q3_spacecities) 
class(q4)


## 5) create a the following sequence of 20 numbers: 5, 10, 15, ..., 100
q5_seq <- seq(from = 5, to = 100, by = 5)


#Basic Data Structures 

## 6) create a variable 'x' that holds this matrix (without typing in all the numbers!)

##     [,1] [,2] [,3] [,4]
##[1,]    5   10   15   20
##[2,]   25   30   35   40
##[3,]   45   50   55   60
##[4,]   65   70   75   80
##[5,]   85   90   95  100

#creating matrix
q6_x <- matrix( data = q5_seq, ncol = 4, nrow = 5) 

#viewing my matrix
q6_x

## 7) add, to the matrix above, a column with the values 1 to 5


column_a <- c(1,2,3,4,5)

q7_m2 <- cbind(q6_x,column_a)


## 8) create a data.frame of the four California cities from question 2 and add two numerical variables (e.g. population) (the numbers do not matter).
# four vectors
ID <- as.integer(1:4)
name <- q2
population <- as.factor(c('1','2', '1', '2'))
score <- as.factor(c('10', '20', '10', '20'))
q8_d <- data.frame(name, population, score)

q8_d

## 9) create a list than contains the answers to question 1, 2, 3, and 4

q9 <- list(q1, q2, q3_spacecities, q4)



##################################################
##    This is the lab for Wednesday, week 1     ## 
##################################################

## Indexing


## 10) create a matrix by sub-setting matrix 'x' (question 6) by extracting the third and fourth column of 'x'
?matrix

###this is asking me for two columns, so

q10_x <- q6_x[, c(3, 4)]

###note to self: I did not use '3', '4', bc that leads to dinames error. 

###viewing my results
q10_x


## 11) which elements in matrix 'x' are larger than 80?

#asking to only return values over 80
q11 <- q10_x[q10_x >80]

q11


## Algebra

 
## 12) create 20 random numbers between 0 and 1 

###getting info on runif function
?runif

###Asking to return 20 numbers, which are all between 0 and 1
q12 <- runif(20)


q12


## 13) multiply them by 100

q13 <- q12*100

q13


## 14) create a 5 x 4 matrix 'y' of these numbers
?matrix

q14_y <- matrix(data = q13, nrow = 5, ncol = 4)

q14_y

## 15) multiply this matrix with a vector of 1 to 5

q15 <- q14_y * 1:5 

q15


## 16) multiply 'y' with 'x'

q16<- q14_y * q6_x

q16


## Read and Write Files

## R comes with some data sets. See `data()` for a list. These are useful for examples and exercises.  
## E.g. "state.x77"


## 17) Write the state.x77 data to a "text" file (e.g. "csv" format)

###d will contain the built in data set state.x77
d <- state.x77

###I am writing csv, saving it as state.csv. My path is already set, so it will land in my ESP 106 folder
write.csv(d, "state.csv")

d


## 18) Read the data from this file into a variable "states"
states <- read.csv("state.csv")

## 19) What is the number of columns of state.x77 and of states? And why are they different?

#viewing the data in table format
view(d)

#glimpse function, which comes from tidyverse libraries gives info like rows and columns. There are eight columns listed which using glimpse
glimpse(d)

#viewing as table
view(states)

#using glimpse for quick info. 9 columns listed. 
glimpse(states)

####The number of columns is different because state.x77 stores state names as row names, rather than a column. And when we write the data into a CSV, the row names turned into a regular column.   

## Data Exploration


## 20) for each variable in state.x77, use a function to compute the minimum and a function to compute the mean value

#Note that filter() won't work on columns 

# minimum 
q20_min <- apply(d, 2, min)

# mean
q20_mean <- apply(d, 2, mean)


q20_min

q20_mean


#libraries I like for tables
library(flextable)
library(webshot)


## 21) Use functions summary, table, quantile, and boxplot to summarize the data for life expectancy in the state.x77 data

##so only wants info on life expectancy 

#using summary function
summary(states)

#Isolating the columns I want to stay
state_life <- states %>%
  summarize("State" = X , 
            "Life Expectancy in Years" = Life.Exp)


state_life


##I am going to take the mean, median, standard deviation, and interquartile range of the Life.Exp using pipes to stay organized

bettertable <- state_life %>% 
  summarize("Mean" = mean(`Life Expectancy in Years`), 
            "Median" = median(`Life Expectancy in Years`),
            "SD" = sd(`Life Expectancy in Years`), 
            "IQR" = IQR(`Life Expectancy in Years`))

##using table function, whcih results in a simple table
q21table <-table(bettertable)

q21table


##I want a more presentable table, so now I am going to prepare the background for my tables. I want a white/transparent background 
set_flextable_defaults(background.color = "white")

#making a table with the stats I found, for Life Expectancy 
q21_bettertable <- flextable(bettertable) %>%
  set_caption("Life Expectancy Statistics")%>% 
  align(align = "center")

q21_bettertable

#quantiles
quan <- quantile(states$Life.Exp)

quan

?boxplot
#making boxplot
box <- boxplot(state_life$`Life Expectancy in Years`, ylab = "Life Expectancy in Years")
##note can also use ggplot 

