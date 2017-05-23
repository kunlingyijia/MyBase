//
//  MenuHeader.h
//  京东下拉菜单
//
//  Created by 席亚坤 on 16/10/31.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuHeaderDelegate <NSObject>

//从左到右的Btn


@end

@interface MenuHeader : UIView
@property (weak, nonatomic) IBOutlet UIButton *BtnOne;
@property (weak, nonatomic) IBOutlet UIImageView *ImageViewOne;
@property (weak, nonatomic) IBOutlet UIButton *BtnTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;

@property (weak, nonatomic) IBOutlet UIButton *BtnThree;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;

@property (weak, nonatomic) IBOutlet UIButton *BtnFour;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFour;


@end
