//
//  PaintCodeView.m
//  UILayer
//
//  Created by 席亚坤 on 16/6/27.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "PaintCodeView.h"

@implementation PaintCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

-(void)addSubViews{
    
    self.one = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _one.frame = CGRectMake(self.bounds.size.width/2, self.bounds.size.height/2, self.bounds.size.width/2, self.bounds.size.height/2);
    _one.backgroundColor = [UIColor yellowColor];
    [self addSubview:_one];
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    //角度
    CGFloat radius = self.bounds.size.width * 0.5;
    
   
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0    endAngle:M_PI_2 clockwise:YES];
    
        [path addLineToPoint:center];
    
        // set:同时设置描边和填充颜色
        [[self randomColor] set];
        
        [path fill];
    CAShapeLayer * onelayer = [CAShapeLayer layer];
    onelayer.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height/2);
    onelayer.path = [path CGPath];
    
    _one.layer.mask = onelayer;
        
    [_one addTarget:self action:@selector(One:) forControlEvents:(UIControlEventTouchUpInside)];

    
}

-(void)One:(UIButton*)sender{
    NSLog(@"哈哈哈哈哈哈");
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //重绘
    [self setNeedsDisplay];
}

//- (void)drawRect:(CGRect)rect {
//    for (int i =0; i<5; i++) {
//        UIColor *color = [self randomColor];
//        [color set];  //设置线条颜色
//        
//        
//        UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
//                                                             radius:75
//                                                         startAngle:i*M_PI_2
//                                                           endAngle:M_PI_2*(i+1)
//                                                          clockwise:YES];
//        
//        aPath.lineWidth = 5.0;
//        aPath.lineCapStyle = kCGLineCapSquare;  //线条拐角
//        aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
//        
//        [aPath stroke];
//        
//        
//    }
//    
// // Drawing code
//NSArray *data = @[@20,@20,@20,@20,@20];
//
////圆心
//CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
////角度
//CGFloat radius = self.bounds.size.width * 0.5;
//CGFloat startA = 0;
//CGFloat endA = 0;
//CGFloat angle = 0;
//UIBezierPath * bez = nil;
//for (NSNumber *num in data) {
//    // 画一个扇形
//    startA = endA;
//    angle = [num intValue] / 100.0 * M_PI * 2;
//    endA = startA + angle;
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
//    
//    [path addLineToPoint:center];
//    
//    // set:同时设置描边和填充颜色
//    [[self randomColor] set];
//    
//    [path fill];
//    
//    
//}
//
//}

// 随机颜色
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
   }

@end
