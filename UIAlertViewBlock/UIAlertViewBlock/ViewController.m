//
//  ViewController.m
//  UIAlertViewBlock
//
//  Created by 席亚坤 on 16/12/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "AlertViewBlock.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)Action:(UIButton *)sender {
    AlertViewBlock *alerv = [[AlertViewBlock alloc]initWithTitle:@"提示" message:@"重要信息" cancelButtonTitle:@"取消" otherButtonTitles:@"确定" Block:^(NSInteger index) {
        switch (index) {
            case 0:
            {
                self.view.window.alpha = 0.6;
                NSLog(@"取消");
            }
                break;
            case 1:
            {
                 self.view.window.alpha = 1;
                NSLog(@"确定");
            }
                break;

            default:
                break;
        }
    }];
    [alerv show];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
