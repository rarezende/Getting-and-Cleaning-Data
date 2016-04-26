##CodeBook

A comprehensive description of the variables present in the original data set is provided 
in the files that accompany the data. For the purpose of the analysis performed by the
run_analysis.R script it is important to understand the contents of the following files:

* features.txt - contains the descriptive names for the 561 variables that were measured
* activity_labels.txt -  contains the descriptive names of the 6 activities that were monitored
* X_test.txt and X_train.txt - contain the values observed for the 561 variables
* y_test.txt and y_train.txt - contain the IDs for the activities being performed in each set of observations
* subject_test.txt and subject_train.txt - contain the IDs for the subject performing the activities in each set of observations

For both the test and the training datasets the information obtained from the X_[], y_[] and subject_[] files
was combined so that each row of the resultant table contained the ID of the subject performing the activity ("Id_Subject"),
the ID of the activity being performed ("Id_Activity") and the observed values for 561 variables that were measured.

This resulting table was then merged with the table containing the descriptive names of the activities 
(obtained from activity_labels.txt) so that each row now contained also the name of the activity being
performed ("Activity") and not only its ID. The descriptive names for all the observed variables were obtained from
features.txt and assigned to the respective columns.

It is important to note that before assigning the variable names to the columns it was necessary to strip the names
obtained from features.txt from all the "-" (minus sign) and parentheses so that the column names
could be correctly processed. The mentioned characteres were replaced by "_" (underscore).

After performing the above transformations in both the test and training data sets, the tables were combined 
to create one dataset.

In order to obtain only the values on the mean and standard deviation for each measurement we looked for 
column names containing either "mean" or "std" and created a new table with only this subset of columns.

Using the "dplyr" package, the table containing only mean and standard deviation was then grouped by 
"Id_Subject" and "Activity" and summarized using the mean() function. 

The names of the columns in the resulting summarized table were then changed to contain the prefix "Avg_" to reflect
their actual content.

The resulting data set has the following variables:

*Id_Subject
*Activity
*Avg_tBodyAcc_mean_[XYZ]
*Avg_tBodyAcc_std_[XYZ]
*Avg_tGravityAcc_mean_[XYZ]
*Avg_tGravityAcc_std_[XYZ]
*Avg_tBodyAccJerk_mean_[XYZ]
*Avg_tBodyAccJerk_std_[XYZ]
*Avg_tBodyGyro_mean_[XYZ]
*Avg_tBodyGyro_std_[XYZ]
*Avg_tBodyGyroJerk_mean_[XYZ]
*Avg_tBodyGyroJerk_std_[XYZ]
*Avg_tBodyAccMag_mean
*Avg_tBodyAccMag_std
*Avg_tGravityAccMag_mean
*Avg_tGravityAccMag_std
*Avg_tBodyAccJerkMag_mean
*Avg_tBodyAccJerkMag_std
*Avg_tBodyGyroMag_mean
*Avg_tBodyGyroMag_std
*Avg_tBodyGyroJerkMag_mean
*Avg_tBodyGyroJerkMag_std
*Avg_fBodyAcc_mean_[XYZ]
*Avg_fBodyAcc_std_[XYZ]
*Avg_fBodyAccJerk_mean_[XYZ]
*Avg_fBodyAccJerk_std_[XYZ]
*Avg_fBodyGyro_mean_[XYZ]
*Avg_fBodyGyro_std_[XYZ]
*Avg_fBodyAccMag_mean
*Avg_fBodyAccMag_std
*Avg_fBodyAcc_meanFreq_[XYZ]
*Avg_fBodyAccJerk_meanFreq_[XYZ]
*Avg_fBodyGyro_meanFreq_[XYZ]
*Avg_fBodyAccMag_meanFreq
*Avg_fBodyBodyAccJerkMag_meanFreq
*Avg_fBodyBodyGyroMag_meanFreq
*Avg_fBodyBodyGyroJerkMag_meanFreq


 



