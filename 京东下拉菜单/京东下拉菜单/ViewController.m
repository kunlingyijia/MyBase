//
//  ViewController.m
//  京东下拉菜单
//
//  Created by 席亚坤 on 16/10/31.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "MeNuTableView.h"
#import "SubViewController.h"
#import "RotViewController.h"
@interface ViewController ()<MeNuTableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *arr = [@[@"综合",@"苹果",@"三星"]mutableCopy];
    MeNuTableView * meNuTableView = [[MeNuTableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)dataArray:arr];
    meNuTableView.Menudelegate = self;
    
    meNuTableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:meNuTableView];
}
#pragma mark - MeNuTableViewDelegate

///从左到右
-(void)oneBtnAction{
    
}
-(void)twoBtnAction{
    
}
///点击BtnTwo 箭头向下箭头遵从代理
-(void)threeBtnActionDown{
    
}
///点击BtnTwo 箭头向上箭头遵从代理
-(void)threeBtnActionUp{
    
}
//-(void)fourBtnAction;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)PushWebView:(UIButton *)sender {
   SubViewController  * webVC = [[SubViewController alloc]init];
    [self.navigationController pushViewController:webVC animated:YES];
    
}

- (IBAction)tiao:(id)sender {
    RotViewController * VC = [[RotViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
