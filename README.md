# Stat-133-Grade-Distribution
Description: The purpose of this project was to analyze the grade distributions of Stat 133 classes over the years 2010 to 2015. Analysis would include measurements of average GPA from the class, average of GPA based on the teacher, []

Author information:
Steven Lam -steventomlam@gmail.com  or  plam120@berkeley.edu

Alexander Lee - alexgeraldlee@berkeley.edu


Files and Directories:
The raw data as obtained from UC Berkeley [CalAnswers] is contained in the directory "RawData". The cleaned data - which extracts from the raw data the columns of Enrollment Count, Instructor Name, Average Grade, and Grade Name - is contained in the directory "Data". 


Instructions:
If you want to replicate the process by which we organized this, assume that you start with the "Stat133GradeDistributions" directory. Run `skeleton.R` first,  contained in "./RawData/Script". Clean the data using `DataCleaning.R`, contained in "./Code". 

We assume you maintain the environment after running each file, so we do not re-import files in subsequent files. 


Naming convention:
Data frames containing static data are named using Camel notation. Variables - any vector, data frame, etc. that is being manipulated for the purposes of analysis - are named using underscore notation.



You may share our code.
