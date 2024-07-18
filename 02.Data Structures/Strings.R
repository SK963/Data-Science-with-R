#Valid Strings 

a <- 'Start and end with single quote'
print(a)

b <- "Start and end with double quotes"
print(b)

c <- "single quote ' in between double quotes"
print(c)

d <- 'Double quotes " in between single quote'
print(d)



#-----------------------------String concatenation ------------------------------
?paste

a <- "Hello"
b <- 'How'
c <- "are you? "

print(paste(a,b,c))

print(paste(a,b,c, sep = "-"))

print(paste(a,b,c , sep = ""))

print(paste(a,b,c, collapse = ""))

print(paste(a,b,c, sep = "", collapse = ""))



#---------------------------Formatting -------------------------------------------
# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 9)
print(result)

# Display numbers in scientific notation.
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)

# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 5)
print(result)

# Format treats everything as a string.
result <- format(6)
print(result)

# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)

# Left justify strings.
result <- format("Hello", width = 8, justify = "l")
print(result)

# Justfy string with center.
result <- format("Hello", width = 8, justify = "c")
print(result)



#nchar <- length of a string
result <- nchar("Count the number of characters")
print(result)

#toupper and tolower function 

x <- "This is a Sample Text"

toupper(x)
tolower(x)



result <- "this is a sample text"

result <- substring("Extract", 5, 7)
print(result)

result
substring(result , 6, 7)


?strsplit

strsplit("a.b.c", ".")
strsplit("10-11-12" , "-")


#-------------------------------Regular Expression -------------------------------




















#-------------------------------Stringr package-----------------------------------
install.packages("stringr")
library(stringr)
str_trim(" Hello world ")






















