library(RCurl)
library(rjson)

oauth2_authentication<-function(consKey,consSec){
cred_b64<-base64Encode(paste(consKey,":",consSec,sep=""))
curl.opts<-curlOptions(httpheader = c(  Authorization = paste("Basic ",cred_b64,sep=""),
				"Content-Type"="application/x-www-form-urlencoded;charset=UTF-8")
			#verbose = TRUE
		)

bearerToken<-fromJSON(postForm(uri="https://api.twitter.com/oauth2/token",
				grant_type="client_credentials",
				.opts=curl.opts, 
				style="POST"))	
return (bearerToken)
}
