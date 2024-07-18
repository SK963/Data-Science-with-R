
data_pvc <- read.csv(file.choose() , row.names = 1)
View(data_pvc)
data_pvc


class(data_pvc)
mat_pvc <- as.matrix(data_pvc)
mat_pvc

class(mat_pvc)
str(mat_pvc)
str(data_pvc)


#--------------------max----------------
max(mat_pvc[1,])

#looping
for(i in  1:nrow(mat_pvc)){
  cal <- mat_pvc[i,]
  print(cal)
  cal_max <-max(cal)
  print(cal_max)
}


#apply function
apply(mat_pvc ,1,  max)
apply(mat_pvc , 2, sum)

mat_pvc[5,2] <- NA
mat_pvc


lapply


apply(mat_pvc , 1 , sum)
#gives NA for the column having  NA

#applying additional arguments of the function in apply function 
apply(mat_pvc , 1 , sum , na.rm = T)



apply(mat_pvc , c(1,2) , function(x) x/100 , simplify =  F)


class(apply(mat_pvc , 1 , function(x) x/100 , simplify =  F))
class(apply(mat_pvc , 1 , function(x) x/100 , simplify =  T))




apply(mat_pvc , 1 , function(x) x/100)

help("sum")
?apply


View(iris)
class(iris)


iris_mat <- as.matrix(iris[,-5])
iris_mat
apply(iris_mat[,-5] , 1 , mean)

apply(iris[,-5] , 1, mean)


apply(iris[,-5] , 1, function(x) x/100)





#------------------------lapply <- atomic vectors , lists 
?lapply


color_list <- list(color1 = c(10 ,20 ,30, 40,54), 
                   color2 = c(45,56,42,433, 32),
                   color3 = c(34,45,23,43,43),
                   color4 = c(12, 45,23,23,65)
                   )

color_list

lapply(color_list , max)


?as.data.frame

color_frame <- data.frame(color1 = c(10 ,20 ,30, 40,54), 
                   color2 = c(45,56,42,433, 32),
                   color3 = c(34,45,23,43,43),
                   color4 = c(12, 45,23,23,65)
)

color_frame


class(color_list)

class(color_frame)


lapply(color_list , mean)
lapply(color_frame , mean)  #even on passing  df it get   converted into a list 

apply(color_frame,2,mean)


# for string vectors 
str_vec <- c("Blue" , "Green" , "yellow" , "Red")


lapply(str_vec, toupper)





#---------------------SAPPLY------------------------------

color_frame

?sapply

#SAPPLY <- list , data frame

sapply(color_frame , mean)
color_list


sapply(color_list , mean)
class(sapply(color_list , mean))

#simplify parameter for simplified result format (vector in space of list)
sapply(color_list , mean , simplify =  F)

class(sapply(color_list , mean , simplify =  F))

#named vec
vec1 <- c(first = 2 , second = 8 , third = 9 )
vec1["first"]

sapply(vec1 , function(x)x*power(x,2))



?tapply

test1 <- c(45,35,26 , 46 , 50 , 39 , 38 , 48, 50 , 40)
test2 <- c(35 ,15, 26 , 28 , 29, 45, 37 , 15, 28, 50)

test3 <- c(78,45, 90 , 39 , 89 , 98 ,79 , 98 , 67,87)
stu_section <- c("A", "B","C", "A","A","B", "B" , "A","B" , "A")
tapply(test3 , stu_section , sum)
tapply(test3 , stu_section , mean)


#tapply on dataframe columns  
tapply(iris$Sepal.Length , iris$Species , mean , na.rm =T)
tapply(iris[,3] , iris[,5] , mean , na.rm =T)
View(iris)

class(iris)


?split

stu_id <- 101:110
stu_df <- data.frame(ID <- stu_id,
                     ENG <- test1,
                     MTH <- test2 ,
                     HIST <- test3 , 
                     SEC <- stu_section)
stu_df

tapply(stu_df ,  )


#mapply function
?mapply

x<- 1:10
y <- 11:20
r <- 21:30
z<- 5:10

x
z
mapply(sum , x ,y , z , r)







