//
//  NSLayoutConstraint+Size.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/12/14.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "NSLayoutConstraint+Size.h"
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)

@implementation NSLayoutConstraint (Size)
+(void)NSLayoutConstraint:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    
    for (id tempCon in set) {
        if ([tempCon isKindOfClass:[NSLayoutConstraint class]]) {
            NSLayoutConstraint * constraint = tempCon;
             constraint.constant = constraint.constant*SizeScale;
        }
       

    }
}

@end
