run_analysis <- function(path) {
    trainx <- read.table(paste(path,"train/X_train.txt",sep=""))
    trainy <- read.table(paste(path,"train/y_train.txt",sep=""))
    train <- cbind(trainy,trainx)
    
    testx <- read.table(paste(path,"test/X_test.txt",sep=""))
    testy <- read.table(paste(path,"test/y_test.txt",sep=""))
    test <- cbind(testy,testx)
    
    data <- rbind(test,train)
    
    data
}