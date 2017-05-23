//
//  ViewController.m
//  Block内存管理
//
//  Created by 席亚坤 on 16/12/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "BlockBtn.h"
#import "RootViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BlockBtn * btn = [[BlockBtn alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击" forState:(UIControlStateNormal)];
    __weak typeof(self) weakSelf = self;
    btn.blockBtnAction = ^(BlockBtn *sender){
        RootViewController * VC = [[RootViewController alloc]init];
        [weakSelf presentViewController:VC animated:YES completion:^{
            NSLog(@"跳转了");
        }];
        //异步 +并发
        //创建并发
        /*
        dispatch_queue_t queue=   dispatch_queue_create("并发", DISPATCH_QUEUE_CONCURRENT);
        NSLog(@"开始了");
        dispatch_async(queue, ^{
            NSLog(@"任务1-----%@",[NSThread currentThread]);
        });
        dispatch_async(queue, ^{
            NSLog(@"任务2-----%@",[NSThread currentThread]);
        });
        
        dispatch_async(queue, ^{
            NSLog(@"任务3-----%@",[NSThread currentThread]);
        });
        
        NSLog(@"结束了");
        */
        /*
        //异步+ 串行
        dispatch_queue_t  queue2 = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL) ;
        NSLog(@"开始了");
        dispatch_async(queue2
                       , ^{
            NSLog(@"任务1-----%@",[NSThread currentThread]);
                           
        });
        dispatch_async(queue2, ^{
            NSLog(@"任务2-----%@",[NSThread currentThread]);
           

        });
        
        dispatch_async(queue2, ^{
            NSLog(@"任务3-----%@",[NSThread currentThread]);
           
        });
        
        NSLog(@"结束了");
        */
        //分组 +异步+ 并发
        /*
        dispatch_queue_t queue= dispatch_queue_create("并发", DISPATCH_QUEUE_CONCURRENT);
        dispatch_group_t group = dispatch_group_create();
        dispatch_group_async(group, queue, ^{
            NSLog(@"111111111");
       });
        dispatch_group_async(group, queue, ^{
            NSLog(@"2222222222");
        });
        dispatch_group_async(group, queue, ^{
            NSLog(@"33333333");
        });
        dispatch_group_async(group, queue, ^{
            NSLog(@"44444444");
        });
        dispatch_group_async(group, queue, ^{
            NSLog(@"555555555");
        });
        
        dispatch_group_notify(group, queue, ^{
            NSLog(@"和并");
        });
         */
//        dispatch_queue_t mainQueue = dispatch_get_main_queue();
//        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, mainQueue);
//        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//        dispatch_source_set_event_handler(timer, ^{
//            //业务逻辑
//            for (int i=0; i<10; i++) {
//                NSLog(@"%d",i);
//            }
//            dispatch_cancel(timer);
//        });
//        dispatch_resume(timer);
//        
    };
    [self.view addSubview:btn];
    
    _xxx.titleLabel.numberOfLines = 0;

}

-(void)dealloc{
    NSLog(@"ViewController销毁了");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
