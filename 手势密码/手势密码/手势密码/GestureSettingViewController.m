//
//  GestureSettingViewController.m
//  DWduifubao
//
//  Created by 席亚坤 on 16/11/26.
//  Copyright © 2016年 bianming. All rights reserved.
//
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#import "GestureSettingViewController.h"
#import "GestureSettingView.h"
#import "NIBHelper.h"
#import "AppDelegate.h"

@interface GestureSettingViewController ()
@property(nonatomic,strong)GestureSettingView * gestureView;


@end

@implementation GestureSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"设置手势密码";
     [self addGestureSettingViews
      ];
}
#pragma mark - 添加设置手势view
-(void)addGestureSettingViews{
    
    self.gestureView = [NIBHelper instanceFromNib:@"GestureSettingView"];
    _gestureView.frame = CGRectMake(0, 64, self.view.frame.size.width, Height-64);
    [self.view addSubview:_gestureView];
    
    __weak typeof(self) weakSelf = self;
    
    [_gestureView GestureReturnStr:^(NSString *password) {
        NSLog(@"%@",password);
       //设置成功--吊接口
        
        // 窗口隐藏：
        
        AppDelegate *myDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate ;
        //隐藏解锁窗口
        [myDelegate.LockWindow resignKeyWindow];
        myDelegate.LockWindow.hidden=NO;

        
    }];

    
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
