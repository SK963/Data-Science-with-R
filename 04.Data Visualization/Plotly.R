install.packages("plotly")
library(plotly)

# Method 1: Using plot_ly() function
plot_ly(x = ~x_data, y = ~y_data, type = "scatter", mode = "markers")

# Method 2: Using add_trace() function with plot_ly()

?plot_ly

plot_ly() %>%
  add_trace(x = ~x_data, y = ~y_data, type = "scatter", mode = "markers")

#SCatter plot 
# Method 1: Using plot_ly() function
plot_ly(data = iris, x = ~Sepal.Length, y = ~Sepal.Width, type = "scatter", mode = "markers")

# Method 2: Using add_trace() function with plot_ly()
plot_ly(data = iris) %>%
  add_trace(x = ~Sepal.Length, y = ~Sepal.Width, type = "scatter", mode = "markers")


#---------------------------------------------------------
#Basic scatterplot
library(plotly)

fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)

fig
#styled scatterplot

fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
               marker = list(size = 10,
                             color = 'rgba(255, 182, 193, .9)',
                             line = list(color = 'rgba(152, 0, 0, .8)',
                                         width = 2)))
fig <- fig %>% layout(title = 'Styled Scatter')

fig


#adding color and symbols to data
fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, type = 'scatter',
               mode = 'markers', symbol = ~Species, symbols = c('circle','x','o'),
               color = I('black'), marker = list(size = 10))

fig

#Hand on 3
#Using dataset diamonds and displaying color, size using column values of carat

View(diamonds)
d <- diamonds[sample(nrow(diamonds), 1000), ]
View(d)
fig <- plot_ly(
  d, x = ~carat, y = ~price,
  color = ~carat, size = ~carat
)

fig

#hands on 3
#using toothgrowth data set show the relationship between toothlength and dose.