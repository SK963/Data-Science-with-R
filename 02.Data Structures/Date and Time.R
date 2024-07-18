

#-------------------------------Date class in R--------------------
#as.Date function <- create date class object 

?as.Date
#Syntax 
as.Date(x, format, tryFormats = c("%Y-%m-%d", "%Y/%m/%d"),
        optional = FALSE, ...)


# Valid formats for as.Date input 

as.Date("2024-05-01")
as.Date("2024/05/01")
as.Date("2024-05-01 12:30:45")

#unvalid formats 
as.Date("01-May-2024")
as.Date("2024.05.01")
as.Date("05-01-2024")
as.Date("2024 05 01")
as.Date("20240501")

class(as.Date("2024-05-01"))

#including other types of format wiht format option
as.Date("01-May-2024", format = "%d-%b-%Y")
as.Date("2024.05.01", format = "%Y.%m.%d")
as.Date("05-01-2024", format = "%m-%d-%Y")
as.Date("2024 05 01", format = "%Y %m %d")
as.Date("20240501", format = "%Y%m%d")



#Sys.Date -> todays date 
Sys.Date()
class(Sys.Date())

# weekdays function  returns day 
weekdays(as.Date("2024-05-01"))

#months 
months(as.Date("2024-05-01"))

#quaters  <- returns quaters 1-4
quarters(as.Date("2024-05-01"))

# julian <- Converts dates to Julian Day Numbers.
julian(as.Date("2024-05-01"))

#format function <- converts the date object into a string object of specified format
?format.Date
format(Sys.Date(), "%Y-%m-%d")
class(format(Sys.Date(), "%Y-%m-%d"))

format(Sys.Date(), "%y-%b-%d")




#importand date and time  Format specifier

format(current_datetime, "%a")  # Abbreviated weekday name
format(current_datetime, "%A")  # Full weekday name
  

format(current_datetime, "%U")   # Week of the year (Sunday as first day)
format(current_datetime, "%W")   # Week of the year (Monday as first day)
format(current_datetime, "%j")   # Day of the year
  
format(current_datetime, "%w")   # Weekday as a decimal number (0-6, Sunday is 0)
format(current_datetime, "%d")   # Day of the month
format(current_datetime, "%x")   # Date representation
format(current_datetime, "%y")   # Year without century
format(current_datetime, "%Y")   # Year with century
  
  
  
format(current_datetime, "%b")   # Abbreviated month name
format(current_datetime, "%B")   # Full month name
format(current_datetime, "%c")   # Date and time representation
  
format(current_datetime, "%H")   # Hour (24-hour clock)
format(current_datetime, "%I")   # Hour (12-hour clock)
  
format(current_datetime, "%m")   # Month
format(current_datetime, "%M")   # Minute
format(current_datetime, "%S")   # Second
format(current_datetime, "%p")   # AM/PM indicator
  
format(current_datetime, "%X")   # Time representation
  
format(current_datetime, "%z")   # Time zone offset from UTC
format(current_datetime, "%Z")    # Time zone abbreviation






# Current system date
current_date <- Sys.Date()
print(current_date)  
# Output: "2024-05-01"

# Current system date and time
current_time <- Sys.time()
print(current_time)  
# Output: Current system date and time

# System time zone
system_timezone <- Sys.timezone()
print(system_timezone)  
# Output: Asia/Calcutt

# Locale settings for time-related information
locale_info <- Sys.getlocale("LC_TIME")
print(locale_info)  
# Output: Locale settings for time-related information

# Information about the system's time zone location
timezone_info <- Sys.timezone(location = TRUE)
print(timezone_info)  
# Output: Information about the system's time zone location



# Date Arithmetic operations



# Create Date objects
date1 <- as.Date("2022-03-15")
date2 <- as.Date("2022-04-20")



date_diff <- date2 - date1
print(date_diff)  
# Output: Time difference of 36 days
class(date_diff)  
# Output : "difftime"


# Extract components using format 
# year , month and day
year <- format(date1, "%Y")
year
class(year)
year <- as.integer(year)
year
class(year)

month <- format(date1, "%m")
month <- as.integer(month)
month

day <- format(date1, "%d")
day <- as.integer(day)
day


print(paste("Year:", year, "Month:", month, "Day:", day))  # Output: Year: 2022 Month: 03 Day: 15


formatted_date <- format(date1, "%A, %B %d, %Y")
print(formatted_date)  
# Output: "Tuesday, March 15, 2022"




#--------------------------------POSIXct class ----------------------------
as.POSIXct("2024-05-01 12:30:45")

class(as.POSIXct("2024-05-01 12:30:45"))

?format.POSIXct()
format(as.POSIXct("2024-05-01 12:30:45"), "%Y-%m-%d %H:%M:%S")
format(as.POSIXct("2024.05.01 12.30.45") , "%y.%b.%d %H.%M.%S")


print(as.POSIXct("2024-05-01 12:30:45"))
summary(as.POSIXct("2024-05-01 12:30:45"))
round(as.POSIXct("2024-05-01 12:30:45"), units = "hours")
trunc(as.POSIXct("2024-05-01 12:30:45"), units = "days")




# Current system date and time as POSIXlt
current_datetime_lt <- as.POSIXlt(Sys.time())
print(class(current_datetime_lt))
# Output: "POSIXlt"

# Format POSIXlt object
formatted_datetime_lt <- format(current_datetime_lt, "%Y-%m-%d %H:%M:%S")
print(formatted_datetime_lt)

# Generate sequence of POSIXlt objects
sequence_lt <- seq(as.POSIXlt("2024-05-01"), by = "day", length.out = 5)
print(sequence_lt)


#------------------------POSIXlt class function : ----------------------------
as.POSIXlt("2024-05-01 12:30:45")
class(as.POSIXlt("2024-05-01 12:30:45"))


format(as.POSIXlt("2024-05-01 12:30:45"), "%Y-%m-%d %H:%M:%S")
print(as.POSIXlt("2024-05-01 12:30:45"))

summary(as.POSIXlt("2024-05-01 12:30:45"))
strptime("2024-05-01 12:30:45", "%Y-%m-%d %H:%M:%S")
unclass(as.POSIXlt("2024-05-01 12:30:45"))





#---------------strptime function
# Example 1: Parse a character string representing a date-time value
datetime_str <- "2024-05-01 12:30:45"
parsed_datetime <- strptime(datetime_str, format = "%Y-%m-%d %H:%M:%S")
print(parsed_datetime)
class(parsed_datetime)



# Example 2: Parse a character string representing a date value
date_str <- "2024-05-01"
parsed_date <- strptime(date_str, format = "%Y-%m-%d")
print(parsed_date)
class(parsed_date)


# Example 3: Parse a character string representing a time value
time_str <- "12:30:45"
parsed_time <- strptime(time_str, format = "%H:%M:%S")
print(parsed_time)
class(parsed_time)



#-----------------------------difftime -----------------------------------

?difftime
# Example 1: Compute difference in days

time1 <- as.POSIXct("2024-05-01 12:00:00")
time2 <- as.POSIXct("2024-05-05 12:00:00")
diff_days <- difftime(time2, time1, units = "days")
print(diff_days)  
# Output: Time difference of 4 days
class(diff_days)



# Example 2: Compute difference in hours
diff_hours <- difftime(time2, time1, units = "hours")
print(diff_hours)  # Output: Time difference of 96 hours

# Example 3: Compute difference in minutes
diff_mins <- difftime(time2, time1, units = "mins")
print(diff_mins)  
# Output: Time difference of 5760 mins

# Example 4: Compute difference in seconds
diff_secs <- difftime(time2, time1, units = "secs")
print(diff_secs)  
# Output: Time difference of 345600 secs

diff_auto <- difftime(time1 , time2)
diff_auto
#output : Time difference of -4 days


# Example: Using difftime with POSIXlt objects
time1_lt <- as.POSIXlt("2024-05-01 12:00:00")
time2_lt <- as.POSIXlt("2024-05-05 12:00:00")

diff_days <- difftime(time2_lt , time1_lt , units = "days")
diff_days

diff_hours <- difftime(time2_lt , time1_lt , units = "hours")
diff_hours



#Example : using difftime with date objects

# Example: Using difftime with Date objects
date1 <- as.Date("2024-05-01")
date2 <- as.Date("2024-05-05")

diff_hours <- difftime(date2 ,  date1 , units = "hours")
diff_hours



