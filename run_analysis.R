## if using source from the directory of this reco, call as
## data <- run_analysis(paste(getwd(),"/UCI HAR Dataset/",sep=""))

run_analysis <- function(path) {
    #read activity_labels and titles
    activity_labels <-read.table(paste(path,"/activity_labels.txt",sep=""))
    titles <- read.table(paste(path,"/features.txt",sep=""))
    
    #read and merge the x datasets
    trainx <- read.table(paste(path,"train/X_train.txt",sep=""))
    testx <- read.table(paste(path,"test/X_test.txt",sep=""))
    x <- rbind(trainx,testx)
    names(x) <- titles$V2
    eraseCol <- grep("mean()|std()",names(x),invert=TRUE)
    x[eraseCol] <- list(NULL)
    
    #read and merge the y datasets
    trainy <- read.table(paste(path,"train/y_train.txt",sep=""))
    testy <- read.table(paste(path,"test/y_test.txt",sep=""))
    y <- rbind(trainy,testy)
    y$V1 <- as.factor(y$V1)
    levels(y$V1) <- activity_labels$V2
    names(y)[1] <- "Activity"
    #read subjects
    trainSub <- read.table(paste(path,"train/subject_train.txt",sep=""))
    testSub <- read.table(paste(path,"test/subject_test.txt",sep=""))
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
