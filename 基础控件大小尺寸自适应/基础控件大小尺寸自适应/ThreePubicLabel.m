//
//  ThreePubicLabel.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/11/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ThreePubicLabel.h"


#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)
@implementation ThreePubicLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:14*SizeScale];
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
