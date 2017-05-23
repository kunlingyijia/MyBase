//
//  UILabel+Size.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/12/14.
//  Copyright © 2016年 席亚坤. All rights reserved.
//
#import "UILabel+Size.h"
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)
@implementation UILabel (Size)
+(void)LabelSize10_5:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (UILabel*label in set) {
        label.font = [UIFont systemFontOfSize:(int)(10.5*SizeScale)];
        NSLog(@"-----");
    }
//    for (UILabel*label in arr) {
//        label.font = [UIFont systemFontOfSize:(int)(10.5*SizeScale)];
//       
//    }
     NSLog(@"%d",(int)(10.5*SizeScale));
}
+(void)LabelSize12:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (UILabel*label in set) {        label.font = [UIFont systemFontOfSize:(int)(12*SizeScale)];
    }
   NSLog(@"%d",(int)(12*SizeScale));
}
+(void)LabelSize14:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (UILabel*label in set) {
        label.font = [UIFont systemFontOfSize:(int)(14*SizeScale)];
    }
    NSLog(@"%d",(int)(14*SizeScale));

}
+(void)LabelSize12ForView:(UIView*)view{
    for (id object in view.subviews) {
        
        if ([object isKindOfClass:[UILabel class]]) {
            UILabel * label = (UILabel*)object;
             label.font = [UIFont systemFontOfSize:(int)(11*SizeScale)];
        }
    }
}
@end
