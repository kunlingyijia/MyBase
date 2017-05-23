//
//  ViewController.m
//  百分比圆
//
//  Created by 席亚坤 on 16/12/1.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+CustomColor.h"
///蓝色
#define kBlueColor @"#6ad3ff"
///绿色
#define kGreenColor @"#1ad4af"
///橙色
#define kOrangeColor @"#f67c29"
///红色
#define kRedColor @"#f94431"
#import "PercentageRoudView.h"
#import "TableViewCell.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
- (IBAction)xxx:(id)sender {
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // [self createPercentCircleView:self.view Diameter:100.0 CircleWidth:1.0 ColorArray:[@[kBlueColor,kGreenColor,kRedColor]mutableCopy] PercentArray:[@[@0.3,@0.2,@0.5]mutableCopy]];
//    PercentageRoudView * roudView = [[PercentageRoudView alloc]initWithFrame:CGRectMake(100, 100, 200, 300) createPercentCircleWidth:30 ColorArray:[@[kBlueColor,kGreenColor,kRedColor,kBlueColor,kGreenColor,kRedColor]mutableCopy] PercentArray:[@[@0.1,@0.2,@0.2,@0.3,@0.1,@0.1]mutableCopy]percentText:@"测试"];
//    [self.view addSubview:roudView];
    
   // [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"] ;
    
}

#pragma tableView 代理方法
//tab分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //分区个数
    return 1;
}
///tab个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    //cell 赋值
    
    
    // cell 其他配置
    
    
    /*
     //cell选中时的颜色 无色
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
     //cell 背景颜色
     cell.backgroundColor = [UIColor yellowColor];
     //分割线
     tableView.separatorStyle = UITableViewCellSelectionStyleNone;
     */
    return cell;
}
#pragma mark - Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - Cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}

////创建百分比圆的视图
///* View:圆要加在哪个View上
// Diameter:直径
// CircleWidth:圆的边框
// ColorArray:进度条的颜色数组
// PercentArray:比例的数组
// */
//- (void)createPercentCircleView:(UIView *)view Diameter:(NSInteger)diameter CircleWidth:(NSInteger)circleWidth ColorArray:(NSMutableArray *)colorArray PercentArray:(NSMutableArray *)percentArray {
//    
//    float temp = 0;
//    NSMutableArray *pathArray = [[NSMutableArray alloc] init];
//    [pathArray addObject:[NSNumber numberWithFloat:temp]];
//    for (int i = 0; i < percentArray.count; i++) {
//        temp += [[percentArray objectAtIndex:i] floatValue];
//        [pathArray addObject:[NSNumber numberWithFloat:temp]];
//    }
//    //设置圆形贝塞尔曲线
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, diameter, diameter)];
//    //设置layer的动画效果
//    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    //设置动画持续时间
//    pathAnimation.duration = 2.0;
//    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    if ([[pathArray objectAtIndex:pathArray.count-1] floatValue] == 0) {
//        //设置圆的样式
//        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//        shapeLayer.frame = CGRectMake(0, 0, diameter, diameter);
//        //设置圆的填充颜色
//        shapeLayer.fillColor = [UIColor clearColor].CGColor;
//        //设置圆的边宽
//        shapeLayer.lineWidth = circleWidth;
//        //设置圆的边宽颜色
//        shapeLayer.strokeColor = [UIColor colorWithHexString:@"dddddd"].CGColor;
//        shapeLayer.strokeStart = 0;
//        shapeLayer.strokeEnd = 1;
//        //让贝塞尔曲线与CAShapeLayer产生联系
//        shapeLayer.path = circlePath.CGPath;
//        //设置动画效果
//        [shapeLayer addAnimation:pathAnimation forKey:nil];
//        //添加并显示
//        [view.layer addSublayer:shapeLayer];
//    }else {
//        for (int i = 0; i < colorArray.count; i++) {
//            //设置圆的样式
//            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//            shapeLayer.frame = CGRectMake(0, 0, diameter, diameter);
//            //设置圆的填充颜色
//            shapeLayer.fillColor = [UIColor clearColor].CGColor;
//            //设置圆的边宽
//            shapeLayer.lineWidth = circleWidth;
//            //设置圆的边宽颜色
//            shapeLayer.strokeColor = [UIColor colorWithHexString:[colorArray objectAtIndex:i]].CGColor;
//            shapeLayer.strokeStart = [[pathArray objectAtIndex:i] floatValue];
//            shapeLayer.strokeEnd = [[pathArray objectAtIndex:i+1] floatValue];
//            //让贝塞尔曲线与CAShapeLayer产生联系
//            shapeLayer.path = circlePath.CGPath;
//            //设置动画效果
//            [shapeLayer addAnimation:pathAnimation forKey:nil];
//            //添加并显示
//            [view.layer addSublayer:shapeLayer];
//        }
//    }
//}
//
/////圆的视图逆时针旋转90度,圆内的文本视图顺时针旋转90度
//- (void)rotateCircleAndTextView:(UIView *)circleView TextView:(UIView *)textView {
//    //圆的视图逆时针旋转90度
//    CGAffineTransform circleTransform = circleView.transform;
//    circleView.transform = CGAffineTransformRotate(circleTransform, M_PI_2*1);
//    //圆内的文本视图顺时针旋转90度
//    CGAffineTransform textTransform = textView.transform;
//    textView.transform = CGAffineTransformRotate(textTransform, M_PI_2*1);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
