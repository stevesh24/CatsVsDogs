# runs logistic regression on reduce_data

home <- "C:/Users/ibshi/Desktop/insight/project"
setwd(home)
numimages <- 1000

# assumes reduce_data already in the environment
# reduce_data <- read.csv("reduce_data.csv)

#first 1000 are cats (=0) second 1000 are dogs (=1)
y <- c(rep.int(0,1000),rep.int(1,1000))
data_log <- cbind(y,reduce_data)

trainnum <- 700
begx <- 1 + numimages; endx <- trainnum + numimages
train_matrix <- rbind(data_log[1:700,],data_log[begx:endx,])

begx <- 1 + trainnum; endx <- numimages
begx2 <- begx + numimages; endx2 <- endx + numimages
test_matrix <- rbind(data_log[begx:endx,],data_log[begx2:endx2,])

train <- data.frame(train_matrix)
test <- data.frame(test_matrix)

trainmodel <- glm(train$y ~ .,family=binomial(link='logit'),data=train)
fitted.results <- predict(trainmodel,newdata=test,type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)
misClasificError <- mean(fitted.results != test$y)
print(paste('Accuracy test',1-misClasificError))

# fitted.results <- predict(trainmodel,newdata=train,type='response')
# fitted.results <- ifelse(fitted.results > 0.5,1,0)
# misClasificError <- mean(fitted.results != train$y)
# print(paste('Accuracy train',1-misClasificError))

