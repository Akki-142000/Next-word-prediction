# Next-word-prediction
Word prediction is an interesting concept that requires a computer to emulate the thinking aspect of the human brain to predict the next most suitable word while typing a sentence. It would reduce human effort and improve the sentence itself in terms of grammar, syntax and make it look more professional and concise. The words can be formal as well as informal depending on the context it's being used. It is observed that informal words prevail over the other due to its frequent occurrence.
The ability of predicting the next word based upon its adjacent words
is one of the fundamental task in natural language processing (NLP).
In NLP the major focus is on understanding and determining how the
interaction between human and a computer can be optimized. As
humans, we tend to use language based upon the situation we are
presented with. Selection of our next word depends upon a set of
previous words. The goal of this research is to replicate a similar
behaviour of human word selection into a natural language
processing model. Suggestions of new words that might be used are
generated based upon the previous set of words. To achieve this goal,
the N-Grams model is used. We assign probability to each word and
select the next word with highest probability values. This probability
values are generated based upon the sequence of previous words.
These sequences are known as N-Grams where N is the value which
may be a unigram, bigram, trigram, quad gram. An important aspect
which needs to be understood is the speed at which the words are
predicted. Since one of the popular application of text prediction is in
mobile communication, it is necessary that the load on the system as
well as the speed of prediction should be optimal. This requires some
trade-off between the accuracy of the predicted words and speed. To
achieve a modest speed, we limit the N-Gram model to quad grams
The data required for training and testing of the model are derived
from three sources which includes blogs, news and twitter tweets. The
combined size of the data is about 563 MB. The data consists of large
chunks of text and the language used is English. Around 2-3M words
were used and among them 10% data were used for training perpose.
Data is obtained from swiftkey.com/en.
There are three steps followed while developing next word prediction
application
 1) Cleaning the data sources 
2) Creating Corpus and training corpus to generate prediction tables by
applying N-gram model. In this step data sampling, data tokenization,
training of the corpus will be done. The training and testing data sets
are divided into 90:10 ratios
We use Kneser ney smoothning function for smoothing the training
data. Smoothing is required for removing the irregularities and
improving the accuracy of the model. Once smoothing is done NGrams are generated from the Training Data Set. 
3) Building and framing the user interface for the application using
shiny.
