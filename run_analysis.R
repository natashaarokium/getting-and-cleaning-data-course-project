


[Workspace loaded from ~/.RData]

> setwd("C:/Users/Denise/Downloads/cleaning data/UCI HAR Dataset")
  > list.files()
[1] "activity_labels.txt" "features.txt"        "features_info.txt"   "README.txt"         
[5] "test"                "train"              
> 
  
  > filename <- ("C:/Users/Denise/Downloads/cleaning data/UCI HAR Dataset")
> features <- read.table(file.path(filename, "features.txt"))
> activities <- read.table(file.path(filename, "activity_labels.txt"))
> list.files()
[1] "activity_labels.txt" "features.txt"        "features_info.txt"   "README.txt"         
[5] "test"                "train"              
> list.files("test")
[1] "Inertial Signals" "subject_test.txt" "X_test.txt"       "y_test.txt"      
> subtest <- read.table(file.path(filename, "test", subject_test.txt"))
 subtest <- read.table(file.path(filename, ""
 > subtest <- read.table(file.path(filen
 > testlabels <- read.table(file.path(filename,"test","Y_test.txt))
 > testset <- read.table(file.path(filename,"test","X_test.txt"))
 > trainset <- read.table(file.path(filename,"train","X_train.txt"))
                                                                  
  trainlabels <- read.table(file.path(filename,"train","Y_train.txt"))
 subtrain <- read.table(file.path(filename,"train","subject_train.txt"))
 colnames(activities) = c('activityId', 'activiytype');
  colnames(subtrain) = "subjectId";
  colnames(trainset) = features[,2];
  colnames(trainlabels) = "activityId";
  colnames(testlabels) = "activityId";
  colnames(subtest) = "subjectId";
  colnames(testset) = features[,2];
  colnames(activities) = c('activityId', 'activitytype');
 traindata <- cbind(trainset, trainlabels, subtrain)
 testdata <- cbind(testset, testlabels, subtest)
mergedata <- rbind(traindata, testdata)
 names <- colnames(mergedata)
mean_std <- (grepl("activityId", names)|grepl("subjectId", names)|grepl("mean.." , names)|grepl("std.." , names))
subsetmeanstd <- mergedata[ , mean_std == TRUE]
activitynames <- merge(subsetmeanstd, activities, by = 'activityId', all.x = TRUE)
                                                                  
                                                                    
 tidy <- aggregate(. ~subjectId + activityId, activitynames, mean)
 tidy <- tidy[order(tidy$subjectId, tidy$activityId), ]
                                                                  
 write.table(tidy, "tidy.txt", row.name = FALSE)
                                                                   
                                                                     
> View(tidy)
