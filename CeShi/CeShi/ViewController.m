//
//  ViewController.m
//  CeShi
//
//  Created by 席亚坤 on 16/9/11.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "NetManager.h"
#import "Model.h"
#import "YYModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [NetManager getRequestwithURL:@"http://c.3g.163.com/nc/video/home/0-10.html" withSuccessResult:^(id successResult) {
        //NSLog(@"成功%@",successResult[@"videoList"]);
        NSArray *arr = successResult[@"videoList"];
        NSLog(@"%@",arr);
        for (NSDictionary *dic in arr) {
           Model * mo =  [Model  yy_modelWithJSON:dic];
            NSLog(@"%@",    mo.cover);
 
        }
        
        
    } withErrorResult:^(NSError *errorResult) {
        NSLog(@"%@",errorResult);
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
