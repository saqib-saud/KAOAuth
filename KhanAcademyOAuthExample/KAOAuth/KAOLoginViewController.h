//
//  KAOLoginViewController.h
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/14/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OAuthv1LoginDelegate <NSObject>

- (void)oauthv1LoginDidFinishLogging:(NSDictionary *)oAuthDictionary;

@end

@interface KAOLoginViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, copy) NSString * accesstoken;
@property (nonatomic, copy) NSString * tokensecret;
@property (nonatomic, assign) id<OAuthv1LoginDelegate> delegate;
@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)cancel:(id)sender;

@end
