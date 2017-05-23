//
//  GestureVerificationViewController.m
//  DWduifubao
//
//  Created by 席亚坤 on 16/11/28.
//  Copyright © 2016年 bianming. All rights reserved.
//
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#import "GestureVerificationViewController.h"
#import "GesturePasswordView.h"
#import "GestureSettingViewController.h"
#import "NIBHelper.h"
#import "AppDelegate.h"
@interface GestureVerificationViewController ()
@property(nonatomic,strong)GesturePasswordView * gestureView;
@end

@implementation GestureVerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title= @"验证手势密码";
    [self addgestureView];
}
#pragma mark -//添加手势密码锁
-(void)addgestureView{
    
    
    self.gestureView = [NIBHelper instanceFromNib:@"GesturePasswordView"];
    _gestureView.frame = CGRectMake(0, -30, self.view.frame.size.width, Height-30);
    _gestureView.gestureLabel.text = @"请输入原手势密码";
    _gestureView.logoutBtn.hidden = YES;
    [self.view addSubview:_gestureView];
    __weak typeof(self) weakSelf = self;
    [_gestureView GestureReturnStr:^(NSString *password) {
        NSLog(@"%@",password);
        
       // 窗口隐藏：
        
        AppDelegate *myDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
        //隐藏解锁窗口
        [myDelegate.LockWindow resignKeyWindow];
        myDelegate.LockWindow.hidden=YES;
        
        
    }];
    //忘记手势密码
    [_gestureView GestureForgetPassword:^() {
               
    }];
    //    //退出登录
    //    [_gestureView GestureLogOut:^() {
    //    [AuthenticationModel moveLoginToken];
    //    [AuthenticationModel moveLoginKey];
    //
    //
    //    }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _gestureView.gestureLabel.textColor= [UIColor blackColor];
    _gestureView.gestureLabel.text = @"请输入原手势密码";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
