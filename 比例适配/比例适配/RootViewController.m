//
//  RootViewController.m
//  比例适配
//
//  Created by 席亚坤 on 16/12/16.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *RootScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xx;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self. automaticallyAdjustsScrollViewInsets = NO;
    self.xx.constant = 64;
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
