# Create two vectors of different lengths.
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

# Take these vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3,2))
print(result)

result

help("column.names")

help("array")


# Create two vectors of different lengths.
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

# Take these vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3,2),dimnames = list(row.names,column.names,
                                                                  matrix.names))
print(result)




(a1 <- array(c(10,50,28,96,35,75,85),
              dim= c(2,2,6)))




v1 <- c(1,5,7,45,78,98)
v2 <- c(10,12,15,18,16,11)
(a2 <- array(c(v1,v2), dim = c(3,3,4),
             dimnames= list(c("R1","R2","R3","R4"),c("C1","C2","C3"),
                            c("M1","M2","M3","M4"))))

a2
a2[2,,]
a2[,3,c(1,3)]
a2[2,3,4]
a2[,,3]
a2[c(1,3),1:2,c(2,4)]