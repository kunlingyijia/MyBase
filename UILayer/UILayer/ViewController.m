//
//  ViewController.m
//  UILayer
//
//  Created by 席亚坤 on 16/6/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "PaintCodeView.h"
@interface ViewController (){
    PaintCodeView *paintView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    paintView = [[PaintCodeView alloc]initWithFrame:self.view.frame];    [self.view addSubview:paintView];
    paintView.backgroundColor = [UIColor redColor];
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(73, 41, 100, 200)];
    [UIColor.grayColor setFill];
    [ovalPath fill];
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = ovalPath.CGPath;
    //设置持续时间
    animation.duration = 10;
    //设置次数
    animation.repeatCount =10;
    //添加到视图
    //[paintView.layer addAnimation:animation forKey:nil];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
