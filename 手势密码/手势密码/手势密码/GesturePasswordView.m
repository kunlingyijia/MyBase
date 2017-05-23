//
//  GesturePasswordView.m
//  DWduifubao
//
//  Created by 席亚坤 on 16/11/25.
//  Copyright © 2016年 bianming. All rights reserved.
//

#import "GesturePasswordView.h"
#import "JXGesturePasswordView.h"

@interface GesturePasswordView()<JXGesturePasswordViewDelegate>

@end

@implementation GesturePasswordView
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //self.gestureView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        self.backgroundColor = [UIColor colorWithHexString:kViewBackgroundColor];
        self.userInteractionEnabled = YES;
       
        JXGesturePasswordView *gesturePasswordView = [[JXGesturePasswordView alloc] init];
        gesturePasswordView.center = self.center;
        gesturePasswordView.backgroundColor = [UIColor clearColor ];
        gesturePasswordView.delegate = self;
        [self addSubview:gesturePasswordView];
        [gesturePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            if (iPhone5s) {
                make.top.equalTo(self).with.offset(170);
                make.size.mas_equalTo(CGSizeMake(250, 250));
            }else {
                make.top.equalTo(self).with.offset(200);
                make.size.mas_equalTo(CGSizeMake(280, 280));
            }
        }];

    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark - 忘记手势密码
- (IBAction)forgetPasswAction:(UIButton *)sender {
    self.gesturePassword();
}
-(void)GestureForgetPassword:(GestureForgetPassword)GesturePassword{
    self.gesturePassword = GesturePassword;
}
#pragma mark - 退出登录

- (IBAction)logOutAction:(UIButton *)sender {
    self.gestureLogut();
}
-(void)GestureLogOut:(GestureLogOut)GestureLogut{
    self.gestureLogut = GestureLogut;
}

///返回手势密码
-(void)GestureReturnStr:(Gesture)returnStr{
    self.gesture = returnStr;
}

- (void)gesturePasswordView:(JXGesturePasswordView *)gesturePasswordView didFinishDrawPassword:(NSString *)password{
    self.gesture(password);
}

@end
