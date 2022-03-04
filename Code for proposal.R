library(tidyverse)
library(dplyr)
library(tidymodels)
library(GGally)
#### Demonstrate that the dataset can be read from the web into R 
data <- read.csv("Desktop/Life_Expectancy_Data.csv")

#### Clean and wrangle your data into a tidy format
#### data features
count_missing <- sum(!complete.cases(data[-1])) #the number of rows that contain missing value
rows <- nrow(data) #total row number
#we eliminate data from India because the data of "infant death" in India does not make sense(they are over 1000)
data <- filter(data, Country != "India")
#select the predictors
data <- select(data, Life.expectancy, infant.deaths, Alcohol, BMI, Schooling, percentage.expenditure)
#have a glance at the feature of data
glimpse(data)


#delete the rows that contain missing values
data_new <- na.omit(data)
#get the feature of each variable
summary(data_new)

### Visualization
ggpairs(data_new)

#### training data -- this is for testing the accuracy of the model
#split 75% of data into training set, and 25% into test set
data_split <- initial_split(data_new, prop = 0.75, strata = NULL)
data_train <- training(data_split)
data_test <- testing(data_split)
