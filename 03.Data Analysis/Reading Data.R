# Reading Inbuilt datasets



data()
# List just the names of built-in datasets


data(package = .packages(all.available = TRUE))
# list the data sets in all *available* packages.


#including a dataset in environment
data("mtcars")
class(mtcars)



#converting the dataset as a datafram
data <- as.data.frame(mtcars)
View(data)






#------------------------------------Dowloading And Handling files and Directory ------------------------------------------#
fileUrl <- "https://www.kaggle.com/datasets/willianoliveiragibin/telecom-stats/download?datasetVersionNumber=1"
download.file(fileUrl , destfile = "")


#getting the date of the downlodaded file
dateDownloaded <- date()
dateDownloaded

#get the working directory
getwd()
#set working directory
setwd("path to file with proper excape sequence formatting")


#--------------------READING FLAT FILES : TXT , CSV etc-------------------------------------------------#

#read.table function 
help("read.table")

#read.table fucntion

states = read.table("Dataset/STATES.csv" , sep = "," , header = T)
head(states)

#read.csv fucntion
States <- read.csv("Dataset/STATES.csv")

#creating a file path usinng file.path function
help("file.path")
path <- file.path("Dataset" , "STATES.csv")
path

St <- read.csv(path)
head(St)
View(St)



#Writing to FLAT FILES 


# another way of choosing file by  file.choose method
States = read.csv(file.choose() , sep = ',' , header = T)

head(States)
View(States)
str(States)
summary(States)


#_------------------------Reading excel files---------------------------------------------------------------------#

install.packages("readxl")
library("readxl")


# Display all the sheet names in an excel sheet
excel_sheets("Dataset/EXCEL CA1.xlsx")


# Read data from the sheets using read_excel
# using sheet count
G1 <- read_excel("Dataset/EXCEL CA1.xlsx", sheet = 1,  col_names = TRUE)
head(G1)
View(G1)

# using sheet name
G2 <- read_excel("Dataset/EXCEL CA1.xlsx", sheet = "G2" , col_names =  TRUE)
head(G2)
View(G2)


#using file.choose method
#BY default read_excel reads the first sheet 
G2 <- read_excel(file.choose() , sheet = "G2" , col_names = TRUE)


sum(df['Power'],na.rm = T)

str(G1)
summary(G1)





# If you had multiple sheets that you wanted to import into a list, you could do this with lapply()

entire_workbook <- lapply(excel_sheets("Dataset/EXCEL CA1.xlsx"), 
                          read_excel, 
                          path = "Dataset/EXCEL CA1.xlsx")
View(entire_workbook)






# Writing to excel files

df <- data.frame(matrix(1:50))
write.xlsx(df, "C:\\Users\\avijeet\\Desktop\\R tutorial demo files\\Data files\\output.xlsx")


#OTHER LIBRARIES FOR READING AND WRITING EXCEL FILES

install.packages("xlsx")  # revise it 
library(xlsx)

install.packages("xlsx")
library("xlsx")
#syntax
#read.xlsx(file, sheetIndex, header=TRUE, colClasses=NA)
#read.xlsx2(file, sheetIndex, header=TRUE, colClasses="character")
#file : the path to the file to read
#sheetIndex : a number indicating the index of the sheet to read; e.g : use sheetIndex=1 to read the first sheet
#header : a logical value. If TRUE, the first row is used as the names of the variables
#colClasses : a character vector that represents the class of each column

file <- system.file("tests", "test_import.xlsx", package = "xlsx")
res <- read.xlsx(file, 1) # read first sheet
head(res[, 1:6])
View(res)

my_data <- read.xlsx(file.choose(),1) # read first sheet
View(my_data)









#-----------------------------------Reading from web xml-----------------------------------------------------------# 
install.packages("XML")
library(XML)
fileUrl <- "https://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl , useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

xmlSApply(rootNode, xmlValue)

#-----------------------------------------READING DATA FROM DATABASES (SQL) ------------------------------------#



#----------------------------------Reading JSON  (No-SQL DATABASES ) ------------------------------------------#
install.packages("jsonlite")
library(jsonlite)

url <- "https://api.github.com/users/jtleek/repos"
json_data <- fromJSON(url)
names(json_data)

names(json_data$owner)
json_data$owner$login


View(iris)
class(iris)
typeof(iris)

#turning dataframe into json format
iris_json <- toJSON(iris , pretty = TRUE)
cat(iris_json)

class(iris_json)

typeof(iris_json)


# converting back to data frame
df_iris <- fromJSON(iris_json)
head(df_iris)
class(df_iris)
typeof(df_iris)


#---------------------------------------------READING DATA FROM SAS APPLICATIONS ----------------------------------------#

# Reading a sas file
install.packages('sas7bdat')
library(sas7bdat)
movies<-read.sas7bdat("C:\\Users\\avijeet\\Desktop\\R tutorial demo files\\Data files\\movies.sas7bdat")
str(movies)
View(movies)


