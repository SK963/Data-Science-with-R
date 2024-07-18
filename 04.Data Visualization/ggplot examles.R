library(ggplot2)



# data 
library(tidyverse)

# Sample data
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(20, 30, 15, 35)
)
data

?gather

#data melting
data_long <- data %>%
  mutate(percent = value / sum(value) * 100) %>%
  gather(key = "variable", value = "value", -category)

data_long




# Pie Chart

ggplot(data_long, aes(x = "", y = value, fill = category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Pie Chart", fill = "Category", y = NULL) +
  geom_text(aes(label = paste0(round(percent), "%")), position = position_stack(vjust = 0.5)) +
  theme_void()







# Sample data
set.seed(123)
df <- data.frame(
  x = rep(1:5, each = 20),
  y = rnorm(100),
  group = rep(LETTERS[1:5], each = 20),
  category = factor(rep(1:2, each = 50))
)

View(df)
summary(df)

# Example plot using each geom

# Geom_point: Scatterplot
ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  labs(title = "geom_point: Scatterplot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group) 
 


# Geom_line: Line plot
ggplot(df, aes(x = x, y = y)) +
  geom_line() +
  labs(title = "geom_line: Line Plot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group)
  



# Geom_bar: Bar plot
ggplot(df, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  labs(title = "geom_bar: Bar Plot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group)
 

  
# Geom_boxplot: Box plot
ggplot(df, aes(x = category, y = y)) +
  geom_boxplot() +
  labs(title = "geom_boxplot: Box Plot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group)
 
  
# Geom_histogram: Histogram
ggplot(df, aes(x = y)) +
  geom_histogram() +
  labs(title = "geom_histogram: Histogram") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group)
  

# Geom_density: Density plot
ggplot(df, aes(x = x, y = y)) +
  geom_density() +
  labs(title = "geom_density: Density Plot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group)
  
  
# Geom_area: Area plot
ggplot(df, aes(x = x, y = y)) +
  geom_area() +
  labs(title = "geom_area: Area Plot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group)
  
  
# Geom_tile: Tile plot
ggplot(df, aes(x = x, y = y)) +
  geom_tile(aes(fill = category)) +
  labs(title = "geom_tile: Tile Plot") +
  theme(plot.title = element_text(hjust = 0.5))

  
# Geom_polygon: Polygon plot
ggplot(df, aes(x = x, y = y)) +
  geom_polygon(aes(group = group)) +
  labs(title = "geom_polygon: Polygon Plot") +
  theme(plot.title = element_text(hjust = 0.5))


  
# Geom_text: Text plot
ggplot(df, aes(x = x, y = y, label = group)) +
  geom_text() +
  labs(title = "geom_text: Text Plot") +
  theme(plot.title = element_text(hjust = 0.5))


  
# Geom_label: Label plot
ggplot(df, aes(x = x, y = y, label = group)) +
  geom_label() +
  labs(title = "geom_label: Label Plot") +
  theme(plot.title = element_text(hjust = 0.5))
  

  
# Geom_smooth: Smooth plot
ggplot(df, aes(x = x, y = y)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "geom_smooth: Smooth Plot") +
  theme(plot.title = element_text(hjust = 0.5))
  facet_wrap(~ group) +
 
  
# Geom_errorbar: Error bar plot
ggplot(df, aes(x = x, y = y)) +
  geom_errorbar() +
  labs(title = "geom_errorbar: Error Bar Plot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ group) 


# Geom_vline: Vertical line plot
ggplot(df, aes(x = x, y = y)) +
  geom_vline(xintercept = 3, linetype = "dashed") +
  labs(title = "geom_vline: Vertical Line Plot") +
  theme(plot.title = element_text(hjust = 0.5))
 

 # Geom_hline: Horizontal line plot
ggplot(df, aes(x = x, y = y)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(title = "geom_hline: Horizontal Line Plot") +
  theme(plot.title = element_text(hjust = 0.5))





##ussing ggscave function to save the visualization in png format
ggplot(df, aes(x = x, y = y)) +
  
  # Geom_hline: Horizontal line plot
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(title = "geom_hline: Horizontal Line Plot") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ggsave("geom_hline.png", width = 5, height = 4)













