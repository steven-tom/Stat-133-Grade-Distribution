################################################################################
#
#skeleton.R file
#
#used to create the subdirectories of the project
#
################################################################################


########################################
#Create subdirectories

dir.create("RawData")
dir.create("Data")
dir.create("Code")
dir.create("Report")
dir.create("Images")
file.create("README.md")

setwd("./RawData")

dir.create("Script")

setwd("..")

########################################

