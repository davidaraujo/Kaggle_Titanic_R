#setwd("C:/Users/dlaraujo/Documents/Kaggle Titanic")

titanicTrain <- read.csv("train.csv")

#class(titanicTrain)
#names(titanicTrain)

#[1] "PassengerId" "Survived"    "Pclass"      "Name"        "Sex"         "Age"        
#[7] "SibSp"       "Parch"       "Ticket"      "Fare"        "Cabin"       "Embarked"   

#titanicTrain[titanicTrain==""] <- NA
titanicTrain$Survived <- as.factor(titanicTrain$Survived)
titanicTrain$Pclass <- as.factor(titanicTrain$Pclass)
titanicTrain$Sex <- as.factor(titanicTrain$Sex)
titanicTrain$Age <- as.factor(titanicTrain$Age)
titanicTrain$SibSp <- as.factor(titanicTrain$SibSp)
titanicTrain$Parch <- as.factor(titanicTrain$Parch)
titanicTrain$Ticket <- as.factor(titanicTrain$Ticket)
titanicTrain$Fare <- as.factor(titanicTrain$Fare)
titanicTrain$Cabin <- as.factor(titanicTrain$Cabin)
titanicTrain$Embarked <- as.factor(titanicTrain$Embarked)

# summary of the dataset
#summary(titanicTrain$Survived)
#summary(titanicTrain$Sex)
#summary(titanicTrain$Embarked)
summary(titanicTrain)

# mean of age in the titanic
#mean(titanicTrain$Age)

# standard deviation
#sd(titanicTrain$Sex)

## Visualization ##   

#sets plotting parameters
par(mfrow=c(1,1), mar=c(6,8,4,2), las = 0)

# build the plot
# for Sex
#barplot(sort(table(titanicTrain$Sex), decreasing=TRUE), main="Sex Distribution",
#        ylab="Frequency")

# for Survivals
#barplot(sort(table(titanicTrain$Survived), decreasing=TRUE), main="Survivals Distribution",
#        ylab="Frequency")

# for Age TOP 10
#barplot(sort(table(titanicTrain$Age), decreasing=TRUE)[1:10], main="Age Distribution TOP 10",
 #       ylab="Frequency")

## SPLIT BY SEX ##
subsetsSex <- split(titanicTrain, titanicTrain$Sex, drop=TRUE)
trainFemale <- subsets[[1]]
trainMale <- subsets[[2]]

##  Set up plotting in two rows and three columns, plotting along rows first.
par( mfrow = c( 2, 2 ) )

barplot(sort(table(trainFemale$Survived), decreasing=TRUE), main="Female Survival Distribution", ylab="Frequency")
barplot(sort(table(trainMale$Survived), decreasing=TRUE), main="Male Survival Distribution", ylab="Frequency")

summary(trainFemale)


library(lattice)
barchart(Survived~Pclass,data=titanicTrain,groups=Pclass, 
         scales=list(x=list(rot=90,cex=0.8)))




