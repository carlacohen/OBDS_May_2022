##11.05.2022##

##Exercise 1 - Workspace Management##
#####################################

#Create 3 objects
a <- 1:10
b <- "hello"
c <- seq(5, 50, by = 5)

#save workspace as .RData file
save.image(file = "exercises_objects.RData")
#this workspace contains all 3 objects
#when you end your R session  you will be asked whether you want to create this file
#These files can be huge so you might want to save only one object

#save one object
saveRDS(a, file = "object_a.rds")

#Remove one of the objects – how can you check it is gone?
rm(b)
ls()

#Clear your workspace completely (remove all objects)

rm(list = ls()) #equivalent to using the brush icon
ls()

#Display your current working directory.
getwd()

#Make a new directory in your linux terminal and then set the R working directory to be that new directory.
#in linux mkdir 
setwd()#put path to new directory in brackets
#e.g. you might want to move to the directory where you are saving your output files, even though you are still in the same project
#always be mindful of where you are!

#Load the objects you saved in the .RData file
load("exercises_objects.RData")

#load one of the objects as a new name
a2 <- readRDS("object_a.rds")

###Exercise 2 - Descriptive Statistics###
#########################################

#Use readRDS() to load to an object called /project/obds/shared/resources/2_r/my_day2matrix.rds
matrix <- readRDS("/project/obds/shared/resources/2_r/my_day2matrix.rds")

#Add row sums and means to this dataset, and column sums and means.
sums <- rowSums(matrix)
means <- rowMeans(matrix)
sums
matrix_2 <- cbind(matrix, sums, means)
matrix_3 <- rbind (matrix_2, colMeans(matrix_2), colSums(matrix_2))

#Assign the bottom 4 right hand values to NA as they are meaningless
matrix_3[21:22,11:12] <-NA
matrix_3

#Load the inbuild dataset "Tooth Growth"
data("ToothGrowth")

#How do find more information on this dataset?
#Help
summary(ToothGrowth)

#What columns of data do we have?
head(ToothGrowth)
#length
#supplement
#dose
colnames(ToothGrowth)

#What is the mean tooth length?
mean(ToothGrowth$len)

#What is the maximum and minimum length of the toothgrowth?
max(ToothGrowth$len)
min(ToothGrowth$len)

#Can you calculate rowSums and rowMeans on this data?
rowSums(ToothGrowth)
rowMeans(ToothGrowth)
#No because you have non-numeric data

#What is the total length of teeth measured?
sum(ToothGrowth$len)

#Are there any NA values in this datset?
anyNA(ToothGrowth) #summary for whole dataset
is.na(ToothGrowth) #gives TRUE/FALSE for all positions in the df

##Extra Activity - Descriptive Statistics##
###########################################

#Create a new df
pirates <- data.frame(
  name = c("Astrid", "Lea", "Sarina", "Remon", "Lea", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"),
  sex = c("female", "male", "male", "male", "female", "male", "female", "female", "male", "female"),
  age = c(30, 25, 25, 29, 31, 30, 33, 35, 25, 34),
  superhero = c("Batman", "Superman", "Batman", "Spiderman", "Batman", "Antman", "Batman", "Superman", "Maggott",
                "Superman" ),
  tattoos = c(11, 15, 12, 12, 17, 12, 9, 13, 9, 9)
)
head(pirates)
dim(pirates)
pirates

#What is the median age of the 10 pirates?
median(pirates$age)

#What was the mean age of female and male pirates separately?
mean(pirates$age[pirates$sex == "female"])
mean(pirates$age[pirates$sex == "male"])
#alternative method
aggregate(pirates$age, by = list(pirates$sex), FUN = mean)

#What was the most number of tattoos owned by a male pirate?
max(pirates$tattoos[pirates$sex == "male"])

#What percent of pirates under the age of 32 were female?
#the bit in parenthesis is true/false, so sum gives you number of trues
sum(pirates$sex == "female") #5 pirates are female
sum(pirates$age < 32) #how many pirates are < 32? 7
sum(pirates$age<32 & pirates$sex == "female") #2 pirates are both <32 and female

sum(pirates$age<32 & pirates$sex == "female") / sum(pirates$age < 32) *100 #28.6%

#What percent of female pirates are under the age of 32?
sum(pirates$age<32 & pirates$sex == "female") / sum(pirates$sex == "female") *100 #40


#Add a new column to the dataframe called tattoos.per.year which shows how many tattoos each pirate has for each year in their life.
pirates$tattoos.per.year <- pirates$tattoos/pirates$age
pirates

#Which pirate had the most number of tattoos per year?
max.tattoos <- pirates[pirates$tattoos.per.year == max(pirates$tattoos.per.year),]
max.tattoos$name
class(max.tattoos)
max.tattoos$name
pirates
pirates[pirates$name == max.tattoos$name,]
pirates[, pirates$name == max.tattoos]

#What are the names of the female pirates whose favorite superhero is Superman?
pirates[pirates$superhero == "Superman",]
pirates$name[pirates[pirates$superhero == "Superman",]]

#What was the median number of tattoos of pirates over the age of 20 whose favorite superhero is Spiderman?
pirates.20.spider <- pirates[pirates$age >20 & pirates$superhero == "Spiderman",]
median(pirates.20.spider$tattoos)

##Exercise 3 - Sorting##
########################

#Load the AirQuality dataset using: data(airquality)
data("airquality")

#Look up more information about this dataset.
head(airquality)
help("airquality")
summary(airquality)

#Examine the dataset – how many rows and columns are there?
dim(airquality)

#Display the column headers.
colnames(airquality)

#Sort the dataframe by the first column (Ozone) in ascending order.
airquality[order(airquality$Ozone),]

#Sort the dataframe by the Month and then the Temp column in descending order and save to a new variable.
airquality_sort <- airquality[order(airquality$Month, airquality$Temp, decreasing = TRUE),]
airquality_sort

#Save this sorted data to a text tab delimited file on the server.
write.table(airquality_sort, "airquality_sort.txt", sep = "\t", quote = FALSE, row.names = FALSE)

##Exercise 4 - Merging##
########################

#Create the dataframes called buildings and data to merge:

buildings <- data.frame(location=c(1, 2, 3), name=c("b1", "b2", "b3"))

data <- data.frame(survey=c(1,1,1,2,2,2), location=c(1,2,3,2,3,1),
                   efficiency=c(51,64,70,71,80,58))

#Examine the 2 dataframes.
head (buildings)
head (data)

#What is the common key variable in these dataframes?
#location

#Use the merge() function to merge the two dataframes by the common key variable into a new dataframe called buildingStats
buildingStats <- merge(buildings, data, by = "location")
buildingStats

##Exercise 5 - Aggregate##
##########################

#Aggregate (or group) the airquality data by Month and return means on each of the numeric variables. 
#Also, remove “NA” values.
head(airquality)
aggregate(airquality, by = list(airquality$Month), FUN = mean, na.rm = TRUE)

#Aggregate the Solar.R column by Month, returning means of Solar.R The header of column 1 should be Month. 
#Remove “not available” values.
airquality_agg <- aggregate(airquality$Solar.R, by = list("Month" = airquality$Month), FUN = mean, na.rm = TRUE)
airquality_agg

#Apply the standard deviation function to the data aggregation you have just done.
airquality_sd <- aggregate(airquality$Solar.R, by = list("Month" = airquality$Month), FUN = sd, na.rm = TRUE)
airquality_sd
#NB cannot change name of the second column, would have to use setNames instead.


##Exercise 6 - apply##
######################

#NB need to do this after we have explained functions

#Create a numeric vector of length 10. 
#Write an lapply and sapply statement to square each element. Compare the two outputs.
v = 1:10
square <- function (x) {
  y = x^2
  return (y)
}
lapply(v, square)
sapply(v, square)


#Generate a list called my_list of length 4 containing both numeric and logical (T/F) vectors. 

a #numeric vector
c #numeric vector
e <- c(TRUE, FALSE, TRUE, TRUE) #logical vector
f <- c(FALSE, FALSE, FALSE, TRUE) #logical vector
my_list <- list(a, c, e, f)

#Write an lapply or sapply statement to calculate the sum of the elements in each vector.
lapply(my_list, sum)
sapply(my_list, sum)

#Write an sapply statement to repeat each element of each vector in your list my_list three times 
#e.g. 1, 4, 3 would become 1, 1, 1, 4, 4, 4, 3, 3, 3. Assign the output to a new list.

#do it by creating a function
repeat_function <- function(x){
  y <- rep(x, times = 1, each = 3)
  return(y)
}
new_list <- lapply(my_list, repeat_function); new_list

#alternatively just use the inbuilt rep function
lapply(my_list, rep, times = 1, each = 3)
sapply(my_list, rep, times = 1, each = 3)


##Exercise 7 - Loops##
#Write a for loop that iterates over the numbers 1 to 7 and prints the cube of each number using print().

for (i in 1:7){
  j = i^3
  print (j)
}

# Write a for loop that iterates over the column names of the inbuilt iris dataset and 
#print each together with the number of characters in the column name in parenthesis.
#Example output: Sepal.Length (12).
#Use the functions print(), paste0() and nchar(). Look up what these functions do using the help feature.

data("iris")
head (iris)
colnames(iris) #display column names of iris
nchar("species") #use nchar function to count characters in string

for (name in colnames(iris)){
  char <- nchar(name)  
  out <- paste0(name, " (", char, ")")
  print (out)
}

#could do it all in one line
for (i in colnames(iris)){
  print(paste0(i, " (", nchar(i), ")"))
}

#Write an ifelse loop to print the colours in colours_vector with four characters. Use nchar()

colours_vector <- c("red", "orange", "purple", "yellow", "pink", "blue")

nchar("orange")

#using for loop
for (colour in colours_vector){
  if (nchar(colour) == 4){
    print(colour)
  }
}

#using ifelse
ifelse(nchar(colours_vector)==4, colours_vector, NA)

#using square brackets
colours_vector[ifelse(nchar(colours_vector)==4,TRUE,FALSE)]


##Exercise 8 – Writing a Function##
###################################

#Write a function to calculate the hypotenuse of a triangle given the length of the 2 sides.
#Remember the hypotenuse is the square root of the sum of the squares - √(a² + b²)
#Run the function you have created with different values.

hypotenuse <- function (a, b){
  c = sqrt(a^2 + b^2)
  return (c)
}
hypotenuse(3, 4)
