# Load data.table
library(data.table)

# Import food.csv as a data frame: food
food <- fread("food.csv", data.table = FALSE)

# View summary of food
summary(food)

# View head of food
head(food)

# View structure of food
str(food)

# Load dplyr
library(dplyr)

# View a glimpse of food
glimpse(food)

# View column names of food
names(food)

# Define vector of duplicate cols (don't change)
duplicates <- c(4, 6, 11, 13, 15, 17, 18, 20, 22, 
                24, 25, 28, 32, 34, 36, 38, 40, 
                44, 46, 48, 51, 54, 65, 158)

# Remove duplicates from food: food2
food2 <- food[, -duplicates]

# Define useless vector (don't change)
useless <- c(1, 2, 3, 32:41)

# Remove useless columns from food2: food3
food3 <- food2[,-useless]

# Create vector of column indices: nutrition
nutrition = str_detect(names(food3), "100g")

# View a summary of nutrition columns
summary(food3[,nutrition])

# Find indices of sugar NA values: missing
missing <- which(is.na(food3$sugars_100g))

# Replace NA values with 0
food3$sugars_100g[missing] <- 0

# Create first histogram
hist(food3$sugars_100g, breaks = 100)

# Create food4
food4 <- food3[which(food3$sugars_100g>0), ]

# Create second histogram
hist(food4$sugars_100g, breaks = 100)

# Find entries containing "plasti": plastic
plastic <- str_detect(food3$packaging, "plasti")

# Print the sum of plastic
sum(plastic)