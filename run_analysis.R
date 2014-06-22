run_analysis <- function() {
  ## This function performs the following steps:
  ## 1) Merges the training and the test sets to create one data set.
  ## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## 3) Uses descriptive activity names to name the activities in the data set
  ## 4) Appropriately labels the data set with descriptive variable names. 
  ## 5)Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  
  ## Read the test set data
  subtest <- read.table("subject_test.txt")
  xtest <- read.table("X_test.txt")
  ytest <- read.table("y_test.txt")

  ## Read the training set data
  subtrain <- read.table("subject_train.txt")
  xtrain <- read.table("X_train.txt")
  ytrain <- read.table("y_train.txt")

  ## Read the features file
  features <- read.table("features.txt")
  
  ## Merge the subject training and test set data
  combinedsub <- rbind(subtest, subtrain)
  colnames(combinedsub) <- "subject"

  ## Merge the feature vector training and test set data
  combinedx <- rbind(xtest, xtrain)
  colnames(combinedx) <- features$V2
  
  ## Extract only the columns with the mean and standard deviation for each measurement
  extract <- combinedx[, grep("mean\\(|std\\(", colnames(combinedx))]
  
  ## Merge the subject training and test set data
  combinedy <- rbind(ytest, ytrain)
  colnames(combinedy) <- "activity"

  ## Combine the subject, activity and extracted features into one data set
  combined <- cbind(combinedsub, combinedy)
  combined <- cbind(combined, extract)

  ## Name the activities with a descriptive name
  activityLabel <- read.table("activity_labels.txt")
  combined$activity <- as.factor(combined$activity)
  levels(combined$activity) <- activityLabel$V2
  
  ## Label the columns with descriptive variable names
  colnames(combined) <- tolower(colnames(combined))
  colnames(combined) <- gsub("^t", "time", colnames(combined))
  colnames(combined) <- gsub("^f", "frequency", colnames(combined))
  colnames(combined) <- gsub("bodybody", "body", colnames(combined))
  colnames(combined) <- gsub("acc", "acceleration", colnames(combined))
  colnames(combined) <- gsub("gyro", "gyroscopic", colnames(combined))
  colnames(combined) <- gsub("mag", "magnitude", colnames(combined))
  colnames(combined) <- gsub("\\-mean\\(\\)", "mean", colnames(combined))
  colnames(combined) <- gsub("\\-std\\(\\)", "stddev", colnames(combined))
  colnames(combined) <- gsub("\\-x", "xaxis", colnames(combined))
  colnames(combined) <- gsub("\\-y", "yaxis", colnames(combined))
  colnames(combined) <- gsub("\\-z", "zaxis", colnames(combined))

  ## Create tidy data set with the average of each variable for each combination
  ## of subject and activity
  combined$index <- paste(combined$subject, combined$activity, sep=":")
  tidy <- aggregate(combined[,3:68], list(id = combined$index), mean)
  write.table(tidy, "tidy.txt")
}
