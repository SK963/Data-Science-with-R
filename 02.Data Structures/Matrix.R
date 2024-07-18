
#creating a matrix
v1 <-c(10,25,85)
v2 <-c(25,45,85)
v3 <- c(11,12,13)

rownames = c("R1", "R2", "R3")
colnames = c("C1", "C2","C3")





mat <- matrix(c(v1, v2, v3), nrow = 3, ncol = 3,  byrow = TRUE, 
              dimnames = list(rownames, colnames ))

mat
#------------------------------------------------------

#accessing matrix

#accessing  single row
mat[3,]


#accessing multiple rows
mat[c(1,3),]



#accessing single column
mat[,2]

#aaccessing multiple columns
mat[,c(1,3)]

# accessing particulat data
mat[1,2]

mat[c(1,3) , c(1,3)]


#-----------------------------------------------------------

#renaming columns of a matrix (only columns)
colnames(mat) <-c("Col1","Col2", "Col3")
colnames(mat)
mat

#renaming rows of a matrix 
rownames(mat) <-c("Row1","Row2","Row3")
rownames(mat)


help("dimnames")
dimnames(mat)
mat

dimnames(mat) <- list(c("R1","R2","R3") , c("C1","C2","C3"))

mat

#-------------------------------------------

#changing dimension of a matrix

x = matrix(1:12 , nrow = 3 , ncol  = 4 , byrow = TRUE)
x

dim(x)

dim(x) <- c(4,3)

x


#-------------------------------------------
#Adding rows and columns in the matrix

#adding column in the matrix
mat
mat <- cbind(mat,c(10,20,30))
mat


#adding row in the matrix
mat <- rbind(mat , c(11,12,13))

#adding new rownames and columnnames
dimnames(mat) = list(c(rownames(mat)[-4], "R4"),c(colnames(mat)[-4],"C4"))
mat

dimnames(mat)


#creating matrix without matrix function using cbind and rbind
m1 <- cbind(c(10,20,30) , c(40,50,60), c(70,80))
m1

m2 <- rbind(c(10,20,30), c(40,50,60),c(70,80))
m2

arr <- rbind(c(10,20,30))
arr


#creating a null matrix
NM = matrix(,nrow = 3 , ncol = 3, dimnames = list(c("R1","R2","R3"), c("C1","C2","C3")))
NM

# MATRIX OPERATION
m1 <- matrix(1:20 , rcol = 2 , rnow = 5)
m2 <- matrix(20:40 , rol = 2 , rnow = 5)

m1+m2


#transpose
m1
t(m1)

m1+t(m1)




