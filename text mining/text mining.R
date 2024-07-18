
install.packages(c("tm" , "wordcloud" , "pdftools" ,"Snowba11c" )
)

library(tm)
# creating corpus
docs <- Corpus(DirSource("C:\\Users\\Shubham Kumar\\CODE\\R\\text mining"))
print(docs)
inspect(docs[[2]])


to_space <- content_transformer(function(x, pattern)
{ 
  return (gsub(pattern, " ", x))
}
)
# removing unwanted symbols
docs <- tm_map(docs, to_space, ":")
docs <- tm_map(docs, to_space, "-")
docs <- tm_map(docs, to_space, "'")
docs <- tm_map(docs, to_space, "’")
docs <- tm_map(docs, to_space, '"')
docs <- tm_map(docs, to_space, ";")
# removing punctuation
docs <- tm_map(docs, removePunctuation)
# transforming to lower case
docs <- tm_map(docs, content_transformer(tolower))
# removing numbers
docs <- tm_map(docs, removeNumbers)
# removing stop words
docs <- tm_map(docs, removeWords, stopwords())
# removing white spaces
docs <- tm_map(docs, stripWhitespace)
# inspecting
inspect(docs[[2]])



install.packages("SnowballC")
# saving stemmed docs to new_variable
library(SnowballC)
stem_docs <- tm_map(docs, stemDocument)
inspect(stem_docs[[2]])


dtm <- DocumentTermMatrix(docs)
inspect(dtm)

freq <- colSums(as.matrix(dtm))
length(freq)



ord <- order(freq, decreasing = TRUE)
# inspecting most frequently occurring terms
freq[head(ord)]




dtmr <- DocumentTermMatrix(docs,
                           control = list(wordLengths = c(2, 20),
                                          bounds = list(global = c (3, Inf))
                           )
)
inspect(dtmr)



freqr <- colSums(as.matrix(dtmr))




wf = data.frame(term = names(freqr), occurrences = freqr)
library(ggplot2)
histo <- ggplot(subset(wf, freqr > 5), aes(term, occurrences)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(histo)






install.packages("wordcloud")
library(wordcloud)
wordcloud(names(freqr), freqr, min.freq = 5, colors = brewer.pal(4, "Dark2"))








install.packages(c("tm" , "wordcloud" , "pdftools" ,"Snowba11c" ))
install.packages("pdftools" , dep = T)
library(SnowballC)
library(pdftools)
library(SnowballC)
library(wordcloud)



txt <- pdf(file.choose())




# important functions
#   
# stripWhitespace
# removePunctuation
# tolower
# remveNumbers



#-----------------------------------------------------------------------------------------


   
# First step for text mining is to create corpus, 
#which is the collection of text documents
# types of corpus - Vcorpus, Pcorpus
#VectorCorpus reader function which used to create source object 
#from existing vector


txt <- pdf(file.choose())
txt_corpus = Corpus(VectorSource(txt))   # tm
txt_corpus[3:6]
#use operation of list to view data
inspect(txt_corpus[[1]])
as.character(txt_corpus[1:2])
t=lapply(txt_corpus,as.character)
t

# data cleaning

#lower case
txt_corpus_clean = tm_map(txt_corpus,tolower)
lapply(txt_corpus[102],as.character)


#Remove numbers from content
txt_corpus_clean = tm_map(txt_corpus_clean,
                          removeNumbers)
lapply(txt_corpus_clean[102],as.character)

# remove punctuation

txt_corpus_clean = tm_map(txt_corpus_clean,
                          removePunctuation)
lapply(txt_corpus_clean[1:2],as.character)
lapply(txt_corpus[1:2],as.character)

#remove whitespace
txt_corpus_clean = tm_map(txt_corpus_clean,stripWhitespace)
lapply(txt_corpus_clean[1:2],as.character)

#remove stopwords
stopwords('en') #check stopwords for eng lang
txt_corpus_clean = tm_map(txt_corpus_clean,removeWords,stopwords())
lapply(txt_corpus_clean[1:2],as.character)

## stemming
wordStem(c("teach","teaches","teaching"))
txt_corpus_clean <- tm_map(txt_corpus_clean,stemDocument)
txt_corpus_clean <-tm_map(txt_corpus_clean,stripWhitespace)

#Final Step :-Data Preparation :- split text document to words
#tokenization is process to split the document into individual components
# it will be done using DTM

dtm = DocumentTermMatrix(txt_corpus_clean)
dtm =as.matrix(dtm)
View(dtm)
dtm=t(dtm)
occu = rowSums(dtm)
occu
no_occu = sort(occu,decreasing = T)
head(no_occu)

# Plot wordcloud
wordcloud(txt_corpus_clean,min.freq = 50,random.order = F)

install.packages("RColorBrewer")
library("RColorBrewer")                
wordcloud(txt_corpus_clean,min.freq = 50,random.order = F,
          color=brewer.pal(8,"Dark2"),rot.per = 0.60)


?wordcloud

)



