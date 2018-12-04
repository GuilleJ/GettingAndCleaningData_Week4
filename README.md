---
title: "Excersise Explanation"
author: "GuilleJ"
date: "4 de diciembre de 2018"
output: html_document
---

## Code Explanation

1. Working directory set up and call to required libraries
2. CSV files reading and combining for both data sets: "train" and "test".
3. Reading of features.csv and recognition of colums related to "mean()" and "std()" features.
3. Reading of activity_labels.csv
4. Join of both test and train data sets into a unique data set.
5. Subseting from the complete data set (train+test) the required columns (acc. to point 3)
6. Assignment of Activity labels.
7. Calculation of mean by variables, while grouping by Activity and Subject

## Used variables
- test_values = Test values data set
- test_labels = Test labels data set
- test_subject = Test subject data set
- test_total = Complete "test" data set
- train_values = Train values data set
- train_labels = Train labels data set
- train_subject = Train subject data set
- train_total = Complete "Train" data set
- features = Complete "Features" data set
- activity_labels = Complete "Activity Labels" data set
- data_set = Complete data set (combining test and train dataset)
- data_set_3 = Labeled and subsetted data set (containing only features of interest)
- groupedData = Final data set with variable means by Activity and Subject


