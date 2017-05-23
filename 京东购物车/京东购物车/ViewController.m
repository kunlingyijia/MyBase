//
//  ViewController.m
//  京东购物车
//
//  Created by 席亚坤 on 16/11/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "ShopCarController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)shopCarAction:(UIButton *)sender {
    //Push 跳转
    ShopCarController * VC = [[ShopCarController alloc]initWithNibName:@"ShopCarController" bundle:nil];
    [self.navigationController  pushViewController:VC animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
