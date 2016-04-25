# --------------------------------------------------------------------- #
#                  Getting and Cleaning Data Course
#
# Course project R script
#
# Cleans and manipulate data from the UCI HAR Dataset in order to 
# prepare the tidy datasets requested for the course project
# --------------------------------------------------------------------- #

library(dplyr)

# Loads the descriptions for the features (variables) available
# in the original data set and the activity labels used
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Loads the test data set tables
xTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
yTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")

# Combines the features values, subject and activity to create
# a flat table containing all the information for the test dataset
testDataSet <- cbind(subjectTest, yTest, xTest)

# Clean up features descriptions to create a tidy set of variable names
cleanFeatNames <- gsub("-", "_", as.character(features$V2))
cleanFeatNames <- gsub("()", "", cleanFeatNames, fixed = TRUE)
    
# Request 4: Appropriately labels the test data set with 
# descriptive variable names
colnames(testDataSet) <- c("Id_Subject", "Id_Activity", cleanFeatNames)

# Request 3: Merges the test dataset with the activity labels to provide
# descriptive activity names instead of IDs in the flat table
colnames(activityLabels) <- c("Id_Activity", "Activity")
testDataSet <- merge(activityLabels, 
                     testDataSet, 
                     by.x = "Id_Activity", 
                     by.y = "Id_Activity")

# Loads the train dataset tables
xTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")

# Combines the features values, subject and activity to create
# a flat table containing all the information for the train dataset
trainDataSet <- cbind(subjectTrain, yTrain, xTrain)

# Request 4: Appropriately labels the train data set with 
# descriptive variable names
colnames(trainDataSet) <- c("Id_Subject", "Id_Activity", cleanFeatNames)

# Request 3: Merges the train dataset with the activity labels to provide
# descriptive activity names instead of IDs in the flat table
trainDataSet <- merge(activityLabels, 
                      trainDataSet, 
                      by.x = "Id_Activity", 
                      by.y = "Id_Activity")

# Request 1: Aggregate the train and the test sets to create one data set
fullDataSet <- rbind(testDataSet, trainDataSet)

# Request 2: Extracts only the measurements on the mean and standard deviation 
# for each measurement.
meanStdColumns <- c(3, 2, grep("mean|std", names(fullDataSet)))
meanStdDataSet <- fullDataSet[,meanStdColumns]

# Request 5: Creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
meanStdAverage <-  as.tbl(meanStdDataSet) %>%
                   group_by(Id_Subject, Activity) %>%
                   summarize_each(funs(mean))

# Renames the columns to provide the appropriate name "Avg_<feature>"
# after summarizing using mean()
changeName <- function(oldName) {paste("Avg_", oldName, sep = "")}
colNamesAvg <-sapply(names(meanStdAverage)[3:ncol(meanStdAverage)], changeName)
colnames(meanStdAverage)[3:ncol(meanStdAverage)] <- colNamesAvg

# Saves the two requested data sets
write.table(meanStdDataSet, "./MeanStdFeatures.txt")
write.table(meanStdAverage, "./MeanStdAverage.txt")




