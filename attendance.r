# Load the gdata package
library(gdata)

# Import the spreadsheet: att
att <- read.xls("attendance.xls")

# Print the column names 
names(att)

# Print the first 6 rows
head(att)

# Print the last 6 rows
tail(att)

# Print the structure
str(att)

# Create remove
remove <- c(3, 56:59)

# Create att2
att2 <- att[-remove, ]


# Create remove
remove <- c(seq(3,17, 2))

# Create att3
att3 <- att2[, -remove]


# Subset just elementary schools: att_elem
att_elem <- att3[,c(1,6,7)]

# Subset just secondary schools: att_sec
att_sec <- att3[,c(1,8,9)]

# Subset all schools: att4
att4 <- att3[,1:5]

# Define cnames vector (don't change)
cnames <- c("state", "avg_attend_pct", "avg_hr_per_day", 
            "avg_day_per_yr", "avg_hr_per_yr")

# Assign column names of att4
colnames(att4) <- cnames 

# Remove first two rows of att4: att5
att5 <- att4[-c(1,2),]

# View the names of att5
names(att5)


# Remove all periods in state column
att5$state <- str_replace_all(att5$state, "\\.", "")

# Remove white space around state names
att5$state <- str_trim(att5$state)

# View the head of att5
head(att5)

# Change columns to numeric using dplyr (don't change)
library(dplyr)
example <- mutate_at(att5, vars(-state), funs(as.numeric))

# Define vector containing numerical columns: cols
cols <- -1

# Use sapply to coerce cols to numeric
att5[, cols] <- sapply(att5[,cols], as.numeric)
