//
//  SubmitBtn.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/11/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "SubmitBtn.h"

#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)
@implementation SubmitBtn
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:14*SizeScale];
        [self setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.backgroundColor = [UIColor redColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5.0;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
