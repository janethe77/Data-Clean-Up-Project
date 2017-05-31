setwd("/Users/jane/Desktop/Data-Clean-Up-Project")
dirty_data_1<- read.csv("dirty_data.csv",header=TRUE,strip.white = TRUE)
summary(dirty_data_1)
library(tidyr)
library(dplyr)
str(dirty_data_1)
#Replacing all special characters with a space
dirty_data_1$Street<-gsub('[^a-zA-Z0-9]',' ',dirty_data_1$Street)

#Replace trailing spaces
trim <- function( x ) {
  gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)
}
dirty_data_1$Street<-trim(dirty_data_1$Street)

#Remove Strange HTML Column
dirty_data_1<-dirty_data_1[,-5]

#Replace word in a text to correct misspellings
dirty_data_1$Street<-gsub("[sS]treet","Str.",dirty_data_1$Street)
dirty_data_1$Street.2<-gsub("[sS]treet","Str.",dirty_data_1$Street.2)
dirty_data_1$Street<-gsub("[rR][oa][ao]d","Road",dirty_data_1$Street)
dirty_data_1$Street.2<-gsub("[rR][oa][ao]d","Road",dirty_data_1$Street.2)

