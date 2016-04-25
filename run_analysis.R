setwd("C:/Users/Rodrigo/Data-Science/Data")

features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

xTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
yTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")

testDataSet <- cbind(subjectTest, yTest, xTest)
colnames(testDataSet) <- c("Id_Subject", "Id_Activity", as.character(features$V2))

colnames(activityLabels) <- c("Id_Activity", "Activity")

testDataSet <- merge(activityLabels, 
                     testDataSet, 
                     by.x = "Id_Activity", 
                     by.y = "Id_Activity")


xTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")

trainDataSet <- cbind(subjectTrain, yTrain, xTrain)
colnames(trainDataSet) <- c("Id_Subject", "Id_Activity", as.character(features$V2))


trainDataSet <- merge(activityLabels, 
                      trainDataSet, 
                      by.x = "Id_Activity", 
                      by.y = "Id_Activity")

fullDataSet <- rbind(testDataSet, trainDataSet)

meanStdColumns <- c(3, 2, grep("mean()|std()", names(fullDataSet)))

meanStdDataSet <- fullDataSet[,meanStdColumns]

featuresAvg <- as.tbl(meanStdDataSet) %>% group_by(Id_Subject, Activity)

colnames(featuresAvg) <- gsub("-", "_", names(featuresAvg))
colnames(featuresAvg) <- gsub("()", "", names(featuresAvg), fixed = TRUE)

featuresAvg <- summarize_each(featuresAvg, funs(mean))

changeName <- function(oldName) {paste("Avg(", oldName, ")", sep = "")}

colNamesAvg <-sapply(names(featuresAvg)[3:ncol(featuresAvg)], changeName)

colnames(featuresAvg)[3:ncol(featuresAvg)] <- colNamesAvg




