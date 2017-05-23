//
//  ViewController.m
//  NSUserDefaults封装
//
//  Created by 席亚坤 on 16/10/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "NSUserDefaultsManger.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NSUserDefaultsManger userDefaultsetValue:@"席亚坤" forKey:@"姓名"];
    NSLog(@"%@",[NSUserDefaultsManger userDefaultObjectForKey:@"姓名"]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
