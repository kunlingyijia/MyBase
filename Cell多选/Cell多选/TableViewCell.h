//
//  TableViewCell.h
//  Cell多选
//
//  Created by 席亚坤 on 17/3/26.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *ChooseBtn;
///model
@property (nonatomic, strong) Model   *model ;


@end
