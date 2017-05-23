//
//  NSUserDefaultsManger.h
//  NSUserDefaults封装
//
//  Created by 席亚坤 on 16/10/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaultsManger : NSObject
+(NSUserDefaultsManger*)shareNSUserDefaults  ;
/// userDefaultsetValue
+(void)userDefaultsetValue:(id)object forKey:(NSString *)key;
+(id)userDefaultObjectForKey:(NSString*)key;

@end
