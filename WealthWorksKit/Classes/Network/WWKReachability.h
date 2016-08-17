//
//  WWKReachability.h
//  Pods
//
//  Created by JianLei on 16/8/17.
//
//

#import <Reachability/Reachability.h>

@interface WWKReachability : Reachability

+ (BOOL)wwk_isReachable;
+ (NetworkStatus)wwk_currentStatus;

@end
