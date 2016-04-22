########################################
#
#Cleaning the files for use
#
########################################

setwd("./RawData")
library(readr)

#fall data 2010 - 2014

#Cari Kaufman
stat2010f <- read_csv("Grade Distribution (fall 2010).csv")

#Cari Kaufman
stat2011f <- read_csv("Grade Distribution (fall 2011).csv")

#Deborah Nolan, Fletcher Ibser
stat2012f <- read_csv("Grade Distribution (fall 2012).csv")

#Benoit Dherin, Fletcher Ibser
stat2013f <- read_csv("Grade Distribution (fall 2013).csv")

#Ingileif Hallgrimsdottir, Fletcher Ibser
stat2014f <- read_csv("Grade Distribution (fall 2014).csv")


#spring data 2010 - 2015

#Philip Spector
stat2010s <- read_csv("Grade Distribution (spring 2010).csv")

#Philip Spector
stat2011s <- read_csv("Grade Distribution (spring 2011).csv")

#Fletcher Ibser, Deborah Nolan
stat2012s <- read_csv("Grade Distribution (spring 2012).csv")

#Haiyan Huang
stat2013s <- read_csv("Grade Distribution (spring 2013).csv")

#Cari Kaufman, Benoit Dherin
stat2014s <- read_csv("Grade Distribution (spring 2014).csv")

#Deborah Nolan, Ingileif Hallgrimsdottir
stat2015s <- read_csv("Grade Distribution (spring 2015).csv")



########################################
##extract Enrollment Cnt, Instructor Name, 
##Average Grade, and Grade Nm,
##from columns 2, 6, 7, and 13 of the raw data
##only extracting data for letter grades
##(removing Pass/No Pass)
########################################

#fall semesters
stat2010f <- stat2010f[nchar(stat2010f[,13]) < 3, c(2, 6, 7, 13)]
stat2011f <- stat2011f[nchar(stat2011f[,13]) < 3, c(2, 6, 7, 13)]
stat2012f <- stat2012f[nchar(stat2012f[,13]) < 3, c(2, 6, 7, 13)]
stat2013f <- stat2013f[nchar(stat2013f[,13]) < 3, c(2, 6, 7, 13)]
stat2014f <- stat2014f[nchar(stat2014f[,13]) < 3, c(2, 6, 7, 13)]

#spring semesters
stat2010s <- stat2010s[nchar(stat2010s[,13]) < 3, c(2, 6, 7, 13)]
stat2011s <- stat2011s[nchar(stat2011s[,13]) < 3, c(2, 6, 7, 13)]
stat2012s <- stat2012s[nchar(stat2012s[,13]) < 3, c(2, 6, 7, 13)]
stat2013s <- stat2013s[nchar(stat2013s[,13]) < 3, c(2, 6, 7, 13)]
stat2014s <- stat2014s[nchar(stat2014s[,13]) < 3, c(2, 6, 7, 13)]
stat2015s <- stat2015s[nchar(stat2015s[,13]) < 3, c(2, 6, 7, 13)]

########################################
#Creating the files for
#the cleaned data
########################################

#location in the vector
spot <- 1

for(i in 2010:2014){
  #create the names for fall grades
  fall_names[spot] <- paste0("Grades", as.character(i), "f.csv")
  
  #increment the location
  spot <- spot + 1
}

#reset the location for spring
spot <- 1

for(i in 2010:2015){
  #names for spring grades
  spring_names[spot] <- paste0("Grades", as.character(i), "s.csv")
  spot <- spot + 1
}

#congregate all the names for fall and spring
file_names <- c(fall_names, spring_names)

#create a list of all the semester grade variables
grades <- list(stat2010f, stat2011f, stat2012f, 
               stat2013f, stat2014f, stat2010s,  
               stat2011s, stat2012s, stat2013s, 
               stat2014s, stat2015s)

#set the new working directory to "Data", the location
#for the cleaned data
setwd("../Data")

#create a vector of column names
file_column_names <- names(stat2010f)


#loopdy loop to fill the .csv
for(i in 1:length(grades)){
  
  #create a temporary variable for the data
  temp_data <- data.frame(grades[i])
  
  #create a variable to store the .csv data
  pasted_data <- ""
  
  #create file and put the header of names in
  cat(paste(file_column_names, collapse = ","), file = file_names[i])
  cat("\n", file = file_names[i], append = TRUE)
  
  #extract the data from the data frame temp_data
  #representing a semester of grades
  #row by row, separated by commas, ending with a newline
  #append this to the file for the semester
  for(j in 1:length(temp_data[,1])){
    pasted_data <- paste(temp_data[j,], collapse = ",")
    pasted_data <- paste(pasted_data, "\n")
    cat(pasted_data, file = file_names[i], append = T)
  }
}

#I could have used write.csv(), but it added a
#beginning column showing what row number it was
#and I didn't like that.
#for(i in 1:length(file_names)){
#  write.csv(grades[i], file = file_names[i], quote = T)
#}

setwd("..")