#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Support Vector Regression model
# install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~., data = dataset, type = 'eps-regression') #RDF kernel by default

#Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizing the SVR results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Support Vector Regression)') +
  xlab('Position Level') +
  ylab('Salary')

#Visualizing the Regression model results (smooth curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Support Vector Regression)') +
  xlab('Level') +
  ylab('Salary')