#Plots 

#devices 
options("device")

#parameters 
par(no.readonly = TRUE) #or
par()
?par


# Histograms

?hist
x <- rnorm(100)
x
hist(x)

library(datasets)
hist(airquality$Ozone) ## Draw a new plot



#Scatter plots
?plot

# Example 01
x <- 1:10
y <- x^2

# Plot the data as a scatter plot
plot(x,y)
plot(x, y, main="Scatter Plot Example", xlab="X-axis label", ylab="Y-axis label", col="blue", pch=16 , sub ="graph of a squares")


View(mtcars)
#Example 02 : mtcar weight to millage
input <- mtcars[,c('wt','mpg')]

plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)


#Scatterplot matrix
?pairs

pairs(~wt+mpg+disp+cyl,data = mtcars,
      main = "Scatterplot Matrix")



#Line plot 

# Create some sample data
x <- 1:10
y <- x^2

# Plot the data as a line plot
?plot

#Example 01
plot(x,y)
plot(x, y, type="l", main="Line Plot Example", xlab="X-axis label", ylab="Y-axis label", col="red")

#Example 02
v <- c(7,12,28,3,41)
t <- c(14,7,6,19,3)
plot(v,type = "o")
plot(v,type = "o", col = "red", xlab = "Month", ylab = "Rain fall",
     main = "Rain fall chart")

#multiple line in a Line chart
?line
lines(t, type = "o", col = "blue")



# Bar chart / plot 
?barplot













#Boxplot
?transform
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")




?points
example(points)

#parameters  
?title
title("Scatterplot")
?text
text(-2 , -2 , "Label")
?legend
legend("topleft" , legend = "Data" , pch = 60)


fit <- lm(y~x)
fit

?abline
abline(fit)

abline(fit , lwd = 3)

abline(fit , lwd = 3 , col ="red")








# list of parameters 
par()


#pch
par("pch")
par(pch = 3)
plot(x,y)

example("points")


#mfrow and mfcol
par("mfrow")  
par("mfcol")







#base plotting system

#graphics (Base library for plotting graphs)
?graphics
library(help = "graphics")
# grDevices(The R Graphics Devices and Support for Colours and Fonts)
#(Graphics devices and support for base and grid graphics)
?grDevices
library(help = "grDevices")



data <- read.csv("Dataset/pollution.csv")
View(data)




#boxplot
?boxplot
boxplot(data$Mean , col = "blue")
airquality <- transform(airquality , Month = factor(Month))
boxplot(Ozone ~ Month , airquality , xlab = "Month" , ylab  = "Ozone (ppb)")


#plotting a line 
?abline

abline(h = 10)




#histogram
?hist
hist(data$Mean , col = "green")
abline(v = mean(data$Mean) , lwd =2)

hist(airquality$Ozone)


#rug
?rug
rug(data$Mean)



# barplot
?barplot



# plot function -> for simple scatter plots 
?plot
?with
with(cars, plot(speed, dist))



#parameters for the base graphics
?par


# Example with different point symbols
x <- 1:5
y <- c(3, 5, 4, 6, 2)
plot(x, y, pch = 16) # solid circles

# Example with different colors
plot(x, y, col = "red") # red points

# Example with different line types
plot(x, y, type = "b", lty = 2) # dashed lines

# Example with different line widths
plot(x, y, type = "b", lwd = 2) # thicker lines


# Example with different magnification factors
plot(x, y, cex = 2) # larger symbols


# Example with different font styles
plot(x, y, font = 2) # bold text


#giving tittle / annotation

with(airquality, plot (Wind, Ozone))
title (main = "Ozone and Wind in New York City")
#without using title function 
with(airquality, plot(Wind, Ozone, main= "Ozone and Wind in New York City"))


with(subset(airquality, Month == 5), points(Wind, Ozone , col = "blue" ))






# Graphics Devices
?Devices


pdf(file = "myplot.pdf")
## Open PDF device; create 'myplot.pdf' in my working directory
#Create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.off()
## Close the PDF file device
#Now you can view the file 'myplot.pdf'
#Annotate plot; still nothing on screen on your computer


