//
//  RootViewController.m
//  自定义导航条
//
//  Created by 席亚坤 on 16/11/23.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "RootViewController.h"
#import "ShopViewController.h"
#import "xiangqingViewController.h"
#import "pinglunViewController.h"
#import "leixingViewController.h"
@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
    UIView  *titleView = [[UIView alloc]initWithFrame:CGRectMake(0,-10, [UIScreen mainScreen].bounds.size.width, 44)];
    
    UIButton *one = [UIButton buttonWithType:(UIButtonTypeCustom)];
    one.frame = CGRectMake(0, 0, titleView.frame.size.width/3, 42);
    [one setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [one setTitle:@"商品" forState:(UIControlStateNormal)];
    [titleView addSubview:one];
    
    UIButton *two = [UIButton buttonWithType:(UIButtonTypeCustom)];
    two.frame = CGRectMake(CGRectGetMaxX(one.frame), 0, titleView.frame.size.width/3, 42);
    [two setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [two setTitle:@"详情" forState:(UIControlStateNormal)];
    [titleView addSubview:two];
    UIButton *three = [UIButton buttonWithType:(UIButtonTypeCustom)];
    three.frame = CGRectMake(CGRectGetMaxX(two.frame), 0, titleView.frame.size.width/3, 42);
    [three setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [three setTitle:@"评价" forState:(UIControlStateNormal)];
    [titleView addSubview:three];
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(one.frame), titleView.frame.size.width/3, 2)];
    redView.backgroundColor = [UIColor redColor];
    [titleView addSubview:redView];
    // titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView =titleView;

    //Push 跳转
     ShopViewController* shopVC = [[ShopViewController alloc]initWithNibName:@"ShopViewController" bundle:nil];
    [self addChildViewController:shopVC];
    [self.redView addSubview:shopVC.view];
    xiangqingViewController* xiangqingVC = [[xiangqingViewController alloc]initWithNibName:@"xiangqingViewController" bundle:nil];
    [self addChildViewController:xiangqingVC];
    [self.yellowView addSubview:xiangqingVC.view];
    pinglunViewController* pinglunVC = [[pinglunViewController alloc]initWithNibName:@"pinglunViewController" bundle:nil];
    [self addChildViewController:pinglunVC];
    [self.blueView addSubview:pinglunVC.view];
    
    
}
- (IBAction)yixuanACtion:(UIButton *)sender {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
     [UIView animateWithDuration:0.5 animations:^{
         CATransform3D transfrom = CATransform3DIdentity;
         transfrom.m34 = 1.0 / 800;
         transfrom = CATransform3DRotate(transfrom, -5 / 360.0 * 2 * M_PI, 1.0f, 0.0f, 0.0f);//(后面3个 数字分别代表不同的轴来翻转，本处为x轴)
         self.redView.layer.anchorPoint = CGPointMake(0.5, 0.5);
         self.redView. layer.transform = transfrom;
         self.redView.frame = CGRectMake(20, 20, self.view.frame.size.width-40, self.view.frame.size.height-40);
         [self.view layoutIfNeeded];
         
         
     } completion:^(BOOL finished) {
             [UIView animateWithDuration:0.2 animations:^{
                 CATransform3D transfrom = CATransform3DIdentity;
                 transfrom.m34 = 1.0 / 800;
                 transfrom = CATransform3DRotate(transfrom,  0, 1.0f, 0.0f, 0.0f);//(后面3个 数字分别代表不同的轴来翻转，本处为x轴)
                 self.redView.layer.anchorPoint = CGPointMake(0.5, 0.5);
                 self.redView. layer.transform = transfrom;

             }];

     }];
    //Push 跳转
    leixingViewController * VC = [[leixingViewController alloc]initWithNibName:@"leixingViewController" bundle:nil];
    VC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];

    //返回
    [VC back:^{
  [UIView animateWithDuration:0.3
   animations:^{
     CATransform3D transfrom = CATransform3DIdentity;
     transfrom.m34 = 1.0 / 800;
     transfrom = CATransform3DRotate(transfrom, -5 / 360.0 * 2 * M_PI, 1.0f, 0.0f, 0.0f);//(后面3个 数字分别代表不同的轴来翻转，本处为x轴)
     self.redView.layer.anchorPoint = CGPointMake(0.5, 0.5);
     self.redView. layer.transform = transfrom;
 } completion:^(BOOL finished) {
     
 [UIView animateWithDuration:0.2
                      animations:^{
                          CATransform3D transfrom = CATransform3DIdentity;
                          transfrom.m34 = 1.0 / 800;
                          transfrom = CATransform3DRotate(transfrom, 0, 1.0f, 0.0f, 0.0f);//(后面3个 数字分别代表不同的轴来翻转，本处为x轴)
                          self.redView.layer.anchorPoint = CGPointMake(0.5, 0.5);
                          self.redView. layer.transform = transfrom;
                          
                          self.redView.frame = self.view.frame;
                          [self.view layoutIfNeeded];
                      } completion:^(BOOL finished) {
 [self.navigationController setNavigationBarHidden:NO animated:NO];
          }];

     
       }];
} ];
        
    [self presentViewController:VC animated:YES completion:nil];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
