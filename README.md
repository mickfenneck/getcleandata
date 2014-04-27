#Getting and Cleaning Data

##Johns Hopkins University - Final Project

The data you need to make this script work are self contined in the `./UCI HAR Dataset` directory.

This is the source of the original datasets: `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

The description of the datasets should be found here: `http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`

###Running the script:
 - Clone the Repository
 - Open R/RStudio
 - Load data.table library with `library(data.table)`
 - Source the script contained in `run_analysis.R`
 - Call the function `run_analysis(path)`, `path` variable should be the path of "UCI HAR Dataset" directory.
 
###The function returns:
 - The function return a data table containing the tidy dataset.
 - A text file called `tidyData.txt` that contains the dataset.
