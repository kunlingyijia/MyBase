//
//  SearchHistoryCellTwo.m
//  搜索
//
//  Created by 席亚坤 on 16/12/25.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "SearchHistoryCellTwo.h"

@implementation SearchHistoryCellTwo

- (void)awakeFromNib {
    [super awakeFromNib];
    _ClearBtn.layer.masksToBounds = YES;
    _ClearBtn.layer.cornerRadius =5;
    _ClearBtn.layer.borderWidth = 0.4;
    _ClearBtn.layer.borderColor = [UIColor grayColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
