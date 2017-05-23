//
//  ViewController.m
//  Bricklaying砌砖效果
//
//  Created by 席亚坤 on 16/12/28.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "BricklayingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*        添加自定义视图         */
    BricklayingView *bricklaying = [[BricklayingView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 200) andItems:@[@"熊出没",@"死神19",@"钢铁侠0",@"海上",@"最后",@"苍井空苍",@"假如爱有天意",@"好好先生",@"特种部队",@"生化危机",@"魔兽",@"熊出没",@"死神来了19",@"钢铁侠0",@"海上钢琴师",@"最后",@"苍井空",@"爱有天意",@"好好先生",@"特",@"生机",@"魔兽"] andItemClickBlock:^(NSInteger i) {
        
        NSLog(@"%ld",i);
        /*        相应点击事件 i为点击的索引值         */
    }];
    [self.view addSubview:bricklaying];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
