//
//  UIView+Size.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/12/14.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "UIView+Size.h"
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)
@implementation UIView (Size)
-(void)viewSize{
    CGRect  fame ;
    fame.origin.x =self.frame.origin.x;
    fame.origin.y =self.frame.origin.y;
    fame.size.height =     (int)(self.frame.size.height*3);
    fame.size.width = self.frame.size.width;
    self.frame = fame;
}

@end
