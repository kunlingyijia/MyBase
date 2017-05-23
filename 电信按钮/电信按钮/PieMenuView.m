//
//  PieMenuView.m
//  电信按钮
//
//  Created by 席亚坤 on 16/12/5.
//  Copyright © 2016年 席亚坤. All rights reserved.
//
#import "PieMenuView.h"
#define PI 3.14159265358979323846
@interface PieMenuView (){
    CGFloat W;
    CGFloat H;
    CGFloat R;
    UIImageView *bottomImage;
    UIImageView *topImage;
    NSInteger index;
}
@end
@implementation PieMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    W = frame.size.width<frame.size.height ? frame.size.width:frame.size.height;
    H = W;
    R = W/2;
    frame.size.width =W;
    frame.size.height = H;
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = R;
        self.layer.backgroundColor= [UIColor whiteColor].CGColor;
        bottomImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, W, W)];
        
        bottomImage.backgroundColor = [UIColor grayColor];
        bottomImage.image = [UIImage imageNamed:@"左"];
        [self addSubview:bottomImage];
        topImage = [[UIImageView alloc]initWithFrame:CGRectMake(W/4, W/4, W/2, W/2)];
        topImage.backgroundColor = [UIColor clearColor];
        topImage.layer.masksToBounds = YES;
        topImage.layer.cornerRadius = W/4;
        topImage.image = [UIImage imageNamed:@"红心"];
        [self addSubview:topImage];
        index = 3;
        //圆的视图逆时针旋转90度
//        CGAffineTransform circleTransform = topImage.transform;
//        topImage.transform = CGAffineTransformRotate(circleTransform, M_PI_2*2);
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   // CGContextRef contextOne = UIGraphicsGetCurrentContext();
    /*画扇形和椭圆*/
    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
    /*---------第一个--------------*/
//   UIColor* OneColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
//    CGContextSetFillColorWithColor(contextOne, OneColor.CGColor);//填充颜色
//    //以10为半径围绕圆心画指定角度扇形
//    CGContextMoveToPoint(contextOne, W/2, W/2);
//    CGContextAddArc(contextOne, W/2, W/2, R,  -M_PI_4, M_PI_4, 0);
//    CGContextClosePath(contextOne);
//    CGContextDrawPath(contextOne, kCGPathFillStroke); //绘制路径
//    /*---------第二个--------------*/
//    CGContextRef contextTwo = UIGraphicsGetCurrentContext();
//
//    UIColor* TwoColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
//    CGContextSetFillColorWithColor(contextTwo, TwoColor.CGColor);//填充颜色
//    //以10为半径围绕圆心画指定角度扇形
//    CGContextMoveToPoint(contextTwo, W/2, W/2);
//    CGContextAddArc(contextTwo, W/2, W/2, R,  M_PI_4, 3*M_PI_4, 0);
//    CGContextClosePath(contextTwo);
//    CGContextDrawPath(contextTwo, kCGPathFillStroke); //绘制路径
//    /*---------第三个--------------*/
//    CGContextRef contextThree = UIGraphicsGetCurrentContext();
//    UIColor* ThreeColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
//    CGContextSetFillColorWithColor(contextThree, ThreeColor.CGColor);//填充颜色
//    //以10为半径围绕圆心画指定角度扇形
//    CGContextMoveToPoint(contextThree, W/2, W/2);
//    CGContextAddArc(contextThree, W/2, W/2, R,  3*M_PI_4, 5*M_PI_4, 0);
//    CGContextClosePath(contextThree);
//    CGContextDrawPath(contextThree, kCGPathFillStroke); //绘制路径
//    /*---------第四个--------------*/
//    CGContextRef contextFour = UIGraphicsGetCurrentContext();
//    UIColor* FourColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
//    CGContextSetFillColorWithColor(contextFour, FourColor.CGColor);//填充颜色
//    //以10为半径围绕圆心画指定角度扇形
//    CGContextMoveToPoint(contextFour, W/2, W/2);
//    CGContextAddArc(contextFour, W/2, W/2, R,  5*M_PI_4, 7*M_PI_4, 0);
//    CGContextClosePath(contextFour);
//    CGContextDrawPath(contextFour, kCGPathFillStroke); //绘制路径
//    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point= [self touchAction:event];
    float distance;//距离
    float rads;//弧度
    //NSLog(@"。。。触点的位置%@",NSStringFromCGPoint(point));
    CGPoint centerPoint = CGPointMake(W/2, W/2);
    distance = [self distanceFromPointX:point distanceToPointY:centerPoint];
    rads = [self radiansToDegreesFromPointX:CGPointMake(W, W/2) ToPointY:point ToCenter:centerPoint];
    if (distance<R&&distance>R/2) {
        
        if (rads>-M_PI_4&&rads<M_PI_4) {
            //NSLog(@"这是一");
            [self rotatingtopImage:1];
            self.choosePie(1);
            bottomImage.image = [UIImage imageNamed:@"右"];

        }else if (rads>M_PI_4&&rads<3*M_PI_4){
           // NSLog(@"这是二");
            [self rotatingtopImage:2];

            bottomImage.image = [UIImage imageNamed:@"下"];
            self.choosePie(2);

        }else if ((rads>3*M_PI_4&&rads<4*M_PI_4)||(rads<-3*M_PI_4&&rads>-4*M_PI_4)){
            [self rotatingtopImage:3];

            //NSLog(@"这是三");
            bottomImage.image = [UIImage imageNamed:@"左"];
            self.choosePie(3);

        }else if (rads<-M_PI_4&&rads>-3*M_PI_4){
            //NSLog(@"这是四");
            [self rotatingtopImage:4];

            bottomImage.image = [UIImage imageNamed:@"上"];
            self.choosePie(4);

            
        }
        
    } else if (distance>0&&distance<R/2){
       // NSLog(@"这是中心");
        self.choosePie(0);
    }
    
   }
-(void)ChoosePieMenuView:(ChoosePie)choosePie{
    self.choosePie = choosePie;
}

#pragma mark - 计算触点和中心点的弧度
-(float)radiansToDegreesFromPointX:(CGPoint)start ToPointY:(CGPoint)end ToCenter:(CGPoint)center{
    float rads;
    CGFloat a = (end.x - center.x);
    CGFloat b = (end.y - center.y);
    CGFloat c = (start.x- center.x);
    CGFloat d = (start.y- center.y);
    rads = acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
    
    if (end.y < center.y) {
        rads = -rads;
   }
    if (end.y > center.y) {
        rads = rads;

    }
    return rads;
    
}

#pragma mark - 计算触点到中心点的距离

-(float)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end{
    float distance;
    CGFloat xDist = (end.x - start.x);
    CGFloat yDist = (end.y - start.y);
    distance = sqrt((xDist * xDist) + (yDist * yDist));
    return distance;
    
}

-(CGPoint)touchAction:(UIEvent*)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:self];
    return point;
}
-(void)rotatingtopImage:(NSInteger)NewIndex{
    
    //圆的视图逆时针旋转90度
    CGAffineTransform circleTransform = topImage.transform;
    [UIView animateWithDuration:0.5 animations:^{
        topImage.transform = CGAffineTransformRotate(circleTransform, M_PI_2*(NewIndex-index));
        [self layoutIfNeeded];
    }];
    
    index = NewIndex;
}
@end
