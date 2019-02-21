control <- trainControl(method="repeatedcv", number=10, repeats=3)
set.seed(seed)
fit.treebag <- train(classe~., data=bebidas_train, method="treebag", metric="Accuracy", trControl=control)
set.seed(seed)
fit.rf <- train(classe~., data=bebidas_train, method="rf", metric=metric, trControl=control)
bagging_results <- resamples(list(treebag=fit.treebag, rf=fit.rf))
summary(bagging_results)
dotplot(bagging_results)