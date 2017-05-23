//
//  DWButtion.m
//  比例适配
//
//  Created by 席亚坤 on 16/12/16.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "DWButtion.h"

@implementation DWButtion
- (instancetype)initWithFrame:(CGRect)frame Font:(CGFloat)font{
    if ([super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize: font];
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
