//
//  ViewController.m
//  自定义加载等待图
//
//  Created by 席亚坤 on 17/1/18.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "LoadWaitSingle.h"
@interface ViewController (){
    dispatch_source_t  _timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)Show:(id)sender {
    [[LoadWaitSingle shareManager]showLoadWaitViewImage:@"63.jpg"];
    __weak typeof(self) weakSelf = self;
    
//    //GCD定时器
//    NSTimeInterval period = 1.0; //设置时间间隔
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
//    __block  NSInteger ind = 0;
//    dispatch_source_set_event_handler(_timer, ^{
//        //在这里执行事件
//        NSLog(@"每秒执行test");
//        ind ++;
//        if (ind==5) {
//            [[LoadWaitSingle shareManager]hideMenu];
//        }
//        
//    });
//    
//    dispatch_resume(_timer);

}
- (IBAction)hide:(id)sender {
    [[LoadWaitSingle shareManager]hideMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
