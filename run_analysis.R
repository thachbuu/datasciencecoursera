# Merging data from train & test
x <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/train/X_train.txt", widths = 14),
           read.fwf("D:/Workspace R/UCI HAR Dataset/test/X_test.txt", widths = 14))
y <- rbind(read.fwf("D:/Workspace R/UCI HAR Dataset/train/y_train.txt", widths = 14),
           read.fwf("D:/Workspace R/UCI HAR Dataset/test/y_test.txt", widths = 14))

x$y = y[,]
rs <- x

# Calculating mean of each activity
meanAct1 <- mean(as.numeric(rs[rs$y == 1,]$V1))
meanAct2 <- mean(as.numeric(rs[rs$y == 2,]$V1))
meanAct3 <- mean(as.numeric(rs[rs$y == 3,]$V1))
meanAct4 <- mean(as.numeric(rs[rs$y == 4,]$V1))
meanAct5 <- mean(as.numeric(rs[rs$y == 5,]$V1))
meanAct6 <- mean(as.numeric(rs[rs$y == 6,]$V1))

# Calculating standard deivation of each activity
stdAct1 <- sd(as.numeric(rs[rs$y == 1,]$V1))
stdAct2 <- sd(as.numeric(rs[rs$y == 2,]$V1))
stdAct3 <- sd(as.numeric(rs[rs$y == 3,]$V1))
stdAct4 <- sd(as.numeric(rs[rs$y == 4,]$V1))
stdAct5 <- sd(as.numeric(rs[rs$y == 5,]$V1))
stdAct6 <- sd(as.numeric(rs[rs$y == 6,]$V1))

# create data frame
activity <- c(1,2,3,4,5,6)
mean <- c(meanAct1, meanAct2, meanAct3, meanAct4, meanAct5, meanAct6)
standardDeivation <- c(stdAct1, stdAct2, stdAct3, stdAct4, stdAct5, stdAct6)
rs1 <- data.frame(activity, mean, standardDeivation)

# add average of each subject 
rs2 <- rs1
rs2$Average <- c(mean(c(rs1[rs1$activity == 1,]$mean, rs1[rs1$activity == 1,]$standardDeivation)),
                 mean(c(rs1[rs1$activity == 2,]$mean, rs1[rs1$activity == 2,]$standardDeivation)),
                 mean(c(rs1[rs1$activity == 3,]$mean, rs1[rs1$activity == 3,]$standardDeivation)),
                 mean(c(rs1[rs1$activity == 4,]$mean, rs1[rs1$activity == 4,]$standardDeivation)),
                 mean(c(rs1[rs1$activity == 5,]$mean, rs1[rs1$activity == 5,]$standardDeivation)),
                 mean(c(rs1[rs1$activity == 6,]$mean, rs1[rs1$activity == 6,]$standardDeivation)))

# add a row to calculate mean of each variable
rs3 <- rbind(rs2, c("",mean(rs2$mean), mean(rs2$standardDeivation), mean(rs2$Average)))

# write to file the rs
write.table(rs3,"DataAndCleaning_CoursePRoject.txt", row.names = FALSE)