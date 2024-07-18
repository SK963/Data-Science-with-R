
#installing ggplot2 library 
install.packages("ggplot2")
#checking installation
installed.packages("ggplot2")


#including in the library
library("ggplot2")





# 7 LAYERS OF GGPLOT

# data :	The dataset being plotted.
# mapping : Aesthetics (aes) :	The scales onto which we map our data. (X , Y)
# Geometries (geom) :	The visual elements used for our data. (geometry type : chart and graph type)
# Facets :	Plotting Small Multiples (plots)
# statistics (stats):	Representations of Our Data to aid understanding
# Coordinates	The space on which the data will be ploted
# Themes	All non - data link

# NOTE : stats and cooridnates layers are not used directly they are hiddin inside the geometry 




#--------------------------------Example ------------------------

# Sample data
set.seed(123)
df <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  z = sample(letters[1:5], 100, replace = TRUE),
  category = factor(sample(1:3, 100, replace = TRUE))
)
View(df)

# Example plot with multiple layers
ggplot(df, aes(x = x, y = y, color = z, shape = category)) +
  
  # Geometry ---------------------
  # Geom_point: Scatterplot
  geom_point(size = 3) +
  
  # Geom_smooth: Smooth line
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "blue") +
  
  # Geom_text: Annotations
  geom_text(aes(label = round(y, 2)), vjust = -0.5, color = "red") +
  
  # Geom_histogram: Histogram
  geom_histogram(data = df, aes(y = ..density..), fill = "green", alpha = 0.5) +
  
  # Geom_vline: Vertical line
  geom_vline(xintercept = mean(df$x), linetype = "dotted", color = "purple") +
  
  # Geom_hline: Horizontal line
  geom_hline(yintercept = mean(df$y), linetype = "dotted", color = "orange") +
  
  # Facet_wrap: Faceting
  facet_wrap(~ category) +
  
  # Scale_color_manual: Custom color scale
  scale_color_manual(values = c("red", "blue", "green", "orange", "purple")) +
  
  # Scale_shape_manual: Custom shape scale
  scale_shape_manual(values = c(0, 1, 2)) +
  
  # Labs: Labels and titles
  labs(title = "Example Plot with Multiple Layers",
       x = "X-axis Label", y = "Y-axis Label", color = "Z Variable",
       shape = "Category Variable") +
  
  # Theme: Custom theme settings
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "bottom")




#------------------------------------------------------------
View(iris)

geom_point()

#scatter plot
ggplot(iris  , aes(x=Sepal.Length , 
       y = Petal.Length ,
       col = Species , Shape = Species))+
  geom_point()


?aes
?labs


#histogram
ggplot(iris, aes(x = Sepal.Length))+
         labs(x = "Sepal" , y = "Frequency")+
         geom_histogram(bins =10 , fill ="red" , col = "black") +
         ggtitle("Histogram")

#box plot
ggplot(iris , aes(x = Species , y = Sepal.Length , fill =Species))+
  geom_boxplot()






#bar plot

ggplot(data = iris  , aes(x = Petal.Length , fill = Species))+
    geom_bar()



#using rgb color
ggplot(data = iris , aes(x = Species)) + geom_bar(col = "blue" , fill = rgb(rgb(9, 14, 197)) , width = 0.5)


#using hexadecimal format for color 
ggplot(data = iris , aes(x = Species)) + geom_bar(col = "blue" , fill ="#080ecd" , width = 0.5)


#Density plot
ggplot(iris , aes(x = Sepal.Length , fill = Species))+ 
  labs(x = "Sepal Length"  , y = "Frequency")+
  geom_density(col = "red" , alpha = 0.6)+
  ggtitle("Density Plot")




#pie chart  - there is no direct implementation of pie but it can achieven with some tweaks

data = as.data.frame(table(iris$Species))

View(data)

ggplot(data , aes(x= "" , y = Freq , fill = Var1))+
  geom_bar(stat = "identity")+
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = "Pie Chart") + 
  coord_polar(theta = "y" , start = 0)




#bubble chart


ggplot(mtcars ,
       aes(x = mpg , y = disp , size = cyl , col = cyl ))+
  geom_point()

View(mtcars)


#Advance graphs and charts
#Donut Chart

data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(20, 30, 25, 15)
)


# Create a function to calculate the positions for text labels
calc_label_pos <- function(x, y, radius) {
  angle <- (cumsum(x) - 0.5 * x) * 2 * pi
  x_pos <- radius * cos(angle)
  y_pos <- radius * sin(angle)
  return(data.frame(x = x_pos, y = y_pos))
}

# Plot the donut chart
ggplot() +
  geom_bar(data = data, aes(x = "", y = value, fill = category), width = 1, stat = "identity") +
  geom_bar(data = data.frame(category = "Total", value = sum(data$value)), aes(x = "", y = value), 
           fill = "white", color = "white", width = 0.5, stat = "identity") +
  coord_polar(theta = "y") +
  theme_void() +
  theme(legend.position = "bottom") +
  scale_fill_brewer(palette = "Set3") +
  geom_text(data = calc_label_pos(data$value, 0, 1), aes(x, y, label = paste0(round(data$value), "%")), size = 3) +
  geom_text(data = data.frame(x = 0, y = 0, label = "Total"), aes(x, y, label = label), size = 4, color = "black")



#heatmap

data <- matrix(rnorm(100), nrow = 10) # Example random data, replace it with your data

# Create row and column names
rownames(data) <- paste0("Row", 1:nrow(data))
colnames(data) <- paste0("Col", 1:ncol(data))

# Convert data to long format for ggplot2
library(reshape2)
data_melted <- melt(data)

# Plot heatmap using ggplot2
ggplot(data_melted, aes(x = Var2, y = Var1, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") + # You can adjust colors as needed
  labs(x = "Columns", y = "Rows", title = "Heatmap") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#heat map
data<-as.matrix(mtcars)
heatmap(data)
heatmap(data,scale="column")
heatmap(data,Colv=NA,Rowv=NA,scale="column")
heatmap(data,Colv=NA,Rowv=NA,scale="column",col=cm.colors(256),xlab="variable",ylab="car")

ds<-data.frame(rnorm(10,5,1),rnorm(10,5,1))
#rnorm create random values
ds
rn=c("A","B","C","D","E")
cn=c("F","G","H","I")
x<-as.matrix(ds)
heatmap(x,labRow = rn,labCol = cn,main="test heatmap")



# Create a sample dataset
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(20, 30, 25, 25)
)

# Create the pie chart
pie_chart <- ggplot(data, aes(x = "", y = value, fill = category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  theme_void() +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Pie Chart Example")

# Display the pie chart
print(pie_chart)



donut_chart <- pie_chart + 
  geom_bar(data = data , aes(x = "" , y = value , ),
           stat = "identity",
           width = 0.5 , fill = "white") + 
  geom_text( data = data , 
             aes(label = ))




#another way
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(20, 30, 25, 25)
)


data$fraction = data$value/ sum(data$value)
data$ymax  = cumsum(data$fraction)
data$ymin = c(0 , head(data$ymax , n = -1))


data

ggplot(data , aes(ymax = ymax  , ymin = ymin , xmax = 4 , xmin = 3 , fill = category)) +
  geom_rect()


ggplot(data , aes(ymax = ymax  , ymin = ymin , xmax = 4 , xmin = 3 , fill = category)) +
  geom_rect() + coord_polar(theta = "y")

ggplot(data , aes(ymax = ymax  , ymin = ymin , xmax = 4 , xmin = 3 , fill = category)) +
  geom_rect() + coord_polar(theta = "y") + xlim(c(2,4))











#using facets , theemes , and  linear models


co2 <- as.data.frame(CO2) 
View(co2)



co2 %>% ggplot( aes(conc , uptake , color = Treatment)) +
  geom_point(size = 3 , alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~Type) +
  labs(title = "CO2 concentration ")+
  theme_bw()




#LABELS AND ANNOTATION IN GGPLOT 

#using LABS

data <- as.data.frame(mtcars)
View(data)
names(data)


mtcars %>% ggplot(aes(x = wt , y = mpg , col = gear))+
  geom_point(size = 3 , alpha = 0.5) + 
  labs(title = "Weight vs Miles per Gallon",
   x = "Weight", y = "Miles per Gallon", color = "Gears") + 
  theme_bw()+  
  theme(plot title = 
          element_text(size = 18, 
                                  face = "bold",
                                  color = "steelblue",
                                  hjust = 0.5)),
          axis.text = element_text(size = 10 , 
                                   color = "grey", 
                                   face = "bold"),
          axis.title = element_text(size = 12 , 
                                    color = "steelblue"))+
  theme(legend.position = c(0.9 , 0.89))+
  annotate("text" , x = 4  , y = 30),
lable = "Notice the differencce \n  between cars with \n three and four gears" ,
color = "black" , face = "bold" , size = 4)+
  geom_segment()












































