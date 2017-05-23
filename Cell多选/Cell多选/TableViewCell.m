//
//  TableViewCell.m
//  Cell多选
//
//  Created by 席亚坤 on 17/3/26.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(Model *)model{
    _model = model;
    self.ChooseBtn.selected =model.selectedType;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
