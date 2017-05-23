//
//  ViewController.m
//  自定义导航条
//
//  Created by 席亚坤 on 16/11/22.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"hh";
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithTitle:@"商品" style:UIBarButtonItemStyleDone target:self action:@selector(shangpin)];
    item1.width = 100;
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithTitle:@"详情" style:UIBarButtonItemStyleDone target:self action:@selector(xiangqing)];
    UIBarButtonItem * item3 = [[UIBarButtonItem alloc]initWithTitle:@"详情" style:UIBarButtonItemStyleDone target:self action:@selector(Pinglun)];
    
    
    //self.navigationItem.leftBarButtonItems = @[item1,item2,item3];
    UIView  *titleView = [[UIView alloc]initWithFrame:CGRectMake(0,-10, [UIScreen mainScreen].bounds.size.width/2, 44)];
    UIButton *one = [UIButton buttonWithType:(UIButtonTypeCustom)];
    one.frame = CGRectMake(0, 0, titleView.frame.size.width/3, 42);
    [one setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [one setTitle:@"商品" forState:(UIControlStateNormal)];
    [titleView addSubview:one];
    [one addTarget:self action:@selector(one) forControlEvents:(UIControlEventTouchUpInside)];
    UIButton *two = [UIButton buttonWithType:(UIButtonTypeCustom)];
    two.frame = CGRectMake(CGRectGetMaxX(one.frame), 0, titleView.frame.size.width/3, 42);
    [two setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [two setTitle:@"详情" forState:(UIControlStateNormal)];
    [titleView addSubview:two];
    UIButton *three = [UIButton buttonWithType:(UIButtonTypeCustom)];
    three.frame = CGRectMake(CGRectGetMaxX(two.frame), 0, titleView.frame.size.width/3, 42);
    [three setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [three setTitle:@"评价" forState:(UIControlStateNormal)];
    [titleView addSubview:three];
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(one.frame), titleView.frame.size.width/3, 2)];
    redView.backgroundColor = [UIColor redColor];
    [titleView addSubview:redView];
   // titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView =titleView;
}
-(void)one{
    //Push 跳转
    RootViewController * VC = [[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
   // [self.navigationController setNavigationBarHidden:YES animated:YES] ;
    [self.navigationController  pushViewController:VC animated:YES];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
