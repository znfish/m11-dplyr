# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
data <- read.csv('data/vehicles.csv', stringsAsFactors = FALSE)
View(data)

# You should have have access to the `vehicles` data.frame


# Create a data.frame of vehicles from 1997
v.1997 <- data[data$year == 1997,]
View(v.1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique <- unique(v.1997$year)
len <- length(unique)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.w <- data[data$drive == "2-Wheel Drive",]
View(two.w)
twenty.city <- two.w[two.w$cty > 20,]
View(twenty.city)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst <- twenty.city$id[twenty.city$hwy == min(twenty.city$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
Most.hwy <- function(year, make) {
  this.make <- data[data$make == make & data$year == year,]
  most <- this.make$id[this.make$hwy == max(this.make$hwy)]
  return (most)
}

# What was the most efficient honda model of 1995?
ans <- Most.hwy(1995, "honda")


