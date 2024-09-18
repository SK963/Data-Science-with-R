
# installing a package
install.packages('IRkernel')
install.packages('Rtools')




# getting the path of packages
.libPaths()
# [1] "C:/Users/Shubham Kumar/AppData/Local/R/win-library/4.3"
# [2] "C:/Program Files/R/R-4.3.2/library"


# packages locations and  Available R packages 
library()
# Packages in library ‘C:/Program Files/R/R-3.2.2/library’:  // recent result
#‘C:/Users/user/AppData/Local/R/win-library/4.3’  //earlier result

# gettting all the packages location , versions and other details
installed.packages()

installed_pkgs <- installed.packages()[, "Package"]
installed_pkgs



# currently loaded packages in R environmnet 
search()


# [1] ".GlobalEnv"        "tools:rstudio"     "package:stats"     "package:graphics"  "package:grDevices"
# [6] "package:utils"     "package:datasets"  "package:methods"   "Autoloads"         "package:base"

# loading a package 
library(dplyr)
require(tidyr)

#------------------------------------ Inspecting a Package ----------------------------------

# 1. List All Functions in a Package
# Method 1: ls() for Loaded Packages
library(tseries)
ls("package:tseries")

library(forecast)
ls("package:forecast")

# using package_name:: also list the functions and object as list using 
# forecast::


# Method 2: lsf.str() for Function Names
funcs = lsf.str("package:forecast")
class(funcs)
typeof(funcs)

funcs


# Method 3: help(package = "package_name")
help_forecast = help(package = "forecast")
typeof(help_forecast)
class(help_forecast)
help_forecast

# 2. Get a Summary of Functions and Objects Using library(help = "package_name")
# Detailed help for the tseries package
library(help = "tseries")

# 3. Exploring Data Members in a Package
# List datasets in a package, for example in the tseries package
data(package = "tseries")

# Load a dataset in the tseries package
# data(bev) # gives error

data(bev, package = "tseries")
typeof(bev)
class(bev)
View(bev)
bev
summary(bev)


# 4. Search for Specific Functions or Keywords Using help.search()

# Search for functions related to ARIMA models in the tseries package
help.search("Arima")
help.search("adf.test")

# 5. Access Documentation and Examples for a Specific Function
# Access documentation for the adf.test() function in the tseries package
?adf.test
# or 
help(adf.test)

?Arima
help("Arima")


# 6. Access Vignettes (Package Guides)
?vignette

# List all vignettes in a package
vignette(package = "forecast")



# Open a vignette by name
vignette("JSS2008")



# 7. Exploring Namespace: getNamespaceExports()
# List all exported functions in the tseries package
getNamespaceExports("tseries")
ls("package:tseries")


# 8. Access Hidden Functions and Objects
# Access a non-exported function (replace 'function_name' with the actual name)
getFromNamespace("non_exported_function_name", "tseries")


# 9. Using pryr to Explore Package Structure
# Install and load the pryr package
install.packages("pryr")
library(pryr)

# List all functions and objects in the tseries package
pryr::lsf_env("package:tseries")


# 10. Exploring function & object Structure with str()
# Check the structure of a dataset in the package
library(dplyr)
?str
# data
str(EuStockMarkets)
# function
str(arima)
str(forecast)
str(adf.test)
