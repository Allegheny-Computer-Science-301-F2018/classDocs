# word cloud demo
# date: 28 Nov 2018
# ref: https://onepager.togaware.com/TextMiningO.pdf


# Required packages
library(tm)
#install.packages("wordcloud")
library(wordcloud)
# Locate and load the Corpus.

#set path to data
cname <- "/home/o/obonhamcarter/Desktop/data/wordCloud"


docs <- Corpus(DirSource(cname))
docs
summary(docs)
#inspect(docs[1])
# Transforms
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x)) #replace-all function
docs <- tm_map(docs, toSpace, "/|@|\\|")
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removeWords, c("own", "stop", "words"))
docs <- tm_map(docs, stripWhitespace)
toString <- content_transformer(function(x, from, to) gsub(from, to, x)) # 
docs <- tm_map(docs, toString, "specific transform", "ST") # if you have specifics to remove, add them here
docs <- tm_map(docs, toString, "other specific transform", "OST")
docs <- tm_map(docs, stemDocument)

# Document term matrix.
dtm <- DocumentTermMatrix(docs)
#inspect(dtm[1:5, 1000:1005])
dtm


# determine a subset of words to place into a word cloud

lowerbound <- 40 # freq of the words to place into the plot. Here upper upper 80 per cent

#findFreqTerms(dtm, lowfreq=100)
findFreqTerms(dtm, lowfreq=lowerbound) # determine words of similar frequencies, lower bound freq is 100

findAssocs(dtm, "data", corlimit=0.6) #determine words having same types of values (here, value = 0.6)
freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)
wf <- data.frame(word=names(freq), freq=freq)

library(ggplot2)

p <- ggplot(subset(wf, freq>500), aes(word, freq))
p <- p + geom_bar(stat="identity")
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))

# Generate a word cloud
library(wordcloud)
#wordcloud(names(freq), freq, min.freq=100, colors=brewer.pal(6, "Dark2"))
wordcloud(names(freq), freq, min.freq=lowerbound, colors=brewer.pal(6, "Dark2"))

