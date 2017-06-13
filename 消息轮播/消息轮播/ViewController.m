//
//  ViewController.m
//  消息轮播
//
//  Created by 席亚坤 on 17/5/17.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic,assign)NSInteger  count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<5; i++) {
         NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"恭喜%d个",i]];
        [AttributedStr addAttribute:NSFontAttributeName
         
                              value:[UIFont systemFontOfSize:13]
         
                              range:NSMakeRange(2, 1)];
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName
         
                              value:[UIColor blueColor]
         
                              range:NSMakeRange(2, 1)];
        [arr addObject:AttributedStr];
    }
    
    //NSArray*arr =@[@"测试一",@"测试二",@"测试三",@"测试四",@"测试五",@"测试六",@"测试七"];
    
    _count=0;
    self.label.backgroundColor= [UIColor whiteColor];
    
    [NSTimer scheduledTimerWithTimeInterval:3           repeats:YES block:^(NSTimer*_Nonnulltimer) {
        
        CATransition*tran = [CATransition animation];
        
        tran.type=kCATransitionPush;
        
        tran.subtype=kCATransitionFromTop;
        
        [self.label.layer addAnimation:tran forKey:@"trans"];
        
        self.label.attributedText= arr[_count];
        
        if(_count== arr.count-1) {
            
            _count=0;
            
        }else{
            
            _count=_count+1;
            
        }
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
