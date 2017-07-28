//
//  AppDelegate.h
//  JPushTestDemo
//
//  Created by 武飞跃 on 16/4/6.
//  Copyright © 2016年 wufeiyue. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *appKey = @"9f1e8a9e3ab7681c9eaf63f9";  //AppKey  *必填
static NSString *channel = @"Publish channel"; //发布聚到 选填
static BOOL isProduction = FALSE;  //是否为生产环境

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

