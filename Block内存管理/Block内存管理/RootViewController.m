//
//  RootViewController.m
//  Block内存管理
//
//  Created by 席亚坤 on 16/12/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "RootViewController.h"
#import "BlockBtn.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BlockBtn * btn = [[BlockBtn alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"返回" forState:(UIControlStateNormal)];
    __weak typeof(self) weakSelf = self;
    btn.blockBtnAction = ^(BlockBtn *sender){
       int A = 30;
        NSLog(@"%d",A);
        [weakSelf XX];

        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        
    };
    [self.view addSubview:btn];
}
-(void)XX{
    self.view.backgroundColor = [UIColor redColor];
    
    
}
- (void)dealloc
{
    NSLog(@"我销毁了");
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
