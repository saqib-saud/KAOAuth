//
//  NSURL+QueryString.m
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/14/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import "NSURL+QueryString.h"
#import "NSString+QueryString.h"

@implementation NSURL (QueryString)
- (NSDictionary *)dictionaryFromQueryString
{
    return [[self query] dictionaryFromQueryString];
}


@end
