## Getting and Cleaning Data Course Project

This repository contains a script named "run_analysis.R" that collects data from
the "UCI HAR Dataset" provided for the project and creates a tidy data set
as requested in the assignment.

The script assumes that during execution the current R working directory has a subdirectory named
"UCI HAR Dataset" and that this subdirectory respects the directory structure defined
in the zip file provided.

The script reads the following files:

* "./UCI HAR Dataset/features.txt"
* "./UCI HAR Dataset/activity_labels.txt"
* "./UCI HAR Dataset/test/X_test.txt"
* "./UCI HAR Dataset/test/y_test.txt"
* "./UCI HAR Dataset/test/subject_test.txt"
* "./UCI HAR Dataset/train/X_train.txt"
* "./UCI HAR Dataset/train/y_train.txt"
* "./UCI HAR Dataset/train/subject_train.txt"

and manipulates the data present in these files in order to create the required
data set. 

The description of how the information provided in the original files was combined 
and cleaned to create the new data set is provided in details in the Code Book provided
in this repository (CodeBook.md) and also in the comments present in the R script.

The requested tidy data set is then saved in the following file:

* "./MeanStdAverage.txt"

The file "./MeanStdAverage.txt" contains the tidy data set with the average of each variable 
for each activity and each subject.

The file can be loaded into R using read.table("./MeanStdAverage.txt", header = TRUE).







