//
//  ViewController.m
//  字体大小比例适配
//
//  Created by 席亚坤 on 17/2/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "PublicSize.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%f",SizeOne);
    NSLog(@"%f",SizeTwo);
    NSLog(@"%f",SizeThree);
    NSLog(@"%f",SizeFour);
//    OneLabel * oneLabel= [[OneLabel alloc]init];
//    oneLabel.frame = CGRectMake(30, 50, 200, 30);
//    oneLabel.text = @"我要好好学习";
    //[self.view addSubview:oneLabel];
    
    //_label.font = [UIFont systemFontOfSize:15.5];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    2017-02-28 21:14:53.560 字体大小比例适配[33992:1955661] 9.000000
//    2017-02-28 21:14:53.560 字体大小比例适配[33992:1955661] 10.500000
//    2017-02-28 21:14:53.560 字体大小比例适配[33992:1955661] 12.000000
//    2017-02-28 21:14:53.560 字体大小比例适配[33992:1955661] 13.500000
    
//    2017-02-28 21:15:54.827 字体大小比例适配[34126:1958326] 10.568662
//    2017-02-28 21:15:54.827 字体大小比例适配[34126:1958326] 12.330106
//    2017-02-28 21:15:54.827 字体大小比例适配[34126:1958326] 14.091549
   // 2017-02-28 21:15:54.828 字体大小比例适配[34126:1958326] 15.852993
}


@end
