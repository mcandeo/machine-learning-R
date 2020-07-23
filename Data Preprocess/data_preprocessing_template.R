#Importing the dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]

#Spliting the dataset into training set and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)