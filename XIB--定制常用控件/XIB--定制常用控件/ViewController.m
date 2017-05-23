//
//  ViewController.m
//  XIB--定制常用控件
//
//  Created by 席亚坤 on 16/9/28.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "NIBHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NIBHelper instanceFromNib:@"UPImageViewDownLabel"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
