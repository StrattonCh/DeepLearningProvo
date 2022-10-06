# install stuff
# had to do some crazy stuff on the path

# install.packages("remotes")
# remotes::install_github("rstudio/tensorflow")
# remotes::install_github("rstudio/keras")
# reticulate::install_miniconda()
# tensorflow::install_tensorflow()
# keras::install_keras()

# remotes::install_github("dpagendam/deepLearningRshort")
# install.packages(c("raster", "pbapply", "BiocManager"))
# BiocManager::install("EBImage")

# example
library(keras)
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y

# reshape
x_train <- array_reshape(x_train, c(nrow(x_train), 784))
x_test <- array_reshape(x_test, c(nrow(x_test), 784))
# rescale
x_train <- x_train / 255
x_test <- x_test / 255

y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

model <- keras_model_sequential() 
model %>% 
  layer_dense(units = 256, activation = 'relu', input_shape = c(784)) %>% 
  layer_dropout(rate = 0.4) %>% 
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dropout(rate = 0.3) %>%
  layer_dense(units = 10, activation = 'softmax')
summary(model)
