# TidyData_Week4Assign
Coursera John Hopkins Tidy Data Course Week 4 Group Assignment


## Introduction
This program in human activity data from wearable technology.  More information
on the data can be found in the top link below.  The data is from the bottom link.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The data has multiple "subjects", with multiple entries for six different activities.  The original data from the link above was split into two different sets, training and test data.

This function reads in the data above, combines everything into one large data set, subsets the variables with mean and std, and outputs a tidy data summary of the mean values for each subject/activity.

The files from the zip file need to be extracted into the working directory for this
script to work.  The data itself was read in directly from those files.


## Import the files into a large data set

To make the large data set, the data was taken from x_test.txt and x_train.txt, the activity labels were taken from y_test.txt and y_train.txt (and then converted to the text values found in activity_labels.txt), and the subject information was taken from subject_test.txt and subject_train.txt text files.  The variables names of each column from x_test.txt and x_train.txt were taken from features.txt.  All of this was combined into one data frame.


## Data selection and manipulation

After this large data set was constructed, the data involving mean and standard
deviation were extracted as discussed. The names of all variables can be found in the web link above.  For this script, only the mean and standard deviation variables were used, and these are listed below:

 tBodyAcc-mean()-X               tBodyAcc-mean()-Y              
 tBodyAcc-mean()-Z               tBodyAcc-std()-X               
 tBodyAcc-std()-Y                tBodyAcc-std()-Z               
 tGravityAcc-mean()-X            tGravityAcc-mean()-Y           
 tGravityAcc-mean()-Z            tGravityAcc-std()-X            
 tGravityAcc-std()-Y             tGravityAcc-std()-Z            
 tBodyAccJerk-mean()-X           tBodyAccJerk-mean()-Y          
 tBodyAccJerk-mean()-Z           tBodyAccJerk-std()-X           
 tBodyAccJerk-std()-Y            tBodyAccJerk-std()-Z           
 tBodyGyro-mean()-X              tBodyGyro-mean()-Y             
 tBodyGyro-mean()-Z              tBodyGyro-std()-X              
 tBodyGyro-std()-Y               tBodyGyro-std()-Z              
 tBodyGyroJerk-mean()-X          tBodyGyroJerk-mean()-Y         
 tBodyGyroJerk-mean()-Z          tBodyGyroJerk-std()-X          
 tBodyGyroJerk-std()-Y           tBodyGyroJerk-std()-Z          
 tBodyAccMag-mean()              tBodyAccMag-std()              
 tGravityAccMag-mean()           tGravityAccMag-std()           
 tBodyAccJerkMag-mean()          tBodyAccJerkMag-std()          
 tBodyGyroMag-mean()             tBodyGyroMag-std()             
 tBodyGyroJerkMag-mean()         tBodyGyroJerkMag-std()         
 fBodyAcc-mean()-X               fBodyAcc-mean()-Y              
 fBodyAcc-mean()-Z               fBodyAcc-std()-X               
 fBodyAcc-std()-Y                fBodyAcc-std()-Z               
 fBodyAcc-meanFreq()-X           fBodyAcc-meanFreq()-Y          
 fBodyAcc-meanFreq()-Z           fBodyAccJerk-mean()-X          
 fBodyAccJerk-mean()-Y           fBodyAccJerk-mean()-Z          
 fBodyAccJerk-std()-X            fBodyAccJerk-std()-Y           
 fBodyAccJerk-std()-Z            fBodyAccJerk-meanFreq()-X      
 fBodyAccJerk-meanFreq()-Y       fBodyAccJerk-meanFreq()-Z      
 fBodyGyro-mean()-X              fBodyGyro-mean()-Y             
 fBodyGyro-mean()-Z              fBodyGyro-std()-X              
 fBodyGyro-std()-Y               fBodyGyro-std()-Z              
 fBodyGyro-meanFreq()-X          fBodyGyro-meanFreq()-Y         
 fBodyGyro-meanFreq()-Z          fBodyAccMag-mean()             
 fBodyAccMag-std()               fBodyAccMag-meanFreq()         
 fBodyBodyAccJerkMag-mean()      fBodyBodyAccJerkMag-std()      
 fBodyBodyAccJerkMag-meanFreq()  fBodyBodyGyroMag-mean()        
 fBodyBodyGyroMag-std()          fBodyBodyGyroMag-meanFreq()    
 fBodyBodyGyroJerkMag-mean()     fBodyBodyGyroJerkMag-std()     
 fBodyBodyGyroJerkMag-meanFreq()



After these variables were selected from the overall data set, the mean of each data point on the preceeding list was calculated for each subject / activity combination, using the group_by and summarise_all functions in dplyr.  This summary table was directly outputted to a text file called Assign4_tidydata.txt.



## Variable names, labels, information

features - 561 obs. of 2 variables
        names for the columns in the x_test and x_train text files
        
full.data - 10299 obs of 563 variables
        full data set combination from subject_test, subject_train, y_test, y_train, x_test, and x_train text files all combined.  For this program, it is test.data and train.data joined together with rbind.
        

group.data - 180 obs of 81 variables
        this is the data subsetted to the mean and std variables, after it has been grouped by Subject and Activity and the mean has been calculated for each Subject/Activity with summarise_all, i.e. the final tidy data set.
        

sub.data - 10299 obs of 81 variables
        is the data subsetted to the mean /std variables, but prior to the grouping and mean calculations.


subject.test - 2947 obs of 1 variable
        information read from the subject_test.txt file

subject.train - 7352 obs of 1 variable
        information read from the subject_train.txt file

test.data - 2947 obs of 563 variables
        all of the test data (subject.test + y.test + x.test added to each other left to right with cbind)


train.data - 7452 obs of 563 variables
        all of the train data (subject.train + y.train + x.train added to each other left to right with cbind)

x.test - 2947 obs of 561 variables
        information read from the x_test.txt file


x.train - 7352 of 561 variables
        information read from the x_train.txt file

y.test - 2947 obs of 1 variable
        information read from the y_test.txt file


y.train - 7352 obs of 1 variable
        information read from the y_train.txt file


activity.labels - factor with 6 levels
        from the activity_labels.txt file. Lists the 6 activities from the data as shown below.

WALKING            WALKING_UPSTAIRS   WALKING_DOWNSTAIRS SITTING           
STANDING           LAYING      


subset.a - 79 values
        integers indicating the columns to be subset from the full data to select the variables with mean or std.


subset.b - 81 values
        integers that indicate the same colums as subset.a, but also includes the first two columns of the data frame so that subject and activity are selected for the subsetted data set in sub.data
