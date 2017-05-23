//
//  UIColor+DWColor.h
//  BianMin
//
//  Created by z on 16/5/3.
//  Copyright © 2016年 bianming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DWColor)

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (NSString *)hexFromUIColor: (UIColor*) color;

@end
