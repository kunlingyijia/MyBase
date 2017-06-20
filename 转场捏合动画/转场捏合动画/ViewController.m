//
//  ViewController.m
//  转场捏合动画
//
//  Created by 席亚坤 on 16/6/12.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *OneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *TwoImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)dianjiAction:(UIBarButtonItem *)sender {
    //[self handleCATransition];
    [self handleCATransition11];
}

//CA过度动画
-(void)handleCATransition{
    CATransition *transition = [CATransition animation];
    transition.duration =0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
     //transition.type = kCATransitionFade;//{kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
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
    
    [self.OneImageView.layer addAnimation:transition forKey:nil];
   // self.OneImageView = nil;
    
    
    CATransition *transition1 = [CATransition animation];
    transition1.duration =0.5;
    transition1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // transition.type = kCATransitionMoveIn;//{kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
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
    transition1.type = @"cube";
    //配置过渡动画方向
    transition1.subtype =kCATransitionFromTop ;
    //transition1.delegate = self;
    //添加
    
    [self.TwoImageView.layer addAnimation:transition forKey:nil];
    
    

    
}
//CA过度动画
-(void)handleCATransition11{
    CATransition *transition = [CATransition animation];
    transition.duration =0.7;
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
    transition.subtype =kCATransitionFromBottom ;
    transition.delegate = self;
    //添加
    
    //[self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    TwoViewController * VC = [[self storyboard] instantiateViewControllerWithIdentifier:@"TwoViewController"];
    [self.navigationController pushViewController:VC animated:NO];
    
   // self.TwoImageView = nil;
    
}
//- (void)animationDidStart:(CAAnimation *)anim{
//    NSLog(@"嘻嘻嘻嘻嘻嘻嘻嘻嘻");
//   
//    
//}
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"法第三方");
//    TwoViewController * VC = [[TwoViewController alloc]init];
//    
//    [self.navigationController pushViewController:VC animated:NO];
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
