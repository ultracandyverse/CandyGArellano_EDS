## This is the lab for week 2 
## Add working R code in between the questions
## The functions refer to the sections in https://rspatial.org/intr/

## Functions

## 1) Write a function 'f' that behaves like this:
## > f('Jim')
## [1] "hello Jim, how are you?"
##HINT: you will need to use the paste() function within your new function

f <- function(name) {
  x <- paste("Hello", name, ", what are your plans this weekend?")
  return(x)
}

f('Candy')

## 2) Write a function 'sumOfSquares' that behaves like this:


## > d <- c(1,5,2,4,6,2,4,5)
## > sumOfSquares(d)
## [1] 21.875

# To compute the "sum of squares", subtract the mean value of all numbers from each number. 
# Square these numbers and sum them
# (bonus: make a variant that can handle NAs)
sumOfSquares <- function(x) {
  m <- mean(x, na.rm = TRUE)
  sum( (x-m)^2, na.rm = TRUE) 
}

#combining values into vector d 
d <- c(1,5,2,4,6,2,4,5)

sumOfSquares(d)


## Flow Control

## 4) Write a for loop that adds the numbers 1 to 10
##HINT: you will need one variable that loops through the numbers 1 to 10 and one that keeps count through each loop


#for-loop repeats the same code a predefined number of times 
j <- 0
for(i in 1:10) { 
  print(i)
  q4 <- j + i}

## 5) Write a for loop that adds the odd numbers between 1 and 10 

#sum variable
odd_sum <- 0 

#for-loop, where %% in a operator..saying if remained of e/2 is 1 then add it to the total 

for(e in 1:10) {
  if (e %% 2 ==1) {
    odd_sum <- odd_sum + e
  }
}

#result

odd_sum

