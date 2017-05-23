//
//  UIButton+Size.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/12/15.
//  Copyright © 2016年 席亚坤. All rights reserved.
//
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)

#import "UIButton+Size.h"

@implementation UIButton (Size)
+(void)ButtionSize10_5:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (UIButton*btn in set) {
        
        btn.titleLabel.font = [UIFont systemFontOfSize:(int)(10.5*SizeScale)];
        
    }
    NSLog(@"%d",(int)(10.5*SizeScale));

}
+(void)ButtionSize12:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (UIButton*btn in set) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(int)(12*SizeScale)];
        
    }
    NSLog(@"%d",(int)(12*SizeScale));

}
+(void)ButtionSize14:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (UIButton*btn in set) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(int)(14*SizeScale)];
        
    }
    NSLog(@"%d",(int)(14*SizeScale));

}
@end
