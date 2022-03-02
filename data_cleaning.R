library(tidyverse)
library(dplyr)

#### Demonstrate that the dataset can be read from the web into R 
data <- read.csv("Desktop/Life_Expectancy_Data.csv")

#### data features
glimpse(data)
count_missing <- sum(!complete.cases(data[-1]))
rows <- nrow(data)

#### Clean and wrangle your data into a tidy format

#delete the rows that contain missing values
data_new <- na.omit(data)

