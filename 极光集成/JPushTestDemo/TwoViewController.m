//
//  TwoViewController.m
//  JPushTestDemo
//
//  Created by 武飞跃 on 16/4/6.
//  Copyright © 2016年 wufeiyue. All rights reserved.
//

#import "TwoViewController.h"
#import "PropareViewController.h"
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"我是Two";
    
    [self createBtn];
    
}
-(void)createBtn{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect btn_frame = CGRectMake(0, 0, 100,44);
    btn.frame =btn_frame;
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)handleBtnAction:(UIButton *)sender{
    
    //To  Do
    PropareViewController * propare = [[PropareViewController alloc]init];
    [self.navigationController pushViewController:propare animated:YES];

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
