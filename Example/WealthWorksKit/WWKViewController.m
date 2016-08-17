//
//  WWKViewController.m
//  WealthWorksKit
//
//  Created by 张建磊 on 08/06/2016.
//  Copyright (c) 2016 张建磊. All rights reserved.
//

#import "WWKViewController.h"
#import "WWKTestNavigationDefine.h"

@interface WWKViewController ()

@end

@implementation WWKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testCommonService];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkNetworkStatus) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (IBAction)jumpToOtherController:(id)sender {
    WWKURLNavigatorAction *action = [WWKURLNavigatorAction actionWithURLPath:kWWKTestViewController];
    
    NSDictionary *params = @{@"param1" : @"123", @"param2" : @"abc"};
    [action applyQuery:params];
    
    [[WWKURLNavigator navigator] openURLAction:action];
}

- (void)testCommonService
{
    [WWKCommonService checkAppUpdateWithSuccess:^(NSURLSessionDataTask *task, WWKAppUpdateInfo *appUpdateInfo) {
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    }];
}

- (void)checkNetworkStatus {
    NSLog(@"%@", [WWKReachability wwk_isReachable] ? @"YES": @"NO");
}

@end
