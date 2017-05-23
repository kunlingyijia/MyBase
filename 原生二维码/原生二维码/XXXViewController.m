//
//  XXXViewController.m
//  原生二维码
//
//  Created by 席亚坤 on 16/10/31.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "XXXViewController.h"

@interface XXXViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;

@end

@implementation XXXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)XXX:(UIButton *)sender {
    self.width.constant = 400;
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
