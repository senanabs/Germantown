# This program develops a model to estimate the quarterly visitors to Germantown Metropark in Dayton Ohio.
# LOOCV method in R is used for analysis. 
# quarterly total attendance for the park for each year as the dependent variable
# quarterly attendance for each gate for each year as the independent variable.
# Separate models are implemented in the training process for each quarter and each gate totaling 24 different models


setwd("~/Desktop/Consulting/Project 3")

##Training process for each gate. 

library(caret)

germantown <- read.csv("germantown.csv", header=T)

train(Q1_Total ~ Q1, method="lm", data=subset(germantown, Gate=="Main Park"),trControl = 
        trainControl(method = "LOOCV"))
train(Q2_Total ~ Q2, method="lm", data=subset(germantown, Gate=="Main Park"),trControl = 
        trainControl(method = "LOOCV"))
train(Q3_Total ~ Q3, method="lm", data=subset(germantown, Gate=="Main Park"),trControl = 
        trainControl(method = "LOOCV"))
train(Q4_Total ~ Q4, method="lm", data=subset(germantown, Gate=="Main Park"),trControl = 
        trainControl(method = "LOOCV"))
train(Q1_Total ~ Q1, method="lm", data=subset(germantown, Gate=="Trail Center"),trControl = 
        trainControl(method = "LOOCV"))
train(Q2_Total ~ Q2, method="lm", data=subset(germantown, Gate=="Trail Center"),trControl = 
        trainControl(method = "LOOCV"))
train(Q3_Total ~ Q3, method="lm", data=subset(germantown, Gate=="Trail Center"),trControl = 
        trainControl(method = "LOOCV"))
train(Q4_Total ~ Q4, method="lm", data=subset(germantown, Gate=="Trail Center"),trControl = 
        trainControl(method = "LOOCV"))
train(Q1_Total ~ Q1, method="lm", data=subset(germantown, Gate=="Dam Parking"),trControl = 
        trainControl(method = "LOOCV"))
train(Q2_Total ~ Q2, method="lm", data=subset(germantown, Gate=="Dam Parking"),trControl = 
        trainControl(method = "LOOCV"))
train(Q3_Total ~ Q3, method="lm", data=subset(germantown, Gate=="Dam Parking"),trControl = 
        trainControl(method = "LOOCV"))
train(Q4_Total ~ Q4, method="lm", data=subset(germantown, Gate=="Dam Parking"),trControl = 
        trainControl(method = "LOOCV"))
train(Q1_Total ~ Q1, method="lm", data=subset(germantown, Gate=="Sled Hill"),trControl = 
        trainControl(method = "LOOCV"))
train(Q2_Total ~ Q2, method="lm", data=subset(germantown, Gate=="Sled Hill"),trControl = 
        trainControl(method = "LOOCV"))
train(Q3_Total ~ Q3, method="lm", data=subset(germantown, Gate=="Sled Hill"),trControl = 
        trainControl(method = "LOOCV"))
train(Q4_Total ~ Q4, method="lm", data=subset(germantown, Gate=="Sled Hill"),trControl = 
        trainControl(method = "LOOCV"))
train(Q1_Total ~ Q1, method="lm", data=subset(germantown, Gate=="NC Entrance"),trControl = 
        trainControl(method = "LOOCV"))
train(Q2_Total ~ Q2, method="lm", data=subset(germantown, Gate=="NC Entrance"),trControl = 
        trainControl(method = "LOOCV"))
train(Q3_Total ~ Q3, method="lm", data=subset(germantown, Gate=="NC Entrance"),trControl = 
        trainControl(method = "LOOCV"))
train(Q4_Total ~ Q4, method="lm", data=subset(germantown, Gate=="NC Entrance"),trControl = 
        trainControl(method = "LOOCV"))
train(Q1_Total ~ Q1, method="lm", data=subset(germantown, Gate=="Old Mill "),trControl = 
        trainControl(method = "LOOCV"))
train(Q2_Total ~ Q2, method="lm", data=subset(germantown, Gate=="Old Mill "),trControl = 
        trainControl(method = "LOOCV"))
train(Q3_Total ~ Q3, method="lm", data=subset(germantown, Gate=="Old Mill "),trControl = 
        trainControl(method = "LOOCV"))
train(Q4_Total ~ Q4, method="lm", data=subset(germantown, Gate=="Old Mill "),trControl = 
        trainControl(method = "LOOCV"))

#### Mean Absolute Error Plots ####

library(ggplot2)

germantown_plots <- read.csv("germantown_plots.csv", header=T)

ggplot(data=germantown_plots, aes(y=Mean_Absolute_Error, x=Gate, color=Gate, fill=Gate)) +
  geom_bar(stat="identity") + facet_wrap(~Quarter) +
  geom_abline(slope=0, intercept=0.1,  col = "red",lty=2) +
  theme(axis.title.x=element_blank(), 
        axis.text.x=element_blank(), 
        axis.ticks.x=element_blank()) +
  labs(y="Mean Absolute Error")

#### Regression Models for Main park

#### Main Park Q1

main_park_q1 <- lm(Q1_Total ~ Q1, data=subset(germantown, Gate=="Main Park"))
par(mfrow=c(2,2))
plot(main_park_q1)
summary(main_park_q1)

ggplot(data=subset(germantown, Gate=="Main Park"), aes(x=Q1, y=Q1_Total)) + 
  geom_point(cex=2.5) + geom_smooth(method='lm', se=F) + ggtitle("Main Park Q1") +
  xlab("Q1 Gate Count") + ylab("Q1 Park Count")

#### Main Park Q2

main_park_q2 <- lm(Q2_Total ~ Q2, data=subset(germantown, Gate=="Main Park"))
par(mfrow=c(2,2))
plot(main_park_q2)
summary(main_park_q2)

ggplot(data=subset(germantown, Gate=="Main Park"), aes(x=Q2, y=Q2_Total)) + 
  geom_point(cex=2.5) + geom_smooth(method='lm', se=F) + ggtitle("Main Park Q2") +
  xlab("Q2 Gate Count") + ylab("Q2 Park Count")

#### Main Park Q3

main_park_q3 <- lm(Q3_Total ~ Q3, data=subset(germantown, Gate=="Main Park"))
par(mfrow=c(2,2))
plot(main_park_q3)
summary(main_park_q3)

ggplot(data=subset(germantown, Gate=="Main Park"), aes(x=Q3, y=Q3_Total)) + 
  geom_point(cex=2.5) + geom_smooth(method='lm', se=F) + ggtitle("Main Park Q3") +
  xlab("Q3 Gate Count") + ylab("Q3 Park Count")

#### Main Park Q4

main_park_q4 <- lm(Q4_Total ~ Q4, data=subset(germantown, Gate=="Main Park"))
par(mfrow=c(2,2))
plot(main_park_q4)
summary(main_park_q4)

ggplot(data=subset(germantown, Gate=="Main Park"), aes(x=Q4, y=Q4_Total)) + 
  geom_point(cex=2.5) + geom_smooth(method='lm', se=F) + ggtitle("Main Park Q4") +
  xlab("Q4 Gate Count") + ylab("Q4 Park Count")

