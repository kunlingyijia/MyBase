//
//  PercentageRoudView.m
//  百分比圆
//
//  Created by 席亚坤 on 16/12/1.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "PercentageRoudView.h"
#import "UIColor+CustomColor.h"
@implementation PercentageRoudView
//创建百分比圆的视图
/* View:圆要加在哪个View上
 Diameter:直径
 CircleWidth:圆的边框
 ColorArray:进度条的颜色数组
 PercentArray:比例的数组
 */

- (instancetype)initWithFrame:(CGRect)frame createPercentCircleWidth:(NSInteger)circleWidth ColorArray:(NSMutableArray *)colorArray PercentArray:(NSMutableArray *)percentArray percentText:(NSString*)Textstr

{    CGFloat W = frame.size.width;
     CGFloat H = frame.size.height;
     CGFloat   R ;
    circleWidth =  circleWidth !=0 ?circleWidth : 2.0;
     R= W>H ?H: W ;
    frame.size.width = R;
    frame.size.height = R;
    self = [super initWithFrame:frame];
    if (self) {
        
        float temp = 0;
        NSMutableArray *pathArray = [[NSMutableArray alloc] init];
        [pathArray addObject:[NSNumber numberWithFloat:temp]];
        for (int i = 0; i < percentArray.count; i++) {
            temp += [[percentArray objectAtIndex:i] floatValue];
            [pathArray addObject:[NSNumber numberWithFloat:temp]];
        }
        
        //设置圆形贝塞尔曲线
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, R, R)];
        //设置layer的动画效果
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        //设置动画持续时间
        pathAnimation.duration = 2.0;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        if ([[pathArray objectAtIndex:pathArray.count-1] floatValue] == 0) {
            //设置圆的样式
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.frame = CGRectMake(0, 0, R, R);
            //设置圆的填充颜色
            shapeLayer.fillColor = [UIColor clearColor].CGColor;
            //设置圆的边宽
            shapeLayer.lineWidth = circleWidth;
            //设置圆的边宽颜色
            shapeLayer.strokeColor = [UIColor colorWithHexString:@"dddddd"].CGColor;
            shapeLayer.strokeStart = 0;
            shapeLayer.strokeEnd = 1;
            //让贝塞尔曲线与CAShapeLayer产生联系
            shapeLayer.path = circlePath.CGPath;
            //设置动画效果
            [shapeLayer addAnimation:pathAnimation forKey:nil];
            //添加并显示
            [self.layer addSublayer:shapeLayer];
        }else {
            for (int i = 0; i < colorArray.count; i++) {
                //设置圆的样式
                CAShapeLayer *shapeLayer = [CAShapeLayer layer];
                shapeLayer.frame = CGRectMake(0, 0, R, R);
                //设置圆的填充颜色
                shapeLayer.fillColor = [UIColor clearColor].CGColor;
                //设置圆的边宽
                shapeLayer.lineWidth = circleWidth;
                //设置圆的边宽颜色
                shapeLayer.strokeColor = [UIColor colorWithHexString:[colorArray objectAtIndex:i]].CGColor;
                shapeLayer.strokeStart = [[pathArray objectAtIndex:i] floatValue];
                shapeLayer.strokeEnd = [[pathArray objectAtIndex:i+1] floatValue];
                //让贝塞尔曲线与CAShapeLayer产生联系
                shapeLayer.path = circlePath.CGPath;
                //设置动画效果
                
                [shapeLayer addAnimation:pathAnimation forKey:nil];
                //添加并显示
                [self.layer addSublayer:shapeLayer];
            }
        }

        //圆的视图逆时针旋转90度
        CGAffineTransform circleTransform = self.transform;
        self.transform = CGAffineTransformRotate(circleTransform, M_PI_2*-1);
        UILabel * textView = [[UILabel alloc]initWithFrame:CGRectMake(0, R/4, R, R/2)];
        textView.text = Textstr;
        textView.textAlignment =NSTextAlignmentCenter;
        [self addSubview:textView];
        //圆内的文本视图顺时针旋转90度
        CGAffineTransform textTransform = textView.transform;
        textView.transform = CGAffineTransformRotate(textTransform, M_PI_2*1);
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
