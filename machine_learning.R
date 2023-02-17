data(iris)
library(tree)
library(h2O)

model.1 <- tree(Species ~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data = iris)

cv <- cv.tree(model.1, K = 10)


model.2 <- prune.tree(model.1, best = 3)

newdata<-data.frame(Sepal.Length=6,Sepal.Width=3,Petal.Length=2.75,Petal.Width=1)

val <- predict(model.2, type="class")
table(val, iris$Species)

truth <- predict(cv, type="class")
table(val, iris$Species)

co <- confusionMatrix(val, truth)

text(model.2, pretty=0)

