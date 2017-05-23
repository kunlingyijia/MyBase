//
//  MenuCell.m
//  京东下拉菜单
//
//  Created by 席亚坤 on 16/10/31.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.label.textColor = [UIColor redColor];
        self.Xuanze.textColor = [UIColor redColor];
    }else{
         self.label.textColor = [UIColor blackColor];
         self.Xuanze.textColor = [UIColor redColor];
    }
    // Configure the view for the selected state
}

@end
