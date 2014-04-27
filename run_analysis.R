run_analysis <- function() {
    #read activity_labels and titles
    activity_labels <-read.table("./activity_labels.txt")
    titles <- read.table("./features.txt")
    
    #read and merge the x datasets
    trainx <- read.table("./train/X_train.txt")
    testx <- read.table("./test/X_test.txt")
    x <- rbind(trainx,testx)
    names(x) <- titles$V2
    eraseCol <- grep("mean()|std()",names(x),invert=TRUE)
    x[eraseCol] <- list(NULL)
    
    #read and merge the y datasets
    trainy <- read.table("./train/y_train.txt")
    testy <- read.table("./test/y_test.txt")
    y <- rbind(trainy,testy)
    y$V1 <- as.factor(y$V1)
    levels(y$V1) <- activity_labels$V2
    names(y)[1] <- "Activity"
    #read subjects
    trainSub <- read.table("./train/subject_train.txt")
    testSub <- read.table("./test/subject_test.txt")
    k <- rbind(trainSub,testSub)
    names(k)[1] <- "Subject"
    #merge y and x to data table
    data <- data.table(cbind(y[1],k,x))
    #create the tidy dataset
    tidyData <- data[,lapply(.SD, mean), by="Activity,Subject"]
    #write te dataset to file
    write.table(tidyData, "tidyData.txt")
    #return the dataset
    tidyData
}
