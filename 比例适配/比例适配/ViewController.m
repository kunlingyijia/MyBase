//
//  ViewController.m
//  比例适配
//
//  Created by 席亚坤 on 16/12/16.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"
#import "DWlabel.h"
#import "DWButtion.h"
#import "DWTextfield.h"
#import "DWImageView.h"
#define KHeight 568
#define KWidth 320
#define ScrenScale ([UIScreen mainScreen].bounds.size.height/568.0)
#define W ([UIScreen mainScreen].bounds.size.width/320.0)
#define MaxY(object)  CGRectGetMaxY(object.frame)/ScrenScale
#define MaxX(object)  CGRectGetMaxX(object.frame)/W
#define NaV 64/ScrenScale
#define Bar  50/ScrenScale
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Push 跳转
    RootViewController * VC = [[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
   // [self.navigationController  pushViewController:VC animated:YES];
    DWButtion * btn = [[DWButtion alloc]initWithFrame:CGRectMake(0, 50+NaV, 320, 40) Font:12];
    ;
    
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击我" forState:(UIControlStateNormal)];
    NSLog(@"btn----%f",10*ScrenScale);
    [self.view addSubview:btn];
    DWTextfield *tf = [[DWTextfield alloc]initWithFrame:CGRectMake(10, (MaxY(btn)+10), 300, 40) Font:12];
    tf.backgroundColor = [UIColor whiteColor];
    tf.placeholder = @"请输入";
    NSLog(@"tf----%f",tf.frame.origin.y);

    [self.view addSubview:tf];
    DWlabel *label = [[DWlabel alloc]initWithFrame:CGRectMake(0, (MaxY(tf)+10), 320, 40)Font:10];
    label.text = @"我的测试";
     label.backgroundColor = [UIColor whiteColor];
    NSLog(@"label----%f",label.frame.origin.y);
    NSLog(@"label----%f",label.frame.size.height);
    [self.view addSubview:label];
    DWImageView * imageV = [[DWImageView alloc]initWithFrame:CGRectMake(10, (KHeight-40-40-Bar), 300, 40)];
    imageV.backgroundColor = [UIColor redColor];
    imageV.image = [UIImage imageNamed:@"bg_loading_5_2"];
    [self.view addSubview:imageV];
    DWlabel *ONE = [[DWlabel alloc]initWithFrame:CGRectMake(30, MaxY(label)+10, (KWidth-90)/2, 50) Font:13];
    ONE.backgroundColor = [UIColor greenColor];
    DWlabel *TWo = [[DWlabel alloc]initWithFrame:CGRectMake(MaxX(ONE)+30, MaxY(label)+10, (KWidth-90)/2, 50) Font:13];
    TWo.backgroundColor = [UIColor blueColor];
    [self.view addSubview:ONE];
    [self.view addSubview:TWo];

    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"注意" message:@"我的天啊" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *OK= [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:OK];
    [self presentViewController:alertC animated:YES completion:nil];
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(20*W, (MaxY(btn)+10)*ScrenScale, (KWidth-40)*W, 100)];
    redView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:redView];
    
    
   }




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
