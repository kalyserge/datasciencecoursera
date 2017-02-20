## R Programming Quiz 1
#The R language is a dialect of which of the following programming languages?
R is a dialect of the S language which was developed at Bell Labs
#The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition? Select all that apply
The freedom to restrict access to the source code for the software.
The freedom to prevent users from using the software for undesirable purposes.
The freedom to sell the software for any price.
#In R the following are all atomic data types EXCEPT: (Select all that apply)
matrix; table;list;data frame;array; 
#If I execute the expression x <- 4 in R, what is the class of the object `x' as determined by the `class()' function?
numeric
#If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?
numeric
#If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?
a matrix with 2 columns and 3 rows
#A key property of vectors in R is that elements of a vector all must be of the same class
#Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me? Select all that apply.
a character vector of length 1
a character vector containing the letter "a".
#Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?

#

#load quiz data (read.table ou .csv sont les moyens standard pour lire un fichier local)
data <- read.table(unz("quiz1_data.zip", "hw1_data.csv"), header=T, quote="\"", sep=",")
#data <- read.table(unz("quiz1_data.zip", "hw1_data.csv"), nrows=10, header=T, quote="\"" ou quote="", sep=",")
data <- read.csv("C:/Users/jeffthatcher/Cloud Drive/CourseERA/2_R_Programming/hw1_data.csv")
#setwd("E:\UNIVERSITE LAVAL 16-17\COURSERA\Guide de R")

#In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(data)

#Extract the first 2 rows of the data frame and print them to the 
# console. What does the output look like?
data2 <- data[1:2,]
data2

#How many observations (i.e. rows) are in this data frame?
tail(data)

#Extract the last 2 rows of the data frame and print them 
# to the console. What does the output look like?
data3 <- data[152:153,]
data3

#What is the value of Ozone in the 47th row?
data$Ozone[47]

#How many missing values are in the Ozone column of this data frame?
missingNA <- is.na(data$Ozone)
as.numeric(missingNA)
sum(missingNA)

missingNAN<- is.nan(data$Ozone)
as.numeric(missingNAN)
sum(missingNAN)

#What is the mean of the Ozone column in this dataset? Exclude 
# missing values (coded as NA) from this calculation.
Ozone <- na.omit(data$Ozone)
as.numeric(Ozone)
mean(Ozone)

#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp 
# values are above 90. What is the mean of Solar.R in this subset?

data.subO <- data[data$Ozone > 31, , drop = FALSE]
data.subTO <- data.subO[data.subO$Temp > 90, , drop = FALSE]
data.subTOO <- na.omit(data.subTO)
mean(data.subTOO$Solar.R)

#What is the mean of "Temp" when "Month" is equal to 6?
data.June <- data[data$Month == 6, , drop = FALSE]
mean(data.June$Temp)

#What was the maximum ozone value in the month of May (i.e. Month = 5)?
data.May <- data[data$Month == 5, , drop = FALSE]
data.MayO <- na.omit(data.May)
max(data.MayO$Ozone)