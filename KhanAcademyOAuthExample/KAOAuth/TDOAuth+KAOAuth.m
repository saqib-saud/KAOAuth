//
//  TDOAuth+KAOAuth.m
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/14/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import "TDOAuth+KAOAuth.h"
#import "KAOConstants.h"

@implementation TDOAuth (KAOAuth)
+ (NSURLRequest*) requestToken;{
    return [TDOAuth URLRequestForPath:@"/api/auth/request_token"
                 GETParameters:nil
                        scheme:@"http"
                          host:@"www.khanacademy.org"
                   consumerKey:CONSUMER_KEY
                consumerSecret:CONSUMER_SECRET
                   accessToken:nil
                tokenSecret:nil];
}

+ (NSURLRequest*) requestAccessTokenWithOAuthToken:(NSString*) oAuthToken oAuthTokenSecret:(NSString*)oAuthTokenSecret {
    return [TDOAuth URLRequestForPath:@"/api/auth/access_token"
                        GETParameters:nil
                               scheme:@"http"
                                 host:@"www.khanacademy.org"
                          consumerKey:CONSUMER_KEY
                       consumerSecret:CONSUMER_SECRET
                          accessToken:oAuthToken
                          tokenSecret:oAuthTokenSecret];
}
@end
