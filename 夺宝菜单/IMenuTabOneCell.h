//
//  IMenuTabOneCell.h
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMenuTabOneCell : UITableViewCell
///HotHomeCellBlock
@property (nonatomic, copy) void(^IMenuTabOneCellBlock)(NSInteger tag,NSString * IsOpen,NSString * IsUp) ;
@property(nonatomic,strong)NSString *IsOpen;
//0 全灰 1 上灰下红 2 上红下灰
@property(nonatomic,strong)NSString *IsUp;
@property (nonatomic, assign) NSInteger count;

@property (weak, nonatomic) IBOutlet UIButton *OneBtn;
@property (weak, nonatomic) IBOutlet UIButton *TwoBtn;
@property (weak, nonatomic) IBOutlet UIButton *ThreeBtn;
@property (weak, nonatomic) IBOutlet UIButton *FourBtn;
@property (weak, nonatomic) IBOutlet UIButton *FiveBtn;


@end
