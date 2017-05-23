//
//  ViewController.m
//  用户引导页
//
//  Created by 席亚坤 on 16/9/13.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "UserGuideViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UserGuideViewController * use = [[UserGuideViewController alloc]initWithNibName:@"UserGuideViewController" bundle:nil];
    [self presentViewController:use animated:YES completion:nil ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
