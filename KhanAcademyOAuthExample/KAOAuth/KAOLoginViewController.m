//
//  KAOLoginViewController.m
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/14/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import "KAOLoginViewController.h"
#import "NSURL+QueryString.h"
#import "NSString+QueryString.h"
#import "AFNetworking.h"
#import "TDOAuth+KAOAuth.h"
@interface KAOLoginViewController ()
- (void) showWaiting;
- (void) hideWaiting;

@end

@implementation KAOLoginViewController
@synthesize webView =_webView;
@synthesize activityIndicator;
@synthesize accesstoken = _accesstoken;
@synthesize tokensecret = _tokensecret;
@synthesize delegate = _delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURLRequest *echo = [TDOAuth requestToken];
    [self.webView loadRequest:echo];
    [self showWaiting];
}

- (void) showWaiting;{
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidden=NO;
}
- (void) hideWaiting;{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden =YES;
}
- (IBAction)cancel:(id)sender;{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView;{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView;{
    NSLog(@"webViewDidFinishLoading URL:%@",[webView.request.URL description]);
    [self hideWaiting];
    if ([[webView.request.URL lastPathComponent] isEqualToString:@"default_callback"]) {
        NSDictionary * queryDictionary  =[webView.request.URL dictionaryFromQueryString];
        NSLog(@"queries:%@",queryDictionary);
        [self showWaiting];
        NSURLRequest *echo = [TDOAuth requestAccessTokenWithOAuthToken:[queryDictionary valueForKey:@"oauth_token"] oAuthTokenSecret:[queryDictionary valueForKey:@"oauth_token_secret"]];
    

        NSURLResponse * response = nil;
        NSError * error = nil;
        NSData * data = [NSURLConnection sendSynchronousRequest:echo returningResponse:&response error:&error];
        NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        queryDictionary = [myString dictionaryFromQueryString];
        [self.delegate oauthv1LoginDidFinishLogging:queryDictionary];
        [self dismissViewControllerAnimated:YES completion:nil];
       
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;{
    NSLog(@"didFailLoadWithError");
}

#pragma -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
