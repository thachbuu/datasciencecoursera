# Getting and Cleaning Data Course Project

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

File Description 
=================

File "GettingAndCleaningExercise.txt" contains mean, average of each variable for each activity and mean of each subject. Following are meaning of columns:

## ACTIVITY 
Activities in daily
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

## VARIABLES
1. "body_acc_x"  : the mean of "body_acc_x" for each activity
2. "body_acc_y"  : the mean of "body_acc_y" for each activity
3. "body_acc_z"  : the mean of "body_acc_z" for each activity
4. "body_gyro_x" : the mean of "body_gyro_x" for each activity
5. "body_gyro_y" : the mean of "body_gyro_y" for each activity
6. "body_gyro_z" : the mean of "body_gyro_z" for each activity
7. "total_acc_x" : the mean of "total_acc_x" for each activity
8. "total_acc_y" : the mean of "total_acc_y" for each activity
9. "total_acc_z" : the mean of "total_acc_z" for each activity
10. "averageSubject": the average of all variables for each activity
11. "activities" : description of each activity