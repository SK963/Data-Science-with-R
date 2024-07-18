function_name <- function(args){body}


t
f1 <- function(a=6 , b= 0){
  print(a)
}

#-------------------------------Varargs in function ----------------------------------
addsum <- function(x,...){
  args <- list(...)
  for (a in args) x<- x+a
  print(x)
  
}

addsum(0 ,1,2,3,4,5)


#Function to calculate factorial
factorial <- function(n) {
  if (n == 0 || n == 1)
    return(1)
  else
    return(n * factorial(n - 1))
}

result <- factorial(5)
print(result)

is_even <- function(x) {
  if (x %% 2 == 0)
    return(TRUE)
  else
    return(FALSE)
}


result <- is_even(8)
print(result) # Output: FALSE


sum_values <- function(...){
  values <- list(...)
  total <- sum(unlist(values))
  return(total)
}

sum_val <- function(...){
  values <- c(...)
  total = 0
  for (val in  values)
    total <- total+ val
  return (total)
  
}

# Calling the function with different numbers of arguments
result1 <- sum_values(1, 2, 3, 4)
result2 <- sum_values(5, 6, 7)
print(result1)
#Output: 10
print(result2)
#Output: 18

sum_val(1, 2, 3, 4, 5)


help("unlist")


#------------------------------lazy evaluation------------------------------------------

# Define a function that does not access its argument
my_function <- function(x) {
  # No reference to 'x' within the function body
  return("Function executed!")
}

# Call the function without parameters
result <- my_function()
result




# Create a function with arguments.
new.function <- function(a, b) {
  print(a^2)
  print(a)
  print(b)
}

# Evaluate the function without supplying one of the arguments.
new.function(6)


func <- function(a,b){
  print(a)
}

func(10)
args(func)


#------------------------------CLOSURES --------------------------------------









mean
UseMethod



#--------------------------------------------SCOPING RULES -------------------------------#



#------------------------------------SYMBOL BINDING -----------------------------------------#

search()


make.power <- function(x) {
  pow <- function(y) {
    y ^ x
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)

cube(4)
square(4)


#checking the environment of a function
ls(environment(cube))
ls(environment(square))
ls(environment(make.power))



get("n" , environment(square))

y<- 10

f <- function(x){
  y<-2
  y^2 +g(x)  #4 + 30  Y from local env for the first part
}

g <- function(x){
  x*y  #3*10  y from global env
}

f(3)

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)


x <- 5

y <- if(x < 3) {
  NA
} else {
  10
}
y

