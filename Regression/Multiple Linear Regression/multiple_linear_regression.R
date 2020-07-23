#Importing the dataset
dataset = read.csv('50_Startups.csv')

#Encoding categorical data
dataset$State = factor(dataset$State,
              levels = c('New York', 'California', 'Florida'),
              labels = c(1, 2, 3))

#Spliting the dataset into training set and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Multiple Linear Regression model
regressor = lm(formula = Profit ~ ., data = training_set)
# summary(regressor)

#Predicting the test set results
y_pred = predict(regressor, newdata = test_set)


