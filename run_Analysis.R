# Code to do the Getting Cleaning Data Assignment 4
# cleaning wearable data

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.


library(dplyr)


# Read in the different files from the data using read.table
x.train <- read.table("x_train.txt")
x.test <- read.table("x_test.txt")
y.test <- read.table("y_test.txt")
y.train <- read.table("y_train.txt")
subject.test <- read.table("subject_test.txt")
subject.train <- read.table("subject_train.txt")


#Combine the test and train files using cbind, adding them so
# final set will have the columns from below left to right

test.data <- cbind(subject.test, y.test, x.test)
train.data <- cbind(subject.train, y.train, x.train)


# Use rbind to comine the test and train data together
full.data <- rbind(test.data, train.data)

# Load the features.txt file to describe the column names
features <- read.table("features.txt")


# subset the indexes of the columns with mean or std from features
subset.a <- grep("mean|std", features[, 2])


# Add 2 to subset for the two columns I added, then make sure the first two columns
# with the activity / labels are included
subset.b <- c(1, 2, subset.a + 2)


# Extract the mean and std variables from the full data set
sub.data <- full.data[, subset.b]


#Read in the activity labels
activity.labels <- read.table("activity_labels.txt")

# I only want the labels in the second column of activity_labels.txt
activity.labels <- activity.labels[, 2]

#Change the number labels in my data to the matching text from activity.labels
sub.data[, 2] <- activity.labels[sub.data[,2]]


# Names the rows from the features.txt info
# Uses subset.a since we have the labels for our added columns first (Subject, Activity),
# then we add the activities after.
colnames(sub.data) <- c("Subject", "Activity", as.character(features[subset.a, 2]))


#Group the data by Subject and Activity, then calculate mean values for each
#column.  group.data is the final tidy data set requested.
group.data <- sub.data %>% group_by(Subject, Activity) %>% summarise_all(mean)


#Write final data set to a text file for upload
write.table(group.data, "Assign4_tidydata.txt", row.name=FALSE)

