//
//  GesturePasswordView.h
//  DWduifubao
//
//  Created by 席亚坤 on 16/11/25.
//  Copyright © 2016年 bianming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXGesturePasswordView;
typedef void(^Gesture)(NSString *password);
typedef void(^GestureForgetPassword)();
typedef void(^GestureLogOut)();
@interface GesturePasswordView : UIView
///Gesture
@property (nonatomic, copy) Gesture  gesture ;
@property (nonatomic, copy) GestureForgetPassword  gesturePassword ;
@property (nonatomic, copy) GestureLogOut  gestureLogut ;
///忘记
@property (weak, nonatomic) IBOutlet UIButton *forgetPsWordBtn;
///退出
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UILabel *gestureLabel;

///忘记手势密码
-(void)GestureForgetPassword:(GestureForgetPassword)GesturePassword;
///退出登录
-(void)GestureLogOut:(GestureLogOut)gestureLogut;

///返回手势密码
-(void)GestureReturnStr:(Gesture)returnStr;

@end
