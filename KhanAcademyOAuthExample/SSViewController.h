//
//  SSViewController.h
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/13/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KAOLoginViewController.h"

@interface SSViewController : UIViewController <OAuthv1LoginDelegate>

- (IBAction)login:(id)sender;
@end
