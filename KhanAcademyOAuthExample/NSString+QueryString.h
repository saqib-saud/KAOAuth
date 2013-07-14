//
//  NSString+QueryString.h
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/14/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QueryString)
- (NSDictionary *)dictionaryFromQueryString;
@end
