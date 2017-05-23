//
//  ViewController.m
//  CAShapeLayer
//
//  Created by 席亚坤 on 16/3/26.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    //创建出CAShapeLayer
//    self.shapeLayer = [CAShapeLayer layer];
//    self.shapeLayer.frame = CGRectMake(0, 0, 200, 200);//设置shapeLayer的尺寸和位置
//    //self.shapeLayer.position = self.view.center;
//    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
//    
//    //设置线条的宽度和颜色
//    self.shapeLayer.lineWidth = 5.0f;
//    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    
//    //创建出圆形贝塞尔曲线
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
//    
//    
//    //让贝塞尔曲线与CAShapeLayer产生联系
//    self.shapeLayer.path = circlePath.CGPath;
//    
//    //添加并显示
//    [self.view.layer addSublayer:self.shapeLayer];

    //view 是曲线的背景 view
    
    UIView *view = [[ UIView alloc ] initWithFrame : CGRectMake ( 10 , 0 , 300 , 300 )];
    
    view. backgroundColor = [ UIColor yellowColor ];
    
    [ self . view addSubview :view];
    
    // 第一、 UIBezierPath 绘制线段
    
    UIBezierPath *firstPath = [ UIBezierPath bezierPathWithOvalInRect : CGRectMake ( 0 , 0 , 5 , 5 )];
    
    CGPoint p1 = CGPointMake ( 0 , 0 );
    
    CGPoint p2 = CGPointMake ( 300 , 0 );
    
    [firstPath addLineToPoint :p1];
    
    [firstPath addLineToPoint :p2];
    [firstPath addLineToPoint:CGPointMake(0, 300)];
    [firstPath addLineToPoint:CGPointMake(0, 0)];
    
    UIBezierPath *lastPath = [ UIBezierPath bezierPathWithOvalInRect : CGRectMake ( 0 , 0 , 0 , 0 )];
    
    [firstPath appendPath :lastPath];
    
    
    // 第二、 UIBezierPath 和 CAShapeLayer 关联
    
    CAShapeLayer *lineLayer2 = [ CAShapeLayer layer ];
    
    lineLayer2. frame = CGRectMake ( 0 , 50 , 320 , 40 );
    
    lineLayer2. fillColor = [ UIColor yellowColor ]. CGColor ;
    
    lineLayer2. path = firstPath. CGPath ;
    
    lineLayer2. strokeColor = [ UIColor redColor ]. CGColor ;
    
    
    //第三，动画
    
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    
    ani. fromValue = @0 ;
    
    ani. toValue = @1 ;
    
    ani. duration = 5 ;
    
    [lineLayer2 addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
    
    [view. layer addSublayer :lineLayer2];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
