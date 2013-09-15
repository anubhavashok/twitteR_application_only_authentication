twitteR_application_only_authentication
=======================================
Introduction:
The twitter side API offers 2 types of authentications.
1. regular authentication
2. application-only-authentication

The regular authentication method:
	1. uses OAuth 1.0 specs
	2. requires user to go to a website, get pin and enter it manually
	3. token reauthenticates everytime
	4. rate limit for basic search is 180* (far too low for application use)

Application-only-authentication on the other hand:
	1. uses OAuth 2.0 specs
	2. seamless automatic authorization (user only proves consKey, consSec)
	3. token never expires till invalidated
	4. rate limit for basic search raised to 450* (see link at the bottom for detailed breakdown)

Procedure
=======================================

        Authenticate
            |
            V
          Search
            |
            V
      Invalidate token

A more detailed overview of the functions can be found in the comments of the function files

*- rate limits vary for type of operation see: https://dev.twitter.com/docs/rate-limiting/1.1/limts
