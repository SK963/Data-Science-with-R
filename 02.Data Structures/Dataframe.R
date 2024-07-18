#Datframes


#------------------------------Creatging Dataframes ------------------------------


sn = 1:6
Age =  c(21,22,23,24,25,26)
Name = c("Joh" , "wick", "Rick" , "Morty" , "Walter" ,"Wade")



dat2 <- data.frame(SN = sn , 
                   Age = Age,
                   Name = Name)


dat <- data.frame("SN" = 1:6,
                  "Age" = c(21,22,23,24,25,26),
                  "Name" = c("Joh" , "wick", "Rick" , "Morty" , "Walter" ,"Wade"))

# the space in the "S No" is converted into  "S.No" 
#use of double quotes is essential for assigning space separated column names  

#use of double quotes is not mandatory for the columnnames which are not space separted 

#the names of the column should be in double quotes if there is any other characters  which are not 
#valid for variable name declaration they will be interpreted as "." by the interpreter 

#even if there is space is in the column  name it will be interpreted as "." but on exporting it on a
#CSV it will be saved as a " "

help("data.frame")

dat

dat2



#-------------------------subsetting (accessing data from a dataframe)--------

#accessing a row
#single row
dat[1,]
class(dat[1,])
#multiple rows
dat[c(1,3),]
class(dat[c(1,3)])

#accessing a column
#using column_numbers
#single column
dat[,2]
class(dat[,1])
#multiple columns
dat[,c(1,3)]
class(dat[,c(1,3)])

#using coulumn_names
#single column
dat$Name
#multiple columns




dat

#accessing single item
#using row and column numbers
dat[1,3]
#using columnames
dat$Name[3]


# SUBSETTING IN R #

View(mtcars)
head(mtcars)
tail(mtcars)
str(mtcars)
summary(mtcars)
nrow(mtcars)
ncol(mtcars)
length(mtcars)


# ** SUBSETTING DATA FROM DATASET NAME ONLY USING SQUARE BRACKETS ** #

# SUBSETTING AND VIEWING DATA THROUGH COLUMN NUMBER
#SYNTAX: Datasetname[Rownumber or 'Rowname' , Columnnumber or 'Columnname']
mtcars
mtcars[]
mtcars[,]
mtcars[,1,drop=F]
mtcars[c(1,2)]
mtcars[,1]+mtcars[,2]
mtcars[1]+mtcars[2]
mtcars[1]
mtcars[c(1,3,4)]
mtcars[,c(1,3,4)]
mtcars[2,c(1,3,4)]
# SUBSETTING AND VIEWING DATA THROUGH COLUMN NAMES AND ROW NAMES
mtcars$mpg
mtcars['am']
mtcars[,'mpg']
mtcars[,c('am','mpg')]
mtcars['Volvo 142E',]
mtcars[c('Volvo 142E','Maserati Bora'),]
# SUBSETTING AND VIEWING DATA USING CONDITIONS
#dplyr
library(dplyr)
mtcars%>% filter(am==0)%>% View
#sqldf
library(sqldf)
View(sqldf("select * from mtcars where am==0"))

View(mtcars[mtcars$am==0,])
mtcars[which(mtcars$gear>4),]
mtcars[which(mtcars$am==0),'hp']
mtcars[which(mtcars$vs==0 & mtcars$cyl>4),]
mtcars[which(mtcars$vs==0 & mtcars$cyl>4),c('hp','gear')]


# **** SUBSETTING DATA FROM SUBSET FUNCTION ONLY ** #

#SYNTAX: subset(Datasetname,Condition(selection of Data),Columns(Projection of Data))


subset(mtcars)
subset(mtcars,)

# Selection (Selection would always be logical)
View(subset(mtcars,am==0))
subset(mtcars,gear>3)
subset(mtcars,cyl>4)
subset(mtcars,row.names(mtcars) %in%
         c('Mazda RX4','Merc 450SL'))



# Projection
View(subset(mtcars,select=c(mpg,hp)))
subset(mtcars,select=am)
subset(mtcars,select=3)
subset(mtcars,select=c(1,3,4))
subset(mtcars,select=c(1))+subset(mtcars,select=c(2))

# Selection and Projection
subset(mtcars,am==0,select=hp)
subset(mtcars,vs==0 & cyl>4,select=c(hp,gear))




#-----------------------------------Adding columns------------------------
#using cblind
dat <- cbind(dat , "Country" = c("India"));

#----------------------------------Adding rows--------------------------
dat <- rbind(dat , c(7 , 151,  "Darth Vader" ,"India"))
dat






#Some importnat function for dataframes


#Viewing data frame

#View <-  opens a new tab of datframe in proper tabular form allowing sorting , filtering etc
View(df)


#head <- print the first 6 or desired number of rows
?head
head(df)


#tail <- prints the last 6 or desired number of rows
tail(df)


#----------------Info of Dataframe--------------------

#dime <- dimensions (rows and columns )
dim(df)
 
#nrow  <- number of rows 
nrow(df)




#ncol  <- number of columns 
ncol(df)

#or length of columns
length(df)


#names <- column names 
names(df)

#colnames
colnames(df)

#rownmaes
rownames(df)





#------------------------------------Summarizing Dataframes --------------

#summary <- shows 
>summary
summary(df)
#summary of a dataframe
#Shows 5 quatr values for numeric
#length , class and mode for string or character
#factor as : data with value
#for logical values mode: logical ,  value count for each .



#str
?str
str(df)


#quantile  <- show 5 quantiles of a numeric vector
?quantile
quantile(df$Alice)

#column name (names), class , row.names 
attributes(df)







#table <- frequency distribution for categoriacla data 
?table
table(df$Alice)
table(df$Alice , df$Bob)
table(df$Alice , df$Bob , df$Carl)


#is.na  <- returns a boolean dataframe/vecotor for the na status for each data
is.na(df)
is.na(df$Alice)

#total number of NAs in a Column 
sum(is.na(df$Alice))


#checking wheher there is any NAs or not in the column
any(is.na(df$Alice))



#checking some condition for a column of data


all(df$Alice < 29)  #all the values of the column are less than the specified value
all(df$Alice > 29) #all the values of the column are greater than the specified value



#Row and column sums

colSums(is.na(df))

df$Alice %in% c(30.20)
table(df$Alice %in% c(30.20))

df$Alice %in% c(36.25 , 30.20)
table(df$Alice %in% c(36.25 , 30.20))


# subseting
df$Alice %in% c(36.25 , 30.20)

df[df$Alice %in% c(36.25 , 30.20) , ]

data("UCBAdmissions")
View(UCBAdmissions)
class(UCBAdmissions)

ucb <- as.data.frame(UCBAdmissions)
class(ucb)
View(ucb)


ucb_t <- table(ucb)
class(ucb_t)
View(ucb_t)


#tables and xtabs

# Sample data
students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Emma"),
  Color = c("Red", "Blue", "Green", "Red", "Blue"),
  Gender = c("Female", "Male", "Male", "Male", "Female"),
  Age = c(25, 30, 20, 28, 22)
)

table(students$Color)
table(students$Color , students$Gender)
table(students$Gender , students$Color)
table(students$Gender , students$Color , students$Age)



?xtabs
xtabs(~ Gender + Color, data = students)
xtabs(~ Gender + Color + Age, data = students)





xtabs(~ Gender + Admit , data = ucb)

xtabs(Freq ~ Gender + Admit , data = ucb)

#flattables

?warpbreaks
View(warpbreaks)

warpbreaks$replicate <- rep(1.9, len = 54)

xt = xtabs(breaks ~. , data=warpbreaks)
xt

?ftable
ftable(xt)




#checking dataset sizes

object.size(df)
#converting into proper units
print(object.size(df ),  units = "Mb")





#Some importnat function for dataframes

df <- read.csv("pvc.csv")
df






#table <- frequency distribution for categoriacla data 
?table
table(df$Alice)
table(df$Alice , df$Bob)
table(df$Alice , df$Bob , df$Carl)


#is.na  <- returns a boolean dataframe/vecotor for the na status for each data
is.na(df)
is.na(df$Alice)

#total number of NAs in a Column 
sum(is.na(df$Alice))


#checking wheher there is any NAs or not in the column
any(is.na(df$Alice))



#checking some condition for a column of data


all(df$Alice < 29)  #all the values of the column are less than the specified value
all(df$Alice > 29) #all the values of the column are greater than the specified value



#Row and column sums

colSums(is.na(df))

df$Alice %in% c(30.20)
table(df$Alice %in% c(30.20))

df$Alice %in% c(36.25 , 30.20)
table(df$Alice %in% c(36.25 , 30.20))


# subseting
df$Alice %in% c(36.25 , 30.20)

df[df$Alice %in% c(36.25 , 30.20) , ]

data("UCBAdmissions")
View(UCBAdmissions)
class(UCBAdmissions)

ucb <- as.data.frame(UCBAdmissions)
class(ucb)
View(ucb)


ucb_t <- table(ucb)
class(ucb_t)
View(ucb_t)


#tables and xtabs

# Sample data
students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Emma"),
  Color = c("Red", "Blue", "Green", "Red", "Blue"),
  Gender = c("Female", "Male", "Male", "Male", "Female"),
  Age = c(25, 30, 20, 28, 22)
)

table(students$Color)
table(students$Color , students$Gender)
table(students$Gender , students$Color)
table(students$Gender , students$Color , students$Age)



?xtabs
xtabs(~ Gender + Color, data = students)
xtabs(~ Gender + Color + Age, data = students)





xtabs(~ Gender + Admit , data = ucb)

xtabs(Freq ~ Gender + Admit , data = ucb)

#flattables

?warpbreaks
View(warpbreaks)

warpbreaks$replicate <- rep(1.9, len = 54)

xt = xtabs(breaks ~. , data=warpbreaks)
xt

?ftable
ftable(xt)




#checking dataset sizes

object.size(df)
#converting into proper units
print(object.size(df ),  units = "Mb")



#-------------------------------Merging Dataframes-----------------------------------
#------------------using merge function -----------------



# Sample dataframes
df1 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"), Score = c(90, 85, 88))
df2 <- data.frame(ID = c(1, 3, 4), Age = c(25, 30, 27))

df1
df2



# Inner join
inner_join <- merge(df1, df2, by = "ID", all = FALSE)
inner_join


# Left join
left_join <- merge(df1, df2, by = "ID", all.x = TRUE)
left_join

# Right join
right_join <- merge(df1, df2, by = "ID", all.y = TRUE)
right_join

# Full outer join
full_join <- merge(df1, df2, by = "ID", all = TRUE)
full_join



# Sample dataframes with duplicate column names
df1 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"), Score = c(90, 85, 88))
df2 <- data.frame(ID = c(1, 3, 4), Score = c(95, 92, 87))


# Merge with suffixes for duplicated columns
merge_suffix <- merge(df1, df2, by = "ID")
print(merge_suffix)
merge_suffix <- merge(df1, df2, by = "ID", suffixes = c("_df1", "_df2"))
print("Merge with Suffixes for Duplicated Columns:")
print(merge_suffix)



#---------------------2.using dplyr--------------------------



#---------------------------melting and casting operations -------------------
install.packages("reshape2")
library(reshape2)


# Sample dataframe in wide format
wide_data <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Alice", "Bob", "Charlie"),
  Score_Midterm = c(90, 85, 88),
  Score_Final = c(95, 88, 92)
)
wide_data
#ordering a dataframe
wide_data[order(wide_data$Score_Midterm),]

# Melt dataframe
long_data <- melt(wide_data, id.vars = c("ID", "Name"), measure.vars = c("Score_Midterm", "Score_Final"))
long_data


rlong_data <- data.frame(
  ID = rep(c(1, 2, 3), each = 2),
  Name = rep(c("Alice", "Bob", "Charlie"), each = 2),
  Variable = rep(c("Score_Midterm", "Score_Final"), 3),
  Value = c(90, 95, 85, 88, 88, 92)
)
rlong_data

# Cast dataframe
wide_dat <- dcast(rlong_data, ID + Name ~ Variable, value.var = "Value")
wide_dat














