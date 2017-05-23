//
//  ViewController.m
//  UIView-XIB
//
//  Created by 席亚坤 on 16/9/26.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "XIBView.h"
#import "NIBHelper.h"
#import "View.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XIBView *xib = [NIBHelper instanceFromNib:@"XIBView"];
    xib.frame = self.view.frame;
    [xib.btn setTitle:@"nihao" forState:(UIControlStateNormal)];
    [xib.btn addTarget:self action:@selector(xx) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:xib];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    View *xib1  = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:nil options:nil] firstObject];
    xib1.frame = CGRectMake(100, 100, 100, 100);
    xib1.backgroundColor = [UIColor yellowColor];
    [xib1.xibBtn addTarget:self action:@selector(headerHeight) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:xib1];
    
    
}
-(void)headerHeight{
    NSLog(@"xxxx");
    
    
}
-(void)xx{
    
    NSLog(@"你好");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
