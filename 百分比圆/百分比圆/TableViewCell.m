//
//  TableViewCell.m
//  百分比圆
//
//  Created by 席亚坤 on 16/12/30.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "TableViewCell.h"
#import "UIColor+CustomColor.h"
///蓝色
#define kBlueColor @"#6ad3ff"
///绿色
#define kGreenColor @"#1ad4af"
///橙色
#define kOrangeColor @"#f67c29"
///红色
#define kRedColor @"#f94431"
@implementation TableViewCell
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
         self. roudView = [[PercentageRoudView alloc]initWithFrame:CGRectMake(100, 100, 200, 50) createPercentCircleWidth:30 ColorArray:[@[kBlueColor,kGreenColor,kRedColor,kBlueColor,kGreenColor,kRedColor]mutableCopy] PercentArray:[@[@0.1,@0.2,@0.2,@0.3,@0.1,@0.1]mutableCopy]percentText:@"测试"];
        [self addSubview:_roudView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
