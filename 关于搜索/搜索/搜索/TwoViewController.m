//
//  TwoViewController.m
//  搜索
//
//  Created by 席亚坤 on 16/12/24.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第三层";
    
    //控制器通明的关键代码
    self.modalPresentationStyle =UIModalPresentationCustom;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)PopToRootVC:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
