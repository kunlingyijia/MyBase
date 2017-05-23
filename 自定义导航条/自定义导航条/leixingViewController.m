//
//  leixingViewController.m
//  自定义导航条
//
//  Created by 席亚坤 on 16/11/23.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "leixingViewController.h"
#import "RootViewController.h"
@interface leixingViewController ()

@property(nonatomic,strong)UIImageView *iamgeV;
@end

@implementation leixingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.iamgeV = [[UIImageView alloc]init];
//    _iamgeV.backgroundColor = [UIColor greenColor];
//    _iamgeV.image = [UIImage imageNamed:@"开屏页.jpg"];
//    _iamgeV.frame = self.view.frame;
//    [self.view addSubview:_iamgeV];

    
    self.modalPresentationStyle =UIModalPresentationCustom;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1 animations:^{
        _iamgeV.frame = CGRectMake(20, 20, self.view.frame.size.width-40, self.view.frame.size.height-40);
        //[self.view layoutIfNeeded];
    }];

}
- (IBAction)BackAction:(UIButton *)sender {
    //Push 跳转
    //RootViewController * VC = [[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    
    self.back();
    [self dismissViewControllerAnimated:YES completion:^{
//        VC.redView.frame= CGRectMake(0, 0, VC.view.frame.size.width, VC.view.frame.size.height);
//        [VC.navigationController setNavigationBarHidden:NO animated:NO];
        
        
    }];
}
-(void)back:(Back)back{
    self.back = back;
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
