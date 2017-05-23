//
//  ViewController.m
//  搜索
//
//  Created by 席亚坤 on 17/5/4.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "SearchHistoryViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)BtnAction:(UIButton *)sender {
    //Push 跳转
    SearchHistoryViewController * VC = [[SearchHistoryViewController alloc]initWithNibName:@"SearchHistoryViewController" bundle:nil];
    [self.navigationController  pushViewController:VC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
