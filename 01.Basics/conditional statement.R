# if else 
if(test_exp){
  staments;
}else{
  statements;
}



x = 0

if(x>0){
  print("positive number")
} else if (x<0){
  print("Negative Number")
}else{
  print("Zero")
}


a = 40
b = 40L

if(is.integer(a)){
  print("is integer")
}else if (is.numeric(b)){
  print("is numberic")
  
}

%in% function/ operator
z = c("How" , "when" , "what", "LPU","Good")
z
if("How" %in% z){
  print("How is there")
} else{
  print("not found")
}


#Switch Case statement
a = 1






# Following is val1 simple R program 
# to demonstrate syntax of switch. 

# Mathematical calculation 

val1 = 6
val2 = 7
val3 = ")"

result <- switch(
  val3,
  "+" = val1 + val2,
  "-" = val1 - val2,
  "/" = val1 / val2,
  "*" = val1 * val2,
  "%" = val1 %% val2,
  "^" = val1 ^ val2,
  cat("num1 = ", val1, "num2 = " , val2) 
)

cat("Result:", result, "\n")


print(result) 



# Following is val1 simple R program 
# to demonstrate syntax of switch. 

# Mathematical calculation 

val1 = 6
val2 = 7
val3 = "s"
result = switch( 
  val3, 
  "a"= cat("Addition =", val1 + val2), 
  "d"= cat("Subtraction =", val1 - val2), 
  "r"= cat("Division = ", val1 / val2), 
  "s"= cat("Multiplication =", val1 * val2), 
  "m"= cat("Modulus =", val1 %% val2), 
  "p"= cat("Power =", val1 ^ val2) 
) 

print(result) 

help("switch")
