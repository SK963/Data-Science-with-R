# Create a vector as input.
vec <- c("East","West","East","North","North","East","West","West","West","East","North")

print(vec)
print(is.factor(data))

# Apply the factor function.
fact <- factor(vec , ordered = T)

fact

str(fact)
summary(fact)

#adding new entry in a factor gives a error which is not in the factor cluster
fact[12] <- "centre" 

help("factor")

#adding  a new entry in  esisting cluster of factors
fact[12] <- "North"
fact

#adding another level 
levels(fact) <- c(levels(fact) , "Central")
levels(fact)





help("table")

table(fact)

help("unclass")
unclass(fact) 


#generating factors
y <- gl(3, 4)
print(y)





#ordered factors
size <- factor(c("S" , "M", "L" , "XL" , "L" , "L") , 
               levels = c("S" , "M" , "L" , "XL" , "XXL" , "3XL"),
                          ordered = TRUE)
size

#unorder factors
size1 <- factor(c("S" , "M", "L" , "XL" , "L" , "L") , 
               levels = c("S" , "M" , "L" , "XL" , "XXL" , "3XL"))
size1   




?sample

sample(2,5)
sample(2,5,T)
sample(2,10,T,c(0.8,0.5))
