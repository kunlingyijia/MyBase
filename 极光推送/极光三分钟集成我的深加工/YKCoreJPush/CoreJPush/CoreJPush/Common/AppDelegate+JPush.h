//
//  AppDelegate+JPush.h
//  CoreJPush
//
//  Created by 冯成林 on 15/9/17.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"
#import "CoreJPush.h"
#import <UserNotifications/UserNotifications.h>
// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
#import "JPUSHService.h"
#import <UIKit/UIKit.h>
// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用idfa功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>


#define JPushAppKey @"5a6a612f0afc228f2dce9fef"
#define JPushChannel @"AppStore"
#define JPushIsProduction NO
@interface AppDelegate (JPush)<JPUSHRegisterDelegate>
/** 注册JPush */
-(void)registerJPush:(NSDictionary *)launchOptions;
@end
