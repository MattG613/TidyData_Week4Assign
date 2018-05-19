# TidyData_Week4Assign
Coursera John Hopkins Tidy Data Course Week 4 Group Assignment



This program in human activity data from wearable technology.  More information
on the data can be found in the top link below.  The data is from the bottom link.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The data has multiple "subjects", and six activities.  The original data was split
into two different sets, training and test data, but was recombined into one set in this code.

This script reads in the data, and outputs a tidy data summary of the mean values
for all involving mean or standard deviation, grouped by subject (1-30) and activity.


The code begins with reading in the different data files with read.table.
For both the test and train sets, there is the data (x_ .txt), then the activity,
(y_  .txt), then the subject information (subject_ .txt).

These tables are all combined into one data set using cbind and rbind.

Then, the actual names for each column in the data set are read
from features.txt.  A search is performed to find any variable involving
mean or standard deviation.

With the subset of variables with mean and std, the relevant data from the 
original data set is subsetted.

The data contains the activities as numeric code, so the numbers are converted
into text from the activity_labels.txt file provided, using subsets.

The relevant variable names from features.txt, along with Subject and Activity are used to name all of the 
columns in the subsetted set of data.  Even though it is subsetted the data is not yet "tidy" as requested, since we have multiple entries for activities for each subject.

The dplyr package is used to group the data by Subject, then Activity, and then
summarise_all is used to calculate the mean for each, and the final tidy data
of the means for variables involving mean and standard deviation is written to a 
text file as requested.
