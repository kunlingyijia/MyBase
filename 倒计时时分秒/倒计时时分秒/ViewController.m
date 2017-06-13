//
//  ViewController.m
//  倒计时时分秒
//
//  Created by 席亚坤 on 2017/6/9.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)countdown:(UIButton *)sender {
    __weak typeof(self) weakSelf = self;
        UIButton *btn = sender;
        btn.userInteractionEnabled = NO;
        __block int timeout=3600; //倒计时时间
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
        //每秒执行
        dispatch_source_set_event_handler(_timer, ^{
            if(timeout<=0){
                //倒计时结束，关闭
                //倒计时结束 改变颜色
                dispatch_source_cancel(_timer);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置界面的按钮显示 根据自己需求设置
                    [btn setTitle:@"立即购买" forState:UIControlStateNormal];
                    btn.userInteractionEnabled = YES;
                });
            }else{
                    dispatch_async(dispatch_get_main_queue(), ^{
                    //设置界面的按钮显示 根据自己需求设置
                    NSString *strTime = [weakSelf getMMSSFromSS:[NSString stringWithFormat:@"%d",timeout]];
                   [btn setTitle:[NSString stringWithFormat:@"%@",strTime] forState:UIControlStateNormal];
                    btn.userInteractionEnabled = NO;
                });
                timeout--;
            }
        });
        dispatch_resume(_timer);
    
}
//传入 秒  得到 xx:xx:xx
-(NSString *)getMMSSFromSS:(NSString *)totalTime{
    NSInteger seconds = [totalTime integerValue];
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
