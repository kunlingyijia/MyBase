//
//  ViewController.m
//  电信按钮
//
//  Created by 席亚坤 on 16/12/5.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "PieMenuView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PieMenuView * pieView = [[PieMenuView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [pieView ChoosePieMenuView:^(Place place) {
        switch (place) {
            case 0:
            {
                NSLog(@"中心");
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                
            }
                break;
            case 3:
            {
                
            }
                break;
            case 4:
            {
                
            }
                break;

            default:
                break;
        }
    }];
    [self.view addSubview:pieView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
