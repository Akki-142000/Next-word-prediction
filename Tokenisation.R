# Now create corpus of training sample, tokenise and stem it.

require(quanteda)
train <- Corpus(textfile("C:/Users/Cooper/Desktop/Next-Word-Prediction/Code/original/Train/*.txt"))

# Tokenise our corpus, removing puntuation, numbers,hyphens,twitter symbols like @#
tokens <- tokenize(x = toLower(train),
                   removePunct = TRUE,
                   removeTwitter = TRUE,
                   removeNumbers = TRUE,
                   removeHyphens = TRUE,
                   verbose = TRUE)
				   


# Removing bad words 				   
profane <- readLines("Profanity/google bad words.txt")

profanity <- tokenize(profane,
                      removePunct = TRUE,
                      removeSeparators = TRUE,
                      removeHyphens = TRUE,
                      simplify = TRUE)

save(profanity,file = "profanityTokens.Rdata") # save for later use
# load("profanityTokens.Rdata") # if not loaded

tokenNoProf <- removeFeatures(tokens,profanity) # remove profane words


stemTokens <- wordstem(tokenNoProf,language = "english")

# Create n-grams for n = 2,3
bigram <- ngrams(stemTokens,n = 2)
trigram <- ngrams(stemTokens,n = 3)

# Create frequency matrix for unigram, bigram and trigram
dfm1 <- dfm(stemTokens,toLower = FALSE) 
dfm2 <- dfm(bigram,toLower = FALSE)
dfm3 <- dfm(trigram,toLower = FALSE)


# Reducing file size.
dfmr1 <- trim(dfm1,2)
dfmr2 <- trim(dfm2,2)
dfmr3 <- trim(dfm3,2)

# save them before doing anything else!
save(dfmr1,dfmr2,dfmr3,file = "Reduced DFMs.Rdata")


