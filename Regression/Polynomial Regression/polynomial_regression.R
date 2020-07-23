#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3]

#Polynomial Regression model
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ ., data = dataset)

#Visualizing the Polynomial Regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), colour = 'blue') +
  ggtitle('Truth of Bluff (Polynomial Regression)') +
  xlab('Position Level') +
  ylab('Salary')

#Predicting a new result
prediction = predict(poly_reg, data.frame(Level = 6.5,
                                          Level2 = 6.5^2, Level3 = 6.5^3, Level4 = 6.5^4))