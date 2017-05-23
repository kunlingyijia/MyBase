//
//  PieMenuView.h
//  电信按钮
//
//  Created by 席亚坤 on 16/12/5.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
//位置模块
typedef enum : NSUInteger {
    Centre,//中
    Right, //右
    Bottom,//下
    Left,//左
    Top//上
}Place;

typedef void (^ChoosePie)(Place place);
@interface PieMenuView : UIView
///ChoosePie
@property (nonatomic, copy) ChoosePie  choosePie ;
-(void)ChoosePieMenuView:(ChoosePie)choosePie;
@end
