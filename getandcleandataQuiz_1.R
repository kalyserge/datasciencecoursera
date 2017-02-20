## Quiz 1 Getting and Cleaning Data

setwd("C:/Users/jeffthatcher/Cloud Drive/RRepos/GetCleanData")
data2 <- read.csv("./GetAndCleanDataQuiz_1/getdata_data_ss06hid.csv")
library(data.table)

## Question 1
if(!file.exists("GetAndCleanDataQuiz_1")) {dir.create("GetAndCleanDataQuiz_1")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./GetAndCleanDataQuiz_1/IdahoHousing.csv")
list.files("./GetAndCleanDataQuiz_1") # sort of like the ls() command, shows the files in the directory "./data"

IH <- read.table("./GetAndCleanDataQuiz_1/IdahoHousing.csv", sep = ",", header = TRUE)
head(IH$VAL)
a <- IH$VAL[!is.na(IH$VAL)] == 24 #return T/F vector of col VAL equal to 24 ($1,000,000 + )
sum(a) # sum of all the TURE values in `a`

## Question 3
library(xlsx)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./GetAndCleanDataQuiz_1/natgas.xlsx", mode="wb")
list.files("./GetAndCleanDataQuiz_1") # sort of like the ls() command, shows the files in the directory "./data"

dat <- read.xlsx("./GetAndCleanDataQuiz_1/natgas.xlsx", sheetIndex=1, 
                 startRow=18, endRow=23, colIndex=c(7:15), 
                 header=TRUE)
#read.xlsx marche pas#
dat <- read.table("./GetAndCleanDataQuiz_1/natgas2.csv",quote="\"",, sep = ",", header = TRUE)

sum(dat$Zip*dat$Ext,na.rm=T) 

## Question 4
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE) # loads the document into R memory for parsing 
rootNode <- xmlRoot(doc) # weapper element for entire XML document
xmlName(rootNode) # returns the name of the XML

zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
x <- zip == 21231
sum(x)

## Question 5
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./GetAndCleanDataQuiz_1/IdahoHousing.csv")
list.files("./GetAndCleanDataQuiz_1") # sort of like the ls() command, shows the files in the directory "./data"

#similar to read table mais ne marche pas # DT <- fread("./GetAndCleanDataQuiz_1/IdahoHousing.csv", sep = ",", header = TRUE)
DT <- read.table("./GetAndCleanDataQuiz_1/IdahoHousing.csv", sep = ",", header = TRUE)

# calculates the mean of a column (pwgtp15) subsetted by the levels of a second column (SEX)
library(data.table)
DT[,mean(pwgtp15),by=SEX]
#test# DT[,mean(pwgtp15),by=$SEX]

#########

tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT$pwgtp15,by=DT$SEX)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
sapply(split(DT$pwgtp15,DT$SEX),mean)


