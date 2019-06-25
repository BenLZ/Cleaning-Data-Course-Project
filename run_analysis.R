##loading ALL the data into R
trainingSubjects <- read.delim("subject_train.txt", header = FALSE, sep  = "")
trainingValues <- read.delim("X_train.txt", header = FALSE, sep = "")
trainingActivity <- read.delim("y_train.txt", header = FALSE, sep = "")
testSubjects <- read.delim("subject_test.txt", header = FALSE, sep = "")
testValues <- read.delim("x_test.txt", header = FALSE, sep = "")
testActivity <- read.delim("y_test.txt", header = FALSE, sep =)
featureNames <- read.delim("features.txt", header  = FALSE, sep = "")
activityNames <- read.delim("activity_labels.txt", header  = FALSE, sep = "")

##gives more descriptive column titles
colnames(activityNames) <- c("Activity_Number", "Activity_Name")

##combining all of the data into one table that keeps the training and testing data in its own rows.
totalData <- bind_rows(
  bind_cols(trainingSubjects, trainingActivity, trainingValues),
  bind_cols(testSubjects, testActivity, testValues)
)

##assigning the correct activity names to columns.
colnames(totalData) <- c("Subject_Number", "Activity_Name", as.character(featureNames[, 2]))

##runs through and takes the column name of only the measurements regarding mean and std
importantColumns <- grep("Subject_Number|Activity_Name|mean|std", colnames(totalData))

##condenses all the data into a table only containing the subject/activity number and columns with mean/std
totalData1 <- totalData[, importantColumns]

##changing the labels within the Activity_Name column to the given names of the activities (standing, walking, etc.)
totalData1$Activity_Name <- factor(totalData1$Activity_Name, levels = activityNames[, 1], labels = activityNames[, 2])

##makes a vector containing all the column names (to be cleaned up separate from the data table)
totalData1ColNames <- colnames(totalData1)

##all the modifications to give the columns more descriptive/clear names
totalData1ColNames <- gsub("-", "", totalData1ColNames)
totalData1ColNames <- gsub("()-", "", totalData1ColNames)
totalData1ColNames <- gsub("\\(\\)", "", totalData1ColNames)
totalData1ColNames <- gsub("^t", "timeDomain", totalData1ColNames)
totalData1ColNames <- gsub("^f", "frequencyDomain", totalData1ColNames)
totalData1ColNames <- gsub("Acc", "Accelerometer", totalData1ColNames)
totalData1ColNames <- gsub("std", "StandardDeviation", totalData1ColNames)
totalData1ColNames <- gsub("Gyro", "Gyroscope", totalData1ColNames)
totalData1ColNames <- gsub("Freq", "Frequency", totalData1ColNames)
totalData1ColNames <- gsub("mean", "Mean", totalData1ColNames)
totalData1ColNames <- gsub("Mag", "Magnitude", totalData1ColNames)
totalData1ColNames <- gsub("BodyBody", "Body", totalData1ColNames) ##weird duplication at end of list

##assigns the tidied column names to the data table
colnames(totalData1) <- totalData1ColNames

##makes the requested smaller data set with just the mean of each variable for each subject/activity
totalDataMeans <- totalData1 %>%
  group_by(Subject_Number, Activity_Name) %>%
  summarise_each(list(mean))

##creates a .txt file containing the data set with only the means
write.table(totalDataMeans, "CleanData.txt", row.names = FALSE, quote = FALSE)