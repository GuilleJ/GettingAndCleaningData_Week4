# Setting the wd and opening the required libraries

setwd("C:/Users/Guille/Edx/DataScience/Course 3 - Getting and Cleaning Data/Week 4/UCI HAR Dataset")
library(tidyr)
library(dplyr)

#====================================================================================

# Reading the "test" files and combining them into "test_total"
test_values <- read.csv("./test/X_test.txt", header = FALSE, sep= "")

test_labels <-read.csv("./test/y_test.txt", header = FALSE)
test_subject <-read.csv("./test/subject_test.txt", header = FALSE)
test_total <-cbind(test_subject, test_labels, test_values)

#====================================================================================

# Reading the "train" files and combining them into "train_total"

train_values <- read.csv("./train/X_train.txt", header = FALSE, sep= "")

train_labels <-read.csv("./train/y_train.txt", header = FALSE)
train_subject <-read.csv("./train/subject_train.txt", header = FALSE)
train_total <-cbind(train_subject, train_labels, train_values)

#====================================================================================

# Reading the "features" file and getting those of interest (mean and std)

features<- read.csv("./features.txt", header = FALSE, sep=" ")
names(features) <- c("feature_id","featurename")
features_vector <- as.character(features$featurename)
features_mean<- grep("*mean()", features_vector)
features_std<- grep("*std()", features_vector)
colums_to_extract<-c(1,2,features_mean+2,features_std+2)

# Reading the "activity" file

activity_labels<- read.csv("./activity_labels.txt", header = FALSE, sep =" ")
names(activity_labels)<- c("id", "Activity")

#====================================================================================

# Combine test and train data sets and column's names assignment. Extraction
# of required columns from the whole data set (those related to mean() and std() )

data_set<-rbind(test_total, train_total)
names(data_set)<- c("Subject", "Activity", features_vector)
# data_set2 <- select(data_set, "Subject", "Activity", contains("mean()"), contains("std()"))


# Is not the smartest way to extract the mean() and std() columns
# but I had a lot problems using select()
data_set_2<-data_set[,colums_to_extract]

# Activity labeling
mergedData = merge (data_set_2, activity_labels, by.x = "Activity", by.y = "id")
data_set_3<-mergedData[,c(82,2:81)]

# Group and mean calculation by Subject and Activity
groupedData <- data_set_3%>%group_by(Activity.y, Subject)%>%summarise_all(mean)