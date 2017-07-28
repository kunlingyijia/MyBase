//
//  ViewController.m
//  JPushTestDemo
//
//  Created by 武飞跃 on 16/4/6.
//  Copyright © 2016年 wufeiyue. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
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
    FirstViewController * first = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:first animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
