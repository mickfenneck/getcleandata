#Getting and Cleaning Data - Johns Hopkins

##Final Project
This file contains the description of how this script works.

The script is divided in different "logical" parts:
 - Read activity_labels and titles
 - Read and merge the X part of the datasets
 - Read and merge the Y part of the datasets
 - Read subjects
 - Merge the data frames
 - Create a tidy dataset
 - Write the txt file.

The code is self commented and I want to descrbe in a more accurate way only few lines of code.
 - `eraseCol <- grep("mean()|std()",names(x),invert=TRUE)` takes only the columns that contain mean and standard deviation
 - `y$V1 <- as.factor(y$V1)` converts to factor the activity_label column in order to change the levels.
 - `levels(y$V1) <- activity_labels$V2` changes the levels of activity_labels
 - `tidyData <- data[,lapply(.SD, mean), by="Activity,Subject"]` creates the tidy dataset with the lapply function
 - `write.table(tidyData, "tidyData.txt")` writes the data table to file

