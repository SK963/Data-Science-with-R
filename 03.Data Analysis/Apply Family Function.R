
#apply family fucntion

#apply  -> matrix , array  -> apply(array/matrix , margin , function)
mat <- matrix(1:9, nrow = 3 , byrow = T)
mat

result <- apply(mat, 1, sum)
# 1 for row operation , 2 for column operation , c(1,2) for both row and column operation

# Apply sum function to each row of a matrix
result1 <- apply(mat , 2 , sum)
result2 <- apply(mat , c(1,2) , function(x) x^2)

# Apply sum function to each column of a matrix
print(result)   # Output: 12 15 18
print(result1)  # Output : 6 15 24
print(result2)  
#Output : 
#[,1] [,2] [,3]
#[1,]    1    4    9
#[2,]   16   25   36
#[3,]   49   64   81


class(result)
class(result2)


#lapply  <- list , 
# Example: Apply square function to each element of a list
my_list <- list(a = 1:3, b = 4:6, c = 7:9)
my_list
lresult <- lapply(my_list, function(x) x^2)
print(lresult)  # Output: List containing squared elements
#output
# $a
# [1] 1 4 9
# 
# $b
# [1] 16 25 36
# 
# $c
# [1] 49 64 81





#sapply  <- list
# Example: Apply mean function to each element of a list and simplify result
my_list <- list(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
sresult <- sapply(my_list, mean)
sresult2 <- sapply(my_list , function(x) x^2)


print(sresult)  # Output: Vector containing means of each element
#Output : 
# a b c 
# 2 5 8 

class(sresult)  
# Output : vector ("numeric")

print(sresult2)
#Output :
# a  b  c
# [1,] 1 16 49
# [2,] 4 25 64
# [3,] 9 36 81

class(result2)  
#Output :"matrix" "array" 



#tapply  <- 
# Example: Apply mean function to subsets of a vector based on a factor
values <- c(1, 2, 3, 4, 5, 6)
factor <- c("A", "A", "B", "B", "B", "A")
tresult <- tapply(values, factor, mean)
print(tresult)  # Output: Mean of each subset
#OUTPUT: 
#A B 
#3 4 

class(tresult)
#"array"
dim(tresult)
# 2


#mapply
# Example: Apply sum function to corresponding elements of two vectors
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
mresult <- mapply(sum, vec1, vec2)
print(mresult)  # Output: Vector containing sums of corresponding elements
# 5 7 9
class(mresult)
# Output : "numeric"


#vapply
# Example: Apply mean function to each element of a list and specify output format
my_list <- list(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
vresult <- vapply(my_list, mean, numeric(1))
print(vresult)  # Output: Vector containing means of each element
#OUTPUT
# a b c 
# 2 5 8 
class(vresult)
#output : "numeric"




