//
//  SSViewController.m
//  KhanAcademyOAuthExample
//
//  Created by Saqib Saud on 7/13/13.
//  Copyright (c) 2013 Saqib Saud. All rights reserved.
//

#import "SSViewController.h"
#import "KAOLoginViewController.h"



@interface SSViewController ()

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    


    
}

- (IBAction)login:(id)sender;{
    __strong KAOLoginViewController * loginVC = [KAOLoginViewController new];
    loginVC.delegate=self;
    [self presentViewController:loginVC animated:YES completion:nil];
//    [self.view addSubview:loginVC.view];
}
#pragma mark - OAuthDelegat
- (void)oauthv1LoginDidFinishLogging:(NSDictionary *)oAuthDictionary;
{
    NSLog(@"%@",oAuthDictionary);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
