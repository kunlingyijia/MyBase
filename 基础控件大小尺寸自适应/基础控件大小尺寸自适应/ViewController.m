//
//  ViewController.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/11/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Size.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewOne;
@property (weak, nonatomic) IBOutlet UIView *viweTwo;

@end

@implementation ViewController
-(void)loadView{
    [super loadView];
   }
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.viewOne viewSize];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%f",self.viewOne.frame.size.height);
//    [self.viewOne viewSize];
//    NSLog(@"%f",self.viewOne.frame.size.height);
//    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width,100)];
//    redView.backgroundColor = [UIColor redColor];
//    [redView viewSize];
//    [self.view   addSubview:redView];
    //Push 跳转
    TwoViewController * VC = [[TwoViewController alloc]initWithNibName:@"TwoViewController" bundle:nil];
    [self.navigationController  pushViewController:VC animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
