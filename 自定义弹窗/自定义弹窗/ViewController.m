//
//  ViewController.m
//  自定义弹窗
//
//  Created by 席亚坤 on 17/1/12.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "CTPopViewSingle.h"

@interface ViewController ()
@property(strong,nonatomic)UIWindow *window;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)Action:(UIButton *)sender {
    [[CTPopViewSingle  shareManager]showPopMenuSelecteWithFrame:[UIScreen mainScreen].bounds.size.width item:@[@"创建群组",@"添加朋友",@"扫一扫"] action:^(NSInteger index) {
        NSLog(@"%ld",index);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
