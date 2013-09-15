#searchTwitter: function to query twitter search API to get n tweets regarding query term q
#input: q - query term, n - number of tweets to return, lang - language of tweets, bearer - bearer token
#output: R data structure with twitter data 

searchTwitter<-
function(q,n,lang,bearer)
{
	#Create query URL with params
	url<-"https://api.twitter.com/1.1/search/tweets.json?"
	url<-paste(url,"q=",q,"&count=",n,"&lang=en",sep="")
	#Set authorization header
	#Set verbose = TRUE for additional diagnostic information
	curl.opts<-curlOptions(httpheader = c(  Authorization = paste("Bearer ",bearer,sep=""))
			#verbose = TRUE
		)
	#Send GET request to twitter API
	tweets<-fromJSON(getForm(uri=url,.opts=curl.opts,style="GET"))
	return (tweets)
}

#userTimeline: function to query twitter search API to get n tweets from a particular user
#input: screen_name - user to query, n - number of tweets to return, bearer - bearer token
#output: R data structure with twitter data 

userTimeline<-
function(screen_name,n,bearer)
{	
	#Create query URL with params
	url<-"https://api.twitter.com/1.1/statuses/user_timeline.json?"
	url<-paste(url,"screen_name=",screen_name,"&count=",n,sep="")
	#Set authorization header
	#Set verbose = TRUE for additional diagnostic information
	curl.opts<-curlOptions(httpheader = c(  Authorization = paste("Bearer ",bearer,sep=""))
			#verbose = TRUE
		)
	#Send GET request to twitter API
	tweets<-fromJSON(getForm(uri=url,.opts=curl.opts,style="GET"))
	return (tweets)
}


