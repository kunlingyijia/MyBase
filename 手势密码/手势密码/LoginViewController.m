//
//  LoginViewController.m
//  手势密码
//
//  Created by 席亚坤 on 16/12/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "LoginViewController.h"
#import "GestureSettingViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)ShezhiAction:(UIButton *)sender {
    //Push 跳转
GestureSettingViewController * VC = [[GestureSettingViewController alloc]initWithNibName:@"GestureSettingViewController" bundle:nil];
    [self.navigationController  pushViewController:VC animated:YES];

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
