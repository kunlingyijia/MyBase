//
//  TwoViewController.h
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/12/14.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *RedConstraintsHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *YellowConstraintHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewConstraintHeight;

@property (weak, nonatomic) IBOutlet UILabel *Onelable;
@property (weak, nonatomic) IBOutlet UILabel *TwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *ThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *FourLabel;
@property (weak, nonatomic) IBOutlet UIButton *OneBtn;
@property (weak, nonatomic) IBOutlet UITextField *OneTF;

@end
