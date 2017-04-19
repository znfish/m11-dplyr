# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
data <- read.csv('data/vehicles.csv', stringsAsFactors = FALSE)
View(data)
# Install (if you haven't already) and load the `dplyr`package
install.packages('dplyr')
library('dplyr')
# You should have have access to the `vehicles` data.frame


# Create a data.frame of vehicles from 1997
v.1997 <- filter(data, year == 1997)
View(v.1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame


# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel <- filter(data, cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst <- filter(data, hwy == min(data$hwy))$id

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
Most.hwy <- function(year, make) {
  v <- filter(data, year == year, make == make, hwy == min(data$hwy))$id
  return (v)
}

# What was the most efficient honda model of 1995?
ans <- Most.hwy(1995, 'honda')

