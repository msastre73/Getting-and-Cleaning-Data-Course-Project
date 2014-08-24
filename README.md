Getting-and-Cleaning-Data-Course-Project
========================================
In this file you will find the explanation step-bt-step of how all of the scripts work and how they are connected

---------------------------------------------
1) Loading files
-------
The first step is to load the files we will need to merge the training and the test sets to create one data set. These files are supposed to be in your R Working Directory (_see CodeBook.md_). The files we are interested in are those with the sufix

* **X_** which correspond to the sets.
* **Y_** which correspond to the activities labels (a numer from 1 to 6 for each activity).
* **subject_** which correspond to the volunteer (a number from 1 to 30).

We use **read.table()** to do this because those are .txt files

    train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
    train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
    train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
    test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
    test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
    test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

---------------------------------------------
2) Creates a single file for training information and for test information
----------
Now we have training and test information subsetted by sets, activities and subject. So in each case we put all together to leave one set for traininf information and one for test information.
We use **cbind()** to combine them by columns.

    trainData <- cbind(train_subjects, train_labels, train_set)
    testData <- cbind(test_subjects, test_labels, test_set)
---------------------------------------------
3) Merges both training and test information
----------
We merge both data frames in order to have all 30 volunteers in one single data frame.
We use **rbind()** to combine them by columns.

    Data <- rbind(testData, trainData)
--------------------------------------------
4) Labels all 563 variables
----------
To extracts only the measurements on the mean and standard deviation for each measurement it is useful to first label all variables in order to leave only "Subject", "Activity" and the requested mesurements.
To do this we need to load features information using **read.table()** and then using **colnames()** we label the columns of _Data_ (The first colum correspond to the Subjects, the second one to the Activities and the rest to the features)

    features <- read.table("UCI HAR Dataset/features.txt")
    colnames(Data) <- c("Subject", "Activity", as.character(features$V2))
    
--------------------------------------------
5) Filters data leaving only the measurements on the mean and standard deviation for each measurement
----------
With **grep()** we can test which features have the word "mean" or "std" and create a vector with these values (_features_interest_). Then we subset _Data_ leaving only the columns corresponding to "Subject", "Activity", and the features of interest.

    features_interest <- grep("mean|std", features$V2, value=T)
    Data_filtered <- Data[, c("Subject", "Activity", features_interest )]
--------------------------------------------
6) Uses descriptive activity names to name the activities in the data set
----------
To name activities we need to load activities information usin **read.table()** . Then we modify the column "Activity" of _Data_filtered_ turning it into a factor using **factor()** with leveles names corresponding to the information of the activities (we do this with the argument "labels").

    activity <- read.table("UCI HAR Dataset/activity_labels.txt")
    Data_filtered$Activity <- factor(Data_filtered$Activity, labels=activity$V2)
--------------------------------------------    
7) Creates a second, independent tidy data set with the average of each variable for each activity and each subject
----------
The best way to do this is with **dcast()**, a function that comes with the "reshape2" package. Once the package was installed and the library was loaded we should melt _Data_filtered_ (using **melt()**, another function of the same package) in order to use **dcast()**. We should do this because when we melt _Data_filtered_ we indicate which columns are "ids" and which are "measure.vars", also **dcast()** takes a "molten data frame" as its first argument. 

Finally, when we have the new data set we export it to a .txt file using **write.table()** (with "row.name=FALSE"). This .txt file is the output of the script.

    Data_melt <- melt(Data_filtered, id=c("Subject", "Activity"), measure.vars=features_interest)
    Data_means <- dcast(Data_melt, Subject + Activity ~ variable, mean)
    write.table(Data_means, file="Data_means.txt", row.name=FALSE)