//
//  UIColor+CustomColor.h
//  YuemeiIOS
//
//  Created by 月美 刘 on 16/8/22.
//  Copyright © 2016年 月美 刘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CustomColor)

///自定义颜色
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (NSString *)hexFromUIColor: (UIColor*) color;

@end
