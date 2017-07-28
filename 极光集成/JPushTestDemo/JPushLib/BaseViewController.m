//
//  BaseViewController.m
//  JPushTestDemo
//
//  Created by 武飞跃 on 16/4/6.
//  Copyright © 2016年 wufeiyue. All rights reserved.
//

#import "BaseViewController.h"
#import "PropareViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoMessageView:) name:@"gotoMessageView"object:nil];
}

-(void)gotoMessageView:(NSNotification *)notification{
    NSDictionary * dic = notification.object ;
    
    if (!dic) {
        NSLog(@"推送的消息为空");
        return;
    }
    
    PropareViewController * propare = [[PropareViewController alloc]initWithDictionary:dic];
    [self.navigationController pushViewController:propare animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"gotoMessageView" object:nil];
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
