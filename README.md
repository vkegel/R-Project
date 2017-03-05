# R-Project
Getting and Cleaning Data Project
The project consists of reading a verienty of Test and Train files for analysis of subject movement through defined activities. 
The Files are modified to be more accessible for analyis by:
- Combining test and train files
- retaining only Std and Mean based matrics
- providing proper column headings.
- avergaing the retained data buy subject and activity.

Specifically the function is as follows:
# 1 Merges the training and the test sets to create one data set.
# read the data sets and merge them.
# Read the test and training data sets and merge them 
# getwd  c:/users/vkege/Desktop/Coursera
# get similar files in the train directory

# combine the files
# create temp tables for the X and Y values. 
# add the column headers

# 2 Extracts only the measurements on the mean and standard deviation 
#   for each measurement by using the GREP functions and selecting only these columns


# 3 Uses descriptive activity names to name the activities in the data set
# combine the Y test and train data

# 4 Appropriately labels the data set with descriptive variable names.

# name the column activityID

# join the activity ID with the label
# combine the the three temp tables to create a final_table and write it to a file. 


# 5 From the data set in step 4, creates a second, independent tidy 
#    data set with the average of each variable for each activity and 
#    each subject.
# use the summarisea, group_by and chain commands to organize the data
# write the dataframe to a file. 
