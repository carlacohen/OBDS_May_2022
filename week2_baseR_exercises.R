##Activity 1##

1+1 #let's test out some sums
3*4

#comments

#here is another script

boat.names <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
boat.colors <- c("black", "green", "pink", "blue", "blue", "green", "green", "yellow",
                 "black", "black")
boat.ages <- c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86)
boat.prices <- c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132)

boat.prices[1]
boat.ages[1:5]
boat.names[boat.colors == "black"]
boat.prices[boat.colors == "green" | boat.colors == "yellow"]
sum(boat.colors == "pink")

##Activity 2##

#Make a vector called ‘a’ of numbers 1 to 200
a <- 1:200 ; a #;a makes a new line to say print a

#Multiply each element of the vector by 123 and save to a new object called ‘b’
b <- a*123

#Extract the 44th element
b[44]

#Extract the first 15 elements and assign to new variable b_sub
b_sub <- b[1:15]

#Add the numbers 24108 and 24231 to the object b_sub
b_sub <- c(b, 24108, 24231)

#Try making a vector of the following
c <- c("actb", 100, 3.4)
c[2] #this has made the number 100 as a character, because we already put in the character "actb"
c[2]*5 #this command fails as the number 100 is not an integer, it is a character

my_vector <- c(plant = "tulip", car = "mazda", child = "Amy", animal = "cat")
names(my_vector)


##Activity 3##

#Create a matrix of numbers 1-9 of dimensions 3x3
my_matrix <- matrix(1:9, nrow = 3)
my_matrix

#Extract the number ‘8’
my_matrix [2, 3]

#Create a matrix of numbers with 4 columns and 3 rows, filled by row.
matrix_2 <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
matrix_2

#Add column and row names to this matrix.
row.names(matrix_2) <- c("r1", "r2", "r3")
colnames (matrix_2) <- c("1st", "2nd", "3rd", "4th")

#Create an array of numbers 1-24 in 4 rows, 2 columns, 3 dimensions.
my_array <- array(1:24, dim = c(4, 2, 3))
my_array

#Extract the number ‘15’
my_array[3, 2, 2]

#Extract the last matrix in the array and save to a new object called last_matrix
last_matrix <- my_array[,,3]
last_matrix

#Create a list of 5 items of multiple data types.
my_list <- list(1:10, c("one", "two", "three"), my_array, my_matrix, a)
my_list

#Extract 3rd and 5th item in the list
my_list[[3]] #just pulls out item 3
my_list[c(3, 5)] #pulls out 3rd and 5th

#pull out number 14 from 3rd item in list (my_array)
my_list[[3]][2,2,2]

##Extra Activity##

movie <- c("Whatever Works","It Follows","Love and Mercy","The Goonies",
           "Jiro Dreams of Sushi","There Will be Blood", "Moon", 
           "Spice World", "Serenity", "Finding Vivian Maier")
           
year <- c("2009","2015","2015","1985","2012","2007","2009","1988","2005","2014")

boxoffice <- c(35,5,15,62,3,10,321,79,39,1.5)

genre <- c("Comedy","Horror","Drama","Adventure","Documentary","Drama","Science,Fiction","Comedy","Science Fiction",
"Documentary")

# What is the name of the 10th movie in the list?
movie[10]

# What are the genres of the first 4 movies?
genre[1:4]

# Some joker put Spice World in the movie names – it should be 'The Naked Gun’ Please correct the name.
#pull out "Spice World"
movie
movie == "Spice World" #creates an index
# Assign it a new name 
movie[movie == "Spice World"] <- "The Naked Gun"
movie

# What were the names of the movies made before 1990?
year < 1990
movie[year<1990]

# What were the names of the Comedy movies? 
movie[genre == "Comedy"]

# What were their boxoffice totals?
boxoffice[genre == "Comedy"]

# What were the names of the movies that made less than $50 Million dollars AND were Comedies?
movie[boxoffice < 50 & genre == "Comedy"]

##Activity 4 - Dataframes##

# Load the coding_gene_region.bed into R /project/obds/shared/resources/2_r/baseR/coding_gene_region.bed
data <- read.table("/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed", 
                   header = FALSE, #don't actually need to specify these as they are all default
                   stringsAsFactors = FALSE,
                   sep = "\t")               

# Check the dimensions of the dataframe and the class of each variable
dim (data)
class(data)
class(data[1])
class(data[2])

#How many rows and columns are there in this dataframe?
nrow(data)
ncol(data)

# Add column names. The columns are:  "chr", "start", "stop", "name", "score", "strand"
colnames(data) <- c("chr", "start", "stop", "name", "score", "strand")

# Display the new columns names.
colnames(data)

# Extract the element at row 30, column 3
data[30,3]

# Extract the second column by index and by name (using both [ ] and $ ), assign these to new variables
column_2a <- data[,2]
column_2b <- data$start

# Calculate the intervals (start-stop) and add them as a new column called int_length.
data$int_length <- data$stop - data$start

# What is a quick way to check you have added this column?
View(data)
names(data)

# Subset the data frame to contain only regions with a length from 100,001-200,000 bp - assign to a new variable.
data_sub <- data[data$int_length >= 100001 & data$int_length <= 200000,] #the comma at the end tells us to look by row

# Write your subsetdata frame to a tab separated file ie (include column names but not rownames)
write.table(data_sub, "coding_gene_region_subset.bed", row.names = FALSE, col.names = TRUE, sep = "\t", quote = FALSE)


##Extra Activity - Scalar and Vectors##

#Create the vector 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 in three ways: once using c(), once using a:b, and once using seq()
vector_1a <- c(1:10)
vector_1b <- 1:10
vector_1c <- seq(from = 1, to = 10, by = 1)

#Create the vector 2.1, 4.1, 6.1, 8.1 in two ways, once using c() and once using seq()
vector_2a <- c(2.1, 4.1, 6.1, 8.1)
vector_2b <- seq(2.1, 8.1, 2)

#Create the vector 0, 5, 10, 15 in 3 ways: using c(), seq() with a by argument, and seq() with a length.out argument
vector_3a <- c(0, 5, 10, 15)
vector_3b <- seq(0, 15, 5)
vector_3c <- seq(from = 0, by = 5, length.out = 4)

#Create the vector 101, 102, 103, 200, 205, 210, 1000, 1100, 1200 using a combination of the c() and seq() functions
vector_4 <- c(seq(101, 103, 1), seq(200, 210, 5), seq(1000, 1200, 100))

#Create a vector that repeats the integers from 1 to 5, 10 times. That is [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, …].
#The length of the vector should be 50!
vector_5 <- rep(1:5, 10)
length(vector_5) 

#Now, create the same vector as before, but this time repeat 1, 10 times, then 2, 10 times, etc., That is
#[1, 1, 1, …, 2, 2, 2, …, … 5, 5, 5]. The length of the vector should also be 50

vector_6 <- rep(1:5, times = 1, each = 10)
length (vector_6)

##Extra activity - working with dataframes##

vector1 <- 1:10
vector2 <- letters[1:10]
vector3 <- rnorm(10, sd = 10)
df <- data.frame(vector1, vector2, vector3, stringsAsFactors = FALSE)
str(df)
df

#One can select columns from a data frame using either the name or the position. 
#Use both methods to print the last two columns from the df data frame

df[,2:3]
df[, c("vector2", "vector3")]

#Print all letters in the vector2 column of the data frame where the vector3 column has a positive value
df[df$vector3 > 0, 2]
df$vector2[df$vector3>0]

#Look up the function paste(). Create a new vector combining the all columns of df separated by a underscore.

new_vector <- paste(vector1, vector2, vector3, sep = "_")
new_vector
