# load original data set, create a sample of training, validation and test sets.

## Load original data
twitter <- readLines("C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/en_US/en_US.twitter.txt")
blogs <- readLines("C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/en_US/en_US.blogs.txt")
news <- readLines("C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/en_US/en_US.news.txt")

## Clean data of non-ASCII characters
twitter <- iconv(twitter,to = "ASCII",sub = "")
blogs <- iconv(blogs,to = "ASCII",sub = "")
news <- iconv(news,to = "ASCII",sub = "")



#sample for training data

set.seed(123) #for reproducibility
sizeSample <- 0.1 #only taking 10% of the data.

ts <- sample(length(twitter),length(twitter)*sizeSample)
twitSample <- twitter[ts]

ns <- sample(length(news),length(news)*sizeSample)
newsSample <- news[ns]

bs <- sample(length(blogs),length(blogs)*sizeSample)
blSample <- blogs[bs]

# save training data
writeLines(twitSample,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Train/twitter.txt")
writeLines(newsSample,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Train/news.txt")
writeLines(blSample,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Train/blogs.txt")


# rest of the data to create samples for testing and validation

twitheldOut <- twitter[-ts]
newsHeldOut <- news[-ns]
blogsHeldOut <- blogs[-bs]


#sample for validation data

set.seed(1234)
l <- length(twitheldOut)
ts <- sample(l,l*sizeSample/2)
twitValidation <- twitheldOut[ts]

l <- length(newsHeldOut)
ns <- sample(l,l*sizeSample/2)
newsValidation <- newsHeldOut[ns]

l <- length(blogsHeldOut)
bs <- sample(l,l*sizeSample/2)
blogsValidation <- blogsHeldOut[bs]

# save validation data
writeLines(twitValidation,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Validation/twitter.txt")
writeLines(newsValidation,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Validation/news.txt")
writeLines(blogsValidation,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Validation/blogs.txt")


# Data Left = Original- training - validation
twitheldOut <- twitheldOut[-ts]
newsHeldOut <- newsHeldOut[-ns]
blogsHeldOut <- blogsHeldOut[-bs]


#---sample for testing data----#

# test data
set.seed(12345)
l <- length(twitheldOut)
ts <- sample(l,l*sizeSample/2)
twitTest <- twitheldOut[ts]

l <- length(newsHeldOut)
ns <- sample(l,l*sizeSample/2)
newsTest <- newsHeldOut[ns]

l <- length(blogsHeldOut)
bs <- sample(l,l*sizeSample/2)
blogsTest <- blogsHeldOut[bs]

# saving test
writeLines(twitTest,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Test/twitter.txt")
writeLines(newsTest,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Test/news.txt")
writeLines(blogsTest,"C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Test/blogs.txt")