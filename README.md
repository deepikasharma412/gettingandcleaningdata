# gettingandcleaningdata

## How the script works 
Each of the 5 steps are outlined in the code 

First off, we are simply getting the data into R

1. We are merging the training and test data and creating a singular data set using the rbind commmand
2. We are calculating the mean and standard deviation for each set of numbers 
3. We are naming the activities in the dataset (names command)
4. We also labeled "subject" (with the names command) 
5. We are creating a separate data set (a new txt.file using the write.table command) with the averages 
