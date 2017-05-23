//
//  NSUserDefaultsManger.m
//  NSUserDefaults封装
//
//  Created by 席亚坤 on 16/10/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "NSUserDefaultsManger.h"

@implementation NSUserDefaultsManger
+(NSUserDefaultsManger*)shareNSUserDefaults {
    static NSUserDefaultsManger *manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[NSUserDefaultsManger alloc]init];
        
    });
    return manger;
}

+(void)userDefaultsetValue:(id)object forKey:(NSString *)key{
    
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}
+(id)userDefaultObjectForKey:(NSString*)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
@end
