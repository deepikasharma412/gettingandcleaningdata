#Inputting Data into R 
library(plyr)
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#1 Merging Datasets 
variablex_data <- rbind(x_train, x_test)
variabley_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
features <- read.table("features.txt")

#2 Extracting Mean and Stdev 
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
variablex_data <- variablex_data[, mean_and_std_features]
names(variablex_data) <- features[mean_and_std_features, 2]

#3 Naming Activities in Dataset
activity <- read.table("activity_labels.txt")
variabley_data[, 1] <- activity[variabley_data[, 1], 2]

#4 Descriptive Variable Names 
names(variabley_data) <- "activity"
names(subject_data) <- "subject"

#5 Creating Independent Tidy Dataset with Variables 
all_data <- cbind(variablex_data, variabley_data, subject_data)
avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avg_data, "avg_data.txt", row.name=FALSE)
