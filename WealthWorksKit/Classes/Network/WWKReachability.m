//
//  WWKReachability.m
//  Pods
//
//  Created by JianLei on 16/8/17.
//
//

#import "WWKReachability.h"

static WWKReachability *_sharedInstance = nil;

@implementation WWKReachability

+ (instancetype)wwk_sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [self reachabilityForInternetConnection];
        [_sharedInstance startNotifier];
    });
    return _sharedInstance;
}

+ (BOOL)wwk_isReachable {
    return [[self wwk_sharedInstance] isReachable];
}

+ (NetworkStatus)wwk_currentStatus {
    return [[self wwk_sharedInstance] currentReachabilityStatus];
}

@end
