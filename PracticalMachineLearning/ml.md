Practical Machine Learning Course Project Write-up
========================================================
-*Nilesh Sawant*

## Executive Summary.

Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement - a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways.
Our goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways.


## Getting the dataset.

* Load the dataset in the R base package

```r
library(ElemStatLearn)
library(caret)
```

```
## Loading required package: lattice
## Loading required package: ggplot2
```

```r
library(rpart)
library(randomForest)
```

```
## randomForest 4.6-10
## Type rfNews() to see new features/changes/bug fixes.
```

```r
set.seed(357)
training <- read.csv("pml-training.csv", header = TRUE, na.strings = c("NA", 
    ""))
testing <- read.csv("pml-testing.csv", header = TRUE, na.strings = c("NA", ""))
```


## Data Modelling.

* Replace all the fields with currupted and null values to NA and the Zero division erros
* Remove the fields containing the metadata. Since these fields will reflect on the outcomes of our model. The fields are : the unlabled row index, user_name ,raw_timestamp_part_1 ,raw_timestamp_part_2 ,cvtd_timestamp ,new_window ,num_window.


```r
nsv <- nearZeroVar(training, saveMetrics = TRUE)
training <- training[, !nsv$nzv]
testing <- testing[, !nsv$nzv]
training_filter_na <- training[, (colSums(is.na(training)) == 0)]
testing_filter_na <- testing[, (colSums(is.na(testing)) == 0)]
training.Replace <- c("user_name", "raw_timestamp_part_1", "raw_timestamp_part_2", 
    "cvtd_timestamp", "num_window")
testing.Replace <- c("user_name", "raw_timestamp_part_1", "raw_timestamp_part_2", 
    "cvtd_timestamp", "num_window", "problem_id")
training.features <- training_filter_na[, !(names(training_filter_na) %in% training.Replace)]
testing.features <- testing_filter_na[, !(names(testing_filter_na) %in% testing.Replace)]
drops <- c("X")
training.features <- training.features[, !(names(training.features) %in% drops)]
dim(training.features)
```

```
## [1] 19622    53
```

```r
testing.features <- testing.features[, !(names(testing.features) %in% drops)]

dim(testing.features)
```

```
## [1] 20 52
```


## Cross Validation

Create the data partitions of training and validating data sets. 60% of the training data was allocated to the training set and the remainder for the validation set.


```r
in.train <- createDataPartition(training.features$classe, p = 0.6, list = FALSE)

train <- training.features[in.train, ]
test <- training.features[-in.train, ]
```

## Prediction

We use the Random forest model for prediction.


```r
model <- randomForest(classe ~ ., data = train)
print(model)
```

```
## 
## Call:
##  randomForest(formula = classe ~ ., data = train) 
##                Type of random forest: classification
##                      Number of trees: 500
## No. of variables tried at each split: 7
## 
##         OOB estimate of  error rate: 0.72%
## Confusion matrix:
##      A    B    C    D    E class.error
## A 3345    2    1    0    0   0.0008961
## B   12 2257   10    0    0   0.0096534
## C    0   19 2031    4    0   0.0111977
## D    0    0   27 1901    2   0.0150259
## E    0    0    1    7 2157   0.0036952
```


Not enough time. Could not format it further and complete it.

