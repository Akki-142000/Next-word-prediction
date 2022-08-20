# Kneser-Ney smoothing implemention on n-grams

require(data.table)


load("n-grams DT Reduced.Rdata")
# loaded as ngram1,ngram2, ngram3

# discount as 0.75
d <- 0.75


nbgr <- nrow(ngram2[,.N,by = .(wo1,wo2)]) 
 # continuation count prob 
ckn <- ngram2[,.(Prob = ((.N) / nbgr)),by = wo2]
setnames(ckn,"wo2","word") 
setkey(ckn,word)

# calculating probability for each word in unigram
ngram1[,Prob:= ckn[w1,Prob]] 
ngram1 <- ngram1[!is.na(ngram1$Prob)]



# caculate N1+(wi.)
n1wi <- ngram2[,.(N = .N), by = wo1]
setnames(n1wi,"wo1","word")
setkey(n1wi,word)
# calculate Prob for each observation


# first calculate c(w1) from Unigram
ngram2[,Cn1:=ngram1[wo1,Count]]

# (c(w1w2)-d)/c(w1) + d/c(w1)N1+(w1.)*PknU(w2)

ngram2[,Prob := ((Count-d)/Cn1 + d/Cn1*n1wi[wo1,N]*ngram1[wo2,Prob])] 



# calculate c(w1,w2)
ngram3[,Cn2:=ngram2[.(wor1,wor2),Count]]

# N1+(w1w2.)
n1w12 <- ngram3[,.N, by= .(wor1,wor2)]
setnames(n1w12,c("wor1","wor2"),c("word1","word2"))
setkey(n1w12,word1,word2)

# Calculate probability
# (c(w1w2w3)-d)/c(w1w2) + d/c(w1w2)*N1+(w1w2.)*PknB(w3|w2)
ngram3[,Prob:= (Count-d)/Cn2 +d/Cn2*n1w12[.(wor1,wor2),N]*ngram2[.(wor1,wor2),Prob]]

save(ngram1,ngram2,ngram3,file = "n-grams with Prob (Cnt greather than 1).Rdata")

unigram <- ngram1[order(-Prob)][1:50] 

save(unigram,ngram2,ngram3, file = "ngrams.Rdata")
