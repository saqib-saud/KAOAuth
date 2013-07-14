//
//  TDOAuth+KAOAuth.h
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/14/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import "TDOAuth.h"

@interface TDOAuth (KAOAuth)

+ (NSURLRequest*) requestToken;
+ (NSURLRequest*) requestAccessTokenWithOAuthToken:(NSString*) oAuthToken oAuthTokenSecret:(NSString*)oAuthTokenSecret;
@end
