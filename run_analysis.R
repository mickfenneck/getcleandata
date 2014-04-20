##call as
# data <- run_analysis(paste(getwd(),"/UCI HAR Dataset/",sep=""))

run_analysis <- function(path) {
    #leggo label e titoli
    activity_labels <-read.table(paste(path,"/activity_labels.txt",sep=""))
    titles <- read.table(paste(path,"/features.txt",sep=""))
    
    #leggo le x
    trainx <- read.table(paste(path,"train/X_train.txt",sep=""))
    testx <- read.table(paste(path,"test/X_test.txt",sep=""))
    x <- rbind(trainx,testx)
    names(x) <- titles$V2
    eraseCol <- grep("mean()|std()",names(x),invert=TRUE)
    x[eraseCol] <- list(NULL)
    
    #leggo le y e sostituisco con labels labels
    trainy <- read.table(paste(path,"train/y_train.txt",sep=""))
    testy <- read.table(paste(path,"test/y_test.txt",sep=""))
    y <- rbind(trainy,testy)
    #converto la colonna a factor per modificare i levels
    y$V1 <- as.factor(y$V1)
    levels(y$V1) <- activity_labels$V2
    names(y)[1] <- "Labels"
    #unisco y a x
    data <- cbind(y[1],x)

    data
}