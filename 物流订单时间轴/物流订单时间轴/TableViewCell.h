//
//  TableViewCell.h
//  物流订单时间轴
//
//  Created by 席亚坤 on 16/11/25.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *timeImageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
