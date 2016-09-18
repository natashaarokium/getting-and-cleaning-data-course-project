
##loading data into R studio

[Workspace loaded from ~/.RData]

> setwd("C:/Users/Denise/Downloads/cleaning data/UCI HAR Dataset")
  > list.files()
[1] "activity_labels.txt" "features.txt"        "features_info.txt"   "README.txt"         
[5] "test"                "train"              
 
## reading files   
  > filename <- ("C:/Users/Denise/Downloads/cleaning data/UCI HAR Dataset")
> features <- read.table(file.path(filename, "features.txt"))
> activities <- read.table(file.path(filename, "activity_labels.txt"))
> subtest <- read.table(file.path(filename, "test","subject_test.txt"))
 > testlabels <- read.table(file.path(filename,"test","Y_test.txt))
 > testset <- read.table(file.path(filename,"test","X_test.txt"))
 > trainset <- read.table(file.path(filename,"train","X_train.txt"))
   trainlabels <- read.table(file.path(filename,"train","Y_train.txt"))
 subtrain <- read.table(file.path(filename,"train","subject_train.txt"))
 
 ## creating names for columns
 

  colnames(subtrain) = "subjectId";
  colnames(trainset) = features[,2];
  colnames(trainlabels) = "activityId";
  colnames(testlabels) = "activityId";
  colnames(subtest) = "subjectId";
  colnames(testset) = features[,2];
  colnames(activities) = c('activityId', 'activitytype');
  
  ## merging the test and train datasets
  
 traindata <- cbind(trainset, trainlabels, subtrain)
 testdata <- cbind(testset, testlabels, subtest)
mergedata <- rbind(traindata, testdata)

## Listing mean and standard deviation for measuerments

 names <- colnames(mergedata)
mean_std <- (grepl("activityId", names)|grepl("subjectId", names)|grepl("mean.." , names)|grepl("std.." , names))

## subsetting the merged data

subsetmeanstd <- mergedata[ , mean_std == TRUE]

## discriptive activity names, for naming activities in the data set

activitynames <- merge(subsetmeanstd, activities, by = 'activityId', all.x = TRUE)
  
  # second data set of tidy data                                                                
                                                                    
 tidydataset <- aggregate(. ~subjectId + activityId, activitynames, mean)
 tidydataset <- tidydataset[order(tidydataset$subjectId, tidydataset$activityId), ]
 
 ##Tidy data set is written to text file
                                                                  
 write.table(tidydataset, "./tidydataset.txt", row.name = FALSE, sep='\t')
                                                                   
                                                                     

