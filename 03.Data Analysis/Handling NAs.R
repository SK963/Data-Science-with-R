


#-------------------------HANDLING NAs --------------------------------#
States <- read.csv("Dataset/STATES.csv")

#Removing Nas
St= na.omit(St)
View(St)
#removes the na rows


#filtering NAs rows
is.na(States)   # return true of false for every column of data
View(States[!complete.cases(States),])
View(!complete.cases(States))


#------------------------------------------------------------------------------------------------------------------------#
#Imputing NAs 
#numers with mean , Factors with the most occuring value(LEVEL)

View(States[!complete.cases(States),]);summary(States)



names(States)
nrow(States)


#accessing data from the dataframe 
#accessing row number 

which(States$State == "Tripura")  #return the row num for the 


#handing NAs manually 
#handling goa na value at literacy rate
lt_mean <- mean(States$Literacy.Rate., na.rm = T)
States[which(States$State == "Tripura"), "Literacy.Rate."] = lt_mean

#Goa na at tree cover
tc_mean <- mean(States$Tree.Cover, na.rm = T)
tc_mean
States[which(States$State == "Goa"), "Tree.Cover"] = tc_mean

#mp na at Tree.cover
States[which(States$State == "Madhya Pradesh"), "Tree.Cover"] = tc_mean



#Rajasthan na at sex.ration
sr_mean <- mean(States$Sex.Ratio, na.rm = T)
sr_mean
States[which(States$State == "Rajasthan"), "Sex.Ratio"] = sr_mean



#deleting a column of a dataframe
States <- States[, -which(names(States) == "Sex.Ration")]


View(States[!complete.cases(States),])
View(States)
summary(States)





#imputting na semi - manually 

States <- read.csv("Dataset/STATES.csv")
View(States[!complete.cases(States),])

names(which(sapply (States,anyNA)))

States$Literacy.Rate.[is.na(States$Literacy.Rate.)] = mean(States$Literacy.Rate., na.rm = T)

States$Tree.Cover[is.na(States$Tree.Cover)] = mean(States$Tree.Cover, na.rm = T)

States$Sex.Ratio[is.na(States$Sex.Ratio)] = mean(States$Sex.Ratio, na.rm = T)

View(States[!complete.cases(States),])
States$Tree.Cover[is.na(States$Tree.Cover)] = mean(States$Tree.Cover, na.rm = T)View(States)
summary(States)



#----------------------------------------------------------------------------------------#
#using loops for handling NAs
for(i in 1:ncol(States)){
  States.is.na(States[,i] , i = round(mean(States[,i]), na.rm = T))
}
