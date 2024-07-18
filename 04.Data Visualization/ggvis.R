install.packages("ggvis")
library(tidyr)
library(dplyr)
library(ggvis)
library(shiny)

# Create a data frame
data <- data.frame(
  x = rnorm(100),
  y = rnorm(100)
)

# Create an interactive scatter plot
data %>%
  ggvis(~x, ~y) %>%
  layer_points() %>%
  bind_shiny("plot")




# Load the mpg dataset
data(mpg)

# Create an interactive scatter plot with tooltips
mpg %>%
  ggvis(x = ~displ, y = ~hwy, fill := "blue") %>%
  layer_points() %>%
  add_tooltip(function(df) {
    paste0("Manufacturer: ", df$manufacturer, "<br>",
           "Model: ", df$model, "<br>",
           "Displacement: ", df$displ, "<br>",
           "Highway MPG: ", df$hwy)
  }, "hover") %>%
  bind_shiny("mpg_plot")

#------------------------------
library(shiny)
library(ggvis)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Interactive Scatter Plot with Tooltips"),
  
  # Output: ggvis plot
  ggvisOutput("mpg_plot")
)

# Define server logic
server <- function(input, output) {
  
  # Render ggvis plot
  output$mpg_plot <- renderGgvis({
    
    # Create ggvis plot
    mpg %>%
      ggvis(x = ~displ, y = ~hwy, fill := "blue") %>%
      layer_points() %>%
      add_tooltip(function(df) {
        paste0("Manufacturer: ", df$manufacturer, "<br>",
               "Model: ", df$model, "<br>",
               "Displacement: ", df$displ, "<br>",
               "Highway MPG: ", df$hwy)
      }, "hover")
  })
}

shinyApp(ui = ui, server = server)

