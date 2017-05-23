//
//  GoodListCell.h
//  CeShi
//
//  Created by 席亚坤 on 16/9/11.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *market_price;
@property (weak, nonatomic) IBOutlet UILabel *goods_name;
@property (weak, nonatomic) IBOutlet UIImageView *goods_thumb;

@end
