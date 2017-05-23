//
//  HeaderCarView.h
//  京东购物车
//
//  Created by 席亚坤 on 16/11/22.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PublicBtn;
@interface HeaderCarView : UITableViewHeaderFooterView
///选择but
@property (strong, nonatomic)  PublicBtn *oneBtn;
///店名
@property (strong, nonatomic)  PublicBtn *twoBtn;


@end
