//
//  TwoViewController.m
//  转场捏合动画
//
//  Created by 席亚坤 on 16/6/12.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@property(nonatomic,strong)UIImageView * imageView1;
@property(nonatomic,strong)UIImageView * imageView2;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView1.tag = 100;
    self.imageView1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_imageView1];
    self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView2.tag = 200;
    self.imageView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_imageView2];
    //create a new transform
   
    [self performSelector:@selector(hh) withObject:self afterDelay:0.05];
    
   }
-(void)hh{
    
    [self handleCATransition];
    [self handleCATransition11];
    
}
//CA过度动画
-(void)handleCATransition{
    CATransition *transition = [CATransition animation];
    transition.duration =1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionReveal;//{kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
    /*更多私有{
     @"cube",立方体
     @"suckEffect",吸效应
     @"oglFlip",翻转
     @"rippleEffect",波纹效应
     @"pageCurl",翻书页
     @"pageUnCurl",反方向翻书页
     @"cameraIrisHollowOpen",开相机光圈效应
     */
    //配置过度动画类型
    transition.type = @"oglFlip";
    //配置过渡动画方向
    transition.subtype =kCATransitionFromBottom ;
    transition.delegate = self;
    //添加
    CATransform3D transform = CATransform3DIdentity; //apply perspective
    transform.m34 = 1.0 / 800.0; //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI_4*1.9, 1, 0, 0); //apply to layer
    self.imageView1.layer.anchorPoint = CGPointMake(0.5, 0);
    NSLog(@"%f",M_PI);

    self.imageView1.layer.transform = transform;

    
    //[self.imageView1.layer addAnimation:transition forKey:nil];

    
}
//CA过度动画
-(void)handleCATransition11{
    CATransition *transition = [CATransition animation];
    transition.duration =.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionReveal;//{kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
    /*更多私有{
     @"cube",立方体
     @"suckEffect",吸效应
     @"oglFlip",翻转
     @"rippleEffect",波纹效应
     @"pageCurl",翻书页
     @"pageUnCurl",反方向翻书页
     @"cameraIrisHollowOpen",开相机光圈效应
     */
    //配置过度动画类型
    transition.type = @"cube";
    //配置过渡动画方向
    transition.subtype =kCATransitionFromTop ;
    transition.delegate = self;
    //添加
    CATransform3D transform = CATransform3DIdentity; //apply perspective
    transform.m34 = -1.0 / 800.0; //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI/4*1.9-M_PI, 1, 0, 0); //apply to layer
    self.imageView2.layer.anchorPoint = CGPointMake(0.5, 0);
    
    
    self.imageView2.layer.transform = transform;

   
    //[self.imageView2.layer addAnimation:transition forKey:nil];
   
 
 }
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.imageView1 removeFromSuperview];

    [self.imageView2 removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
