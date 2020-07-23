#Importing the dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]

#Using the dendrogram to find the optimal number of clusters
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distance')

#Training the hierarchical clustering model
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc= cutree(hc, 5)

#Visualizing the clusters
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Customers'),
         xlab = 'Annual Income (K$)',
         ylab = 'Spending Score (1-100)')