# Set Working Directory in RStudio

# Load up the data
movies <- read.table(
  file="Movies.txt",
  sep = "\t",
  header = TRUE,
  quote="\""
)

# peek at the data
head(movies)

# Look at the column names
names(movies)

# Problem #1: Column Name is incorrect
names(movies)[5]
# Rename variable
names(movies)[5] <- "Critic.Score"
# Problem #1 solved
names(movies)

# Problem #2: Missing values
# Count missing values
sum(is.na(movies))

# Inspect rows with missing values
tail(movies)

# Exclude observations with missing values
movies <- na.omit(movies)

# Problem #2 solved
sum(is.na(movies))

# Problem #3 units in runtime column
# Peek at the movie runtime data
head(movies$Runtime)

# minutes is not an integer, can't do math
mean(movies$Runtime)

# Determine the data type
class(movies$Runtime)

# Cast from factor to character string
runtimes <- as.character(movies$Runtime)
head(runtimes)
class(runtimes)

# Eliminate the unit of measure
runtimes <- sub(" min", "", runtimes)
head(runtimes)

# Cast the character string to integer
movies$Runtime <- as.integer(runtimes)
head(movies$Runtime)
class(movies$Runtime)

# Now we can perform mathematical functions
mean(movies$Runtime)

# Problem 4: Box office uses three units of measure
head(movies$Box.Office)

# Create a function to convert box office revenue
convertBoxOffice <- function(boxOffice)
{
  stringBoxOffice <- as.character(boxOffice)
  replacedBoxOffice <- gsub("[$|k|M]", "", stringBoxOffice)
  numericBoxOffice <- as.numeric(replacedBoxOffice)
  
  if (grepl("M", boxOffice)) {
    numericBoxOffice
  } else if (grepl("k", boxOffice)) {
    numericBoxOffice * 0.001
  } else {
    numericBoxOffice * 0.000001
  }
}

# Convert box office to single unit of measure (millions)
movies$Box.Office <- sapply(movies$Box.Office, convertBoxOffice)

# Problem 4 is solved
head(movies$Box.Office)
class(movies$Box.Office)
mean(movies$Box.Office)

# Save data to a CSV file
write.csv(movies, "Movies.csv")

