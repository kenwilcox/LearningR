# Load csv data (previously transformed)
movies <- read.csv(
  file = "Movies.csv",
  quote = "\""
)

genres <- read.csv(
  file = "Genres.csv",
  quote = "\""
)

# Peek at data
head(movies)
head(genres)

# Univariate statistics for qualitive variables
table(movies$Rating)
table(genres$Genre)

# Univariate statistics for quantitative variables
# Analyze the location of quantitative variable
mean(movies$Runtime)
median(movies$Runtime)
which.max(table(movies$Runtime))

# Analyze the spread of quantitative variable
min(movies$Runtime)
max(movies$Runtime)
range(movies$Runtime)
diff(range(movies$Runtime))

# show the four equal partitions
quantile(movies$Runtime)
# or just a cutoff point
quantile(movies$Runtime, 0.25)
# or the percentile
quantile(movies$Runtime, 0.90)

# checking the spread of the data
IQR(movies$Runtime) # 20 minutes

# Inspect the variance of the data
var(movies$Runtime)

# standard deviation
sd(movies$Runtime)

# Skewness and kurtosis not built in, moments has it!
install.packages("moments")
library(moments)
skewness(movies$Runtime)
kurtosis(movies$Runtime)
plot(density(movies$Runtime))

# Summarize a quantitative variable
summary(movies$Runtime)
