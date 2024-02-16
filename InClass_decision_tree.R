rm(list = ls())

library(rpart)
library(rpart.plot)

iris # Dataset  

dim(iris)
str(iris)
head(iris)

s_iris <- sample(150,100)
s_iris
length(s_iris)

# Test & Train sets

iris_train <- iris[s_iris,]
iris_test <- iris[-s_iris,] 

dim(iris_test)
dim(iris_train)

dectionTreeModel <- rpart(Species~.,iris_train, method = "class")
rpart.plot(dectionTreeModel)

