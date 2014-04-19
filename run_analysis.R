##call as
# data <- run_analysis(paste(getwd(),"/UCI HAR Dataset/",sep=""))

run_analysis <- function(path) {
    activity_labels <-read.table(paste(path,"/activity_labels.txt",sep=""))
    titles <- read.table(paste(path,"/features.txt",sep=""))
    
    trainx <- read.table(paste(path,"train/X_train.txt",sep=""))
    names(trainx) <- titles$V2
    trainy <- read.table(paste(path,"train/y_train.txt",sep=""))
    trainy <-  merge(x=trainy,y=activity_labels,by.x="V1",by.y="V1")
    train <- cbind(trainy[2],trainx)
    
    testx <- read.table(paste(path,"test/X_test.txt",sep=""))
    names(testx) <- titles$V2
    testy <- read.table(paste(path,"test/y_test.txt",sep=""))
    testy <- join <- merge(x=testy,y=activity_labels,by.x="V1",by.y="V1")
    test <- cbind(testy[2],testx)
    
    #append the 2ns table to the 1st 
    data <- rbind(test,train)
    #change name of the first column to labels
    names(data)[1]<-"labels"
    data
}
