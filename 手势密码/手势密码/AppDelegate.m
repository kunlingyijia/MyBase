//
//  AppDelegate.m
//  手势密码
//
//  Created by 席亚坤 on 16/12/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "GestureVerificationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window =[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    LoginViewController *LoginView = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    UINavigationController *navControl =[[UINavigationController alloc] initWithRootViewController:LoginView];
    self.window.rootViewController = navControl;
    
    GestureVerificationViewController *LockView = [[GestureVerificationViewController alloc] initWithNibName:@"GestureVerificationViewController" bundle:nil];
    self.LockWindow =[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.LockWindow.backgroundColor = [UIColor yellowColor];
    //设置高的优先级，保证窗口在最上方
    self.LockWindow.windowLevel = UIWindowLevelAlert + 2;
    self.LockWindow.rootViewController = LockView;
    //创建用于持久化存储数据的对象
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //判断程序是否是第一次加载
    NSNumber *havelanch = [userDefaults objectForKey:@"haveLanch"];
    if ([havelanch boolValue] == YES) {
        //显示主窗口
//        self.window.hidden = NO;
//        [self.window makeKeyAndVisible];
        self.LockWindow.hidden = NO;
        [self.LockWindow makeKeyAndVisible];
    } else {
        //将本次加载记录一下
        [userDefaults setValue:@(YES) forKey:@"haveLanch"];
        self.LockWindow.hidden = NO;
        [self.LockWindow makeKeyAndVisible];
    }
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
