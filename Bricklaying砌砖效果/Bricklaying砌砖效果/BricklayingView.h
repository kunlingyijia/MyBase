//
//  BricklayingView.h
//  Bricklaying砌砖效果
//
//  Created by 席亚坤 on 16/12/28.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^itemClickBlock)(NSInteger i);;

@interface BricklayingView : UIView

@property (copy, nonatomic) itemClickBlock itemClick;   //Item点击事件的回调block


//初始化方法
- (id)initWithFrame:(CGRect)frame
           andItems:(NSArray *)items
  andItemClickBlock:(itemClickBlock)click;



@end
/*******************************************
*
*
*
*自定义流布局的布局约束
*
*
*
********************************************/


@interface JHCustomFlow : UICollectionViewFlowLayout

@end



