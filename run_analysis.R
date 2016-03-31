#1.Merges the training and the test sets to create one data set.
activity <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/y_test.txt", widths = 14),
           read.fwf("D:/Workspace R/UCI HAR Dataset/train/y_train.txt", widths = 14))

x <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/X_test.txt", widths = 14),
           read.fwf("D:/Workspace R/UCI HAR Dataset/train/X_train.txt", widths = 14))

body_acc_x <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", widths = 14), 
                    read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", widths = 14))

body_acc_y <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", widths = 14), 
                    read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", widths = 14))

body_acc_z <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", widths = 14), 
                    read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", widths = 14))

body_gyro_x <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", widths = 14), 
                     read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", widths = 14))

body_gyro_y <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", widths = 14), 
                     read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", widths = 14))


body_gyro_z <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", widths = 14), 
                     read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", widths = 14))

total_acc_x <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", widths = 14), 
                     read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", widths = 14))

total_acc_y <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", widths = 14), 
                     read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", widths = 14))

total_acc_z <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", widths = 14), 
                     read.fwf("D:/Workspace R/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", widths = 14))

dtColName <- c("activity", "x", 
               "body_acc_x", "body_acc_y", "body_acc_z", 
               "body_gyro_x", "body_gyro_y", "body_gyro_z", 
               "total_acc_x", "total_acc_y", "total_acc_z")

rs <- data.frame(activity,x,
                 body_acc_x, body_acc_y, body_acc_z, 
                 body_gyro_x, body_gyro_y, body_gyro_z, 
                 total_acc_x, total_acc_y, total_acc_z)

colnames(rs) <- dtColName


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanOfMeasurement <- colMeans(rs, TRUE)
sdOfMeasurement <- apply(rs, 2,FUN = sd)
rs <- rbind(rs, meanOfMeasurement)
rs <- rbind(rs, sdOfMeasurement)

#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names.

rs$activity[rs$activity == 1] <- "WALKING"
rs$activity[rs$activity == 2] <- "WALKING_UPSTAIRS"
rs$activity[rs$activity == 3] <- "WALKING_DOWNSTAIRS"
rs$activity[rs$activity == 4] <- "SITTING"
rs$activity[rs$activity == 5] <- "STANDING"
rs$activity[rs$activity == 6] <- "LAYING"

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
activities <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

walkingAvg <- colMeans((newRs[rs$activity == "WALKING",][,3:11]),na.rm = TRUE)
walkingUpstairAvg <- colMeans((rs[rs$activity == "WALKING_UPSTAIRS",][,3:11]),na.rm = TRUE)
walkingDownstairAvg <- colMeans((rs[rs$activity == "WALKING_DOWNSTAIRS",][,3:11]),na.rm = TRUE)
sittingAvg <- colMeans((rs[rs$activity == "SITTING",][,3:11]),na.rm = TRUE)
standingAvg <- colMeans((rs[rs$activity == "STANDING",][,3:11]),na.rm = TRUE)
layingAvg <- colMeans((rs[rs$activity == "LAYING",][,3:11]),na.rm = TRUE)
newRs <- rbind(walkingAvg, walkingUpstairAvg, walkingDownstairAvg, sittingAvg, standingAvg, layingAvg)
rsTbl <- data.frame(newRs, row.names = activities)
rsTbl$averageSubject <- rowMeans(rsTbl[,2:6])
rsTbl$activities <- activities
write.table(rsTbl,"D:/GettingAndCleaningExercise.txt", row.names = FALSE)

