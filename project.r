# Installing and Loading the required packages
install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

#Loading the text files
#text = readLines(file.choose()) #this is an interactive way of picking the text files

filepath = "C://Users//Kosi//Desktop//text_files//preventive.txt"
text = readLines(filepath)

docs = Corpus(VectorSource(text))

#For inspecting the content of the text file(optional)
#inspect(docs)

#Cleaning the text
toSpace = content_transformer(function(x,pattern)gsub(pattern, "",x))
docs = tm_map(docs,toSpace, "/")
docs = tm_map(docs, toSpace, "@")
docs = tm_map(docs, toSpace, "\\|")
docs = tm_map(docs, toSpace, "\\[")
docs = tm_map(docs, toSpace, "\\]")
docs = tm_map(docs, toSpace, "*")
docs = tm_map(docs, toSpace, "-")
docs = tm_map(docs, toSpace, "\\(")
docs = tm_map(docs, toSpace, "\\)")
docs = tm_map(docs, content_transformer(tolower))
docs = tm_map(docs, removeNumbers)
docs= tm_map(docs,removePunctuation)
docs = tm_map(docs, stemDocument)
docs = tm_map(docs, removeWords,stopwords("english"))
docs = tm_map(docs,removeWords,c("month","year","maintain","edu","routine","change",
                                 "time","analyze", "test", "semi","annual","fix","me",
                                  "request","order","illinois","contact","right","left",
                                 "transport","inspect","start","check","will","clean",
                                 "install","repair","replace","project","shop",
                                 "regular","please","you","thank","work","email","need",
                                 "prevent","correct","mainten","semiannu","please","pleas"))
docs = tm_map(docs,stripWhitespace)


#Building a term document matrix
dtm = TermDocumentMatrix(docs)
m = as.matrix(dtm)
v = sort(rowSums(m),decreasing = TRUE)
d = data.frame(word = names(v), freq=v)

#Generating the word cloud
set.seed(1234)
wordcloud(words = d$word,freq=d$freq,min.freq = 500,max.words=200,
          random.order=FALSE, rot.per=0.35, colors = brewer.pal(8,"Dark2"))

#Finding association for frequent words
findAssocs(dtm,terms="filter", corlimit=0.3)


#Creating a bar plot for 20 most frequent words
barplot(d[1:20,]$freq,las=2,names.arg=d[1:20,]$word,col="orange",
        main="20 Most frequent words",ylab="Word Frequencies",
        ylim = c(0,10000))


#Creating an annotated pie chart with % for 20 most frequent words
slices = d[1:20,]$freq 
lbls = d[1:20,]$word
pct = round(slices/sum(slices)*100)
lbls = paste(lbls, pct) # add percents to labels 
lbls = paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="20 most frequent words")





