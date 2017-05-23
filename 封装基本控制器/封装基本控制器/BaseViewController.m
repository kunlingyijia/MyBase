//
//  BaseViewController.m
//  封装基本控制器
//
//  Created by 席亚坤 on 16/9/22.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>
#import "PrefixHeader.pch"
@interface BaseViewController (){
    MBProgressHUD *hudAlert;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        hudAlert = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:hudAlert];
        hudAlert.mode = MBProgressHUDModeText;
        hudAlert.margin = 20.f;
        //self.hudAlert.yOffset = -[self getTopLayoutGuideLength];
        hudAlert.userInteractionEnabled = NO;
       hudAlert.removeFromSuperViewOnHide = YES;
    
    hudAlert.labelText = @"你好!!!";
    [hudAlert show:YES];
    
    [hudAlert hide:YES afterDelay:2];
    //只显示文字
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"Some message...";
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:3];

    self.view.layer.masksToBounds = YES;
    self.view.layer.cornerRadius = 50.0;
    
    
    subView_Radius_Masks(self.view, 200.0)
    NSLog(@"%@",URL(@"nn"));
    
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
