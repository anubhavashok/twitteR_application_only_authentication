# load libraries
#RCurl - enables GET/POST functionality to interact with twitter API
#	To install: install.packages("RCurl")
#rjson - enables conversion of raw twitter data to R data type
#	To install: install.packages("rjson")
library(RCurl)
library(rjson)

#oauth2_authentication: function to encode and send user details and obtain a bearer token
#input: consumer Key, consumer Secret - obtained at dev.twitter.com/apps
#output: bearer token in R data type
#NOTE: DO NOT SHARE BEARER TOKEN OR CONSUMER KEY/SECRET
oauth2_authentication<-function(consKey,consSec){
#encode consumer key and secret into base64("<consKey>:<consSec>")
cred_b64<-base64Encode(paste(consKey,":",consSec,sep=""))
#Set headers in curlOptions
#Set verbose = TRUE for diagnostic information
curl.opts<-curlOptions(httpheader = c(  Authorization = paste("Basic ",cred_b64,sep=""),
				"Content-Type"="application/x-www-form-urlencoded;charset=UTF-8")
			#verbose = TRUE
		)
#Send twitter API a POST request to obtain a bearer token
bearerToken<-fromJSON(postForm(uri="https://api.twitter.com/oauth2/token",
				grant_type="client_credentials",
				.opts=curl.opts, 
				style="POST"))	
return (bearerToken)
}

#oauth2_invalidate_token: function to invalidate bearer token in case information is compromised
#input: consumer Key, consumer Secret, bearer Token
#output: boolean value indicating if token invalidation was successful
oauth2_invalidate_token<-function(consKey,consSec, bearerToken){
#encode consumer key and secret into base64("<consKey>:<consSec>")
cred_b64<-base64Encode(paste(consKey,":",consSec,sep=""))
#Set headers in curlOptions
#Set verbose = TRUE for diagnostic information
curl.opts<-curlOptions(httpheader = c(  Authorization = paste("Basic ",cred_b64,sep=""))
			#verbose = TRUE
		)
#Send twitter API a POST request to invalidate bearerToken
bearerToken2<-fromJSON(postForm(uri="https://api.twitter.com/oauth2/invalidate_token",
				access_token=bearerToken,
				.opts=curl.opts, 
				style="POST"))	
#Check if correct value returned
if(bearerToken2==bearerToken) return (TRUE)
return (FALSE)
}
