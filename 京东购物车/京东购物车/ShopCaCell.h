//
//  ShopCaCell.h
//  京东购物车
//
//  Created by 席亚坤 on 16/11/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PublicBtn;
@class PublicTF;
@class CarModel;
@interface ShopCaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *AddAndDelView;
@property (weak, nonatomic) IBOutlet PublicTF *textTf;
@property (weak, nonatomic) IBOutlet PublicBtn *deleteBtn;
@property (weak, nonatomic) IBOutlet PublicBtn *addBtn;
@property (weak, nonatomic) IBOutlet PublicBtn *choseBtn;
-(void)cellGetData:(CarModel*)model;

@end
