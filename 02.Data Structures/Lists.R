x <- list(range = 1:10 ,vector = c(10:20) ,string = "this is a text" )
x
# $range
# [1]  1  2  3  4  5  6  7  8  9 10
#
# $vector
# [1] 10 11 12 13 14 15 16 17 18 19 20
#
# $string
# [1] "this is a text"

#accessing direct element 
#using [] operator
x[1]
# $range
# [1]  1  2  3  4  5  6  7  8  9 10


#using [[]] operator
x[[1]]
#[1] 10 11 12 13 14 15 16 17 18 19 20


#using dollar 
x$string
# [1] "this is a text"


#accessing multiple elements  using [] operator only

x[c(1,3)]
# $range
# [1]  1  2  3  4  5  6  7  8  9 10

# $string
# [1] "this is a text"


#accessing a targed named element using another variable 
element_name = "string"
x[[element_name]]
# [1] "this is a text"

x$element_name#looks for elements names only
# NULL


#accessing nested elements using [[]] operator only
#METHOD 1
x[[c(2,1)]]
# [1] 10

#METHOD 2
x[[1]][[3]]
# [1] 3

x[[3]][[1]] #if not found then result the upper level element
# [1] "this is a text"
