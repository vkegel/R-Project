# 1 Merges the training and the test sets to create one data set.
# read the data sets and merge them.
# Read the test and training data sets and merge them 
# getwd  c:/users/vkege/Desktop/Coursera
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")

X_test = read.table("UCI HAR Dataset/test/X_test.txt")

Y_test = read.table("UCI HAR Dataset/test/Y_test.txt")

# get similar files in the train directory

subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")

X_train = read.table("UCI HAR Dataset/train/X_train.txt")

Y_train = read.table("UCI HAR Dataset/train/Y_train.txt")

features <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureId", "featureLabel"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityLabel"))

# combine the files
subject <- rbind(subject_test, subject_train)
names(subject) <- "subjectId"

X <- rbind(X_test, X_train)

Y<- rbind(Y_test, Y_train)

# add the column headers

names(X)<- as.character(features$featureLabel)


# 2 Extracts only the measurements on the mean and standard deviation 
#   for each measurement.

onlymeanstd <- grep("-mean|-std", features$featureLabel)
X <- X[, onlymeanstd]  # grab only columns with mean and std

# 3 Uses descriptive activity names to name the activities in the data set
# combine the Y test and train data

Y<- rbind(Y_test, Y_train)


# 4 Appropriately labels the data set with descriptive variable names.

names(Y) = "activityID"  ## name the column activityID

# join the activity ID with the label

activity <- merge(Y, activities, by="activityId")$activityLabel

Final_table <- cbind(subject, X, activity)  # combine to create final table

write.table(Final_table, "FinalData.txt", row.names=FALSE)

# 5 From the data set in step 4, creates a second, independent tidy 
#    data set with the average of each variable for each activity and 
#    each subject.
tidytable <-Final_table%>%group_by(subjectId,activity ) %>% summarise_each(funs(mean))

write.table(tidytable, "TidyData.txt", row.names=FALSE)




