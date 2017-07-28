//
//  PropareViewController.m
//  JPushTestDemo
//
//  Created by 武飞跃 on 16/4/6.
//  Copyright © 2016年 wufeiyue. All rights reserved.
//

#import "PropareViewController.h"

@interface PropareViewController ()

@end

@implementation PropareViewController

-(instancetype)initWithDictionary:(NSDictionary *)model{
    if (self = [super init]) {
        NSLog(@"推送界面收到model:%@",model);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title =@"我是推送界面";
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)gotoMessageView:(NSNotification *)notification{
    NSLog(@"刷新界面不跳转");
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
