#Importing the dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]

#Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] <- sum(kmeans(X, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of clients'), xlab = "Number of clusters", ylab = "WCSS")

#Training the K-Means model
set.seed(29)
kmeans = kmeans(X, centers = 5,  nstart = 10)

#Visualizing the clusters
library(cluster)
clusplot(X, kmeans$cluster, lines = 0, shade = TRUE, color = TRUE, labels = 2, plotchar = FALSE, span = TRUE,
         main = paste("Cluster of Clients"), xlab = "Annual Income (K$)", ylab = "Spending Score (1-100)")