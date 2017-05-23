//
//  GestureSettingView.h
//  DWduifubao
//
//  Created by 席亚坤 on 16/11/26.
//  Copyright © 2016年 bianming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXGesturePasswordView;
typedef void(^Gesture)(NSString *password);

@interface GestureSettingView : UIView
///Gesture
@property (nonatomic, copy) Gesture  gesture ;
@property (weak, nonatomic) IBOutlet UIImageView *oneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *twoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *threeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *fourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *fiveImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sixImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sevenimageView;
@property (weak, nonatomic) IBOutlet UIImageView *eightimageView;
@property (weak, nonatomic) IBOutlet UIImageView *nightimageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
///返回手势密码
-(void)GestureReturnStr:(Gesture)returnStr;

@end
