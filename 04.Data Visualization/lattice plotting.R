# Install the lattice package (if not already installed)
install.packages("lattice")

# Load the lattice package
library(lattice)



# Create a scatter plot using xyplot
xyplot(Sepal.Length ~ Sepal.Width | Species, data = iris, main = "Scatter Plot of Sepal Length vs. Sepal Width")
