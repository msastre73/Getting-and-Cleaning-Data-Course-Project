## Loads files corresponding to the training
train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Loads files corresponding to the test
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Creates a single file for training information. The same for test information
trainData <- cbind(train_subjects, train_labels, train_set)
testData <- cbind(test_subjects, test_labels, test_set)

## Merge both training and test information
Data <- rbind(testData, trainData)

## To extracts only the measurements on the mean and standard deviation for each measurement
## it is useful to first label all variables in order to leave only "Subject", "Activity" 
## and the requested mesurements.

## Loads features information
features <- read.table("UCI HAR Dataset/features.txt")

## Labels all 563 variables
colnames(Data) <- c("Subject", "Activity", as.character(features$V2))

## With grep() we can test which features have the word "mean" or "std" and then filter Data
features_interest <- grep("mean|std", features$V2, value=T)
Data_filtered <- Data[, c("Subject", "Activity", features_interest )]

## Loads activities information & names activities using that information
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
Data_filtered$Activity <- factor(Data_filtered$Activity, labels=activity$V2)

## The best way to creates a second, independent tidy data set with the average of each variable
## for each activity and each subject is with dcast(), a function that comes with the reshape2
## package
install.packages("reshape2")
library(reshape2)

## Melts Data_filtered in order to indicate the "ids" and the measures vars of the data frame
Data_melt <- melt(Data_filtered, id=c("Subject", "Activity"), measure.vars=features_interest)

## Creates the new data frame using dcast() and write.table()
Data_means <- dcast(Data_melt, Subject + Activity ~ variable, mean)
write.table(Data_means, file="Data_means.txt", row.name=FALSE)
