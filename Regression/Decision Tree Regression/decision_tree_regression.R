#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Decision Tree Regression model
# install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~., data = dataset, control = rpart.control(minsplit = 1))

#Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizing the Decision Tree Regression model results (high resolution)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Support Vector Regression)') +
  xlab('Level') +
  ylab('Salary')