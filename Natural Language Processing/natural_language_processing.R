#Importing the dataset
dataset = read.delim('Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

#Cleaning the texts
library(NLP)
library(tm)
library(SnowballC)
corpus = VCorpus(VectorSource(dataset$Review))
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)

#Bag of Words model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999)
newDataset = as.data.frame(as.matrix(dtm))
newDataset$Liked = dataset$Liked

#Encoding the target feature as factor
newDataset$Liked = factor(newDataset$Liked, levels = c(0, 1))

#Spliting the dataset into training set and test set
library(caTools)
set.seed(123)
split = sample.split(newDataset$Liked, SplitRatio = 0.80)
training_set = subset(newDataset, split == TRUE)
test_set = subset(newDataset, split == FALSE)

#Random Forest Classification
library(randomForest)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)

#Predicting the test set results
y_pred = predict(classifier, newdata = test_set[-692])

#Making the confusion matrix
cm = table(test_set[, 692], y_pred)
