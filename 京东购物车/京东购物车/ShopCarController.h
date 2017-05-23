//
//  ShopCarController.h
//  京东购物车
//
//  Created by 席亚坤 on 16/11/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCarController : UIViewController
///全选
@property (weak, nonatomic) IBOutlet UIButton *choseAllBtn;
///合计
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end
