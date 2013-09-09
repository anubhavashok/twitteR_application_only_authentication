searchTwitter<-
function(q,n,lang,bearer)
{
	url<-"https://api.twitter.com/1.1/search/tweets.json?"
	url<-paste(url,"q=",q,"&count=",n,"&lang=en",sep="")
	
	curl.opts<-curlOptions(httpheader = c(  Authorization = paste("Bearer ",bearer,sep="")),
			verbose = TRUE
		)
	tweets<-fromJSON(getForm(uri=url,.opts=curl.opts,style="GET"))
	return (tweets)
}


