Code Book for Data_means.txt
=================

In this file you will find information about the submmited R script and its output: Data_means.txt file.

---------------------------------------------
Overview
-------
The Data_means.txt is a tidy data set obtained from applying "run_analysis.R" script to the following files (these files should be on your R Working Directory):
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/activity_labels.txt

_You can download them [here]_ 

---------------------------------------------
Data
----
The original data set is the result of experiments which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. For each volunteer in each activity 561 features were measured several times. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

_See a [full description] of the original data set._

Then this data set was processed through "run_analysis.R" script to:
* Merges the training and the test sets to create one data set.
* Appropriately labels the data set with descriptive variable names.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

_For further information about the procces through the script see the README.md file._

---------------------------------------------
Variables
-----------
* **Subject:** A number from 1 to 30 corresponding to each of the volunteers.
* **Activity:** One of the six activities performed by the volunteer.
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
    
_The following are the measurements on the mean and standard deviation for each measurement._

* **tBodyAcc-mean()-X**
* **tBodyAcc-mean()-Y**
* **tBodyAcc-mean()-Z**
* **tBodyAcc-std()-X**
* **tBodyAcc-std()-Y**
* **tBodyAcc-std()-Z**
* **tGravityAcc-mean()-X**
* **tGravityAcc-mean()-Y**
* **tGravityAcc-mean()-Z**
* **tGravityAcc-std()-X**
* **tGravityAcc-std()-Y**
* **tGravityAcc-std()-Z**
* **tBodyAccJerk-mean()-X**
* **tBodyAccJerk-mean()-Y**
* **tBodyAccJerk-mean()-Z**
* **tBodyAccJerk-std()-X**
* **tBodyAccJerk-std()-Y**
* **tBodyAccJerk-std()-Z**
* **tBodyGyro-mean()-X**
* **tBodyGyro-mean()-Y**
* **tBodyGyro-mean()-Z**
* **tBodyGyro-std()-X**
* **tBodyGyro-std()-Y**
* **tBodyGyro-std()-Z**
* **tBodyGyroJerk-mean()-X**
* **tBodyGyroJerk-mean()-Y**
* **tBodyGyroJerk-mean()-Z**
* **tBodyGyroJerk-std()-X**
* **tBodyGyroJerk-std()-Y**
* **tBodyGyroJerk-std()-Z**
* **tBodyAccMag-mean()**
* **tBodyAccMag-std()**
* **tGravityAccMag-mean()**
* **tGravityAccMag-std()**
* **tBodyAccJerkMag-mean()**
* **tBodyAccJerkMag-std()**
* **tBodyGyroMag-mean()**
* **tBodyGyroMag-std()**
* **tBodyGyroJerkMag-mean()**
* **tBodyGyroJerkMag-std()**
* **fBodyAcc-mean()-X**
* **fBodyAcc-mean()-Y**
* **fBodyAcc-mean()-Z**
* **fBodyAcc-std()-X**
* **fBodyAcc-std()-Y**
* **fBodyAcc-std()-Z**
* **fBodyAcc-meanFreq()-X**
* **fBodyAcc-meanFreq()-Y**
* **fBodyAcc-meanFreq()-Z**
* **fBodyAccJerk-mean()-X**
* **fBodyAccJerk-mean()-Y**
* **fBodyAccJerk-mean()-Z**
* **fBodyAccJerk-std()-X**
* **fBodyAccJerk-std()-Y**
* **fBodyAccJerk-std()-Z**
* **fBodyAccJerk-meanFreq()-X**
* **fBodyAccJerk-meanFreq()-Y**
* **fBodyAccJerk-meanFreq()-Z**
* **fBodyGyro-mean()-X**
* **fBodyGyro-mean()-Y**
* **fBodyGyro-mean()-Z**
* **fBodyGyro-std()-X**
* **fBodyGyro-std()-Y**
* **fBodyGyro-std()-Z**
* **fBodyGyro-meanFreq()-X**
* **fBodyGyro-meanFreq()-Y**
* **fBodyGyro-meanFreq()-Z**
* **fBodyAccMag-mean()**
* **fBodyAccMag-std()**
* **fBodyAccMag-meanFreq()**
* **fBodyBodyAccJerkMag-mean()**
* **fBodyBodyAccJerkMag-std()**
* **fBodyBodyAccJerkMag-meanFreq()**
* **fBodyBodyGyroMag-mean()**
* **fBodyBodyGyroMag-std()**
* **fBodyBodyGyroMag-meanFreq()**
* **fBodyBodyGyroJerkMag-mean()**
* **fBodyBodyGyroJerkMag-std()**
* **fBodyBodyGyroJerkMag-meanFreq()**


[here]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
[full description]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
