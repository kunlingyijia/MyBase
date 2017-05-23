//
//  BricklayingCell.m
//  Bricklaying砌砖效果
//
//  Created by 席亚坤 on 16/12/28.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "BricklayingCell.h"

@implementation BricklayingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.layer.borderWidth = 0.3;
    self.contentView.layer.borderColor = [UIColor grayColor].CGColor;
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
}



@end
