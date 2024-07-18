
#Errors and Debugging 

#Types of error/warnings

log(-1)



#difference between invisible and return statement
#retunn statemennt assings and prints 

printmessage <- function(x){
  if(x> 0){
    print("x is greater than zero")
  }
  else
  {
    print("x is less than zero")
  }
  
  return(x)
}

#invisible statement just assingn without printing
printmessage2 <- function(x){
  if(x> 0){
    print("x is greater than zero")
  }
  else
  {
    print("x is less than zero")
  }
  
  invisible(x)
}

printmessage(4)
printmessage2(4)

printmessage(NA)
printmessage2(NA)

#Debugging tools

mean(x)

traceback()
lm(y~x)
traceback()



debug(lm)
lm(y~x)

#open the code and print it simultanously 
#and opens the browser windows  which is like a
# environment inside environment or like a workspace






options(error = recover)
read.csv("nosuchfile")

#opens the layers/levels of the function call stack 
#and then select where the problem occurs
