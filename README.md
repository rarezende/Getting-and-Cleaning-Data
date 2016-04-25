## Getting and Cleaning Data Course Project

This repository contains a script named "run_analysis.R" that collects data from
the "UCI HAR Dataset" provided and creates two tidy data sets as requested in the 
assignment.

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

and manipulates the data present in these files in order to create two tidy data sets
that respect the requirements in the assignment. The description of how the information
provided in the original data set was combined and cleaned to create the tidy data set 
is provided in details in the comments present in the R script.

These tidy data sets are then saved in the following files:

* "./MeanStdFeatures.txt"
* "./MeanStdAverage.txt"

 The file "./MeanStdFeatures.txt" contains the data set with the measurements on the mean 
 and standard deviation for each feature in the original data set, created respecting the
 requirements defined in the assignment.
 
 The file "./MeanStdAverage.txt" contains the tidy data set with the average of each variable 
 for each activity and each subject.







