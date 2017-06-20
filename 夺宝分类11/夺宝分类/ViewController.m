//
//  ViewController.m
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "IndianaMenu.h"
#define IMenuWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    IndianaMenu *menu =[[IndianaMenu alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, IMenuWidth*0.12) IsClass:YES ClassArr:[@[@"嗯嗯嗯",@"呃呃呃额额",@"嗯嗯翁无"]mutableCopy]];

    
    
    menu.IndianaMenuBlock=^(NSInteger tag,NSString * IsUp){
        
        switch (tag) {
                
            case 1:
            {
                
                break;
            }
                
            case 2:
            {
                
                break;
            }
                
                
            case 3:
            {
                
                break;
            }
            case 4:
            {
                
                if ([IsUp isEqualToString:@"0"]) {
                     //从低到高
                }else if ([IsUp isEqualToString:@"1"]){
                    //从高到低
                }
                
                
                
                break;
            }
                
            default:{
                
                break;
                
            }
        }

    };
    menu.IndianaClassMenuBlock=^(NSInteger tag){
        
    };
    [self.view addSubview:menu];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
