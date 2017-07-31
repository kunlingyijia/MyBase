//
//  ViewController.m
//  CoreJPush
//
//  Created by 冯成林 on 15/9/17.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "CoreJPush.h"

@interface ViewController ()<CoreJPushProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CoreJPush addJPushListener:self];
    [CoreJPush setTags:[NSSet setWithArray:@[@"movie"]] alias:@"11806082" resBlock:^(NSInteger iResCode, NSSet *tags, NSString *alias) {
        
        if(iResCode==0){
            NSLog(@"设置成功：iResCode---%ld,tags---%@ alias---%@",(long)iResCode,tags,alias);
        }else{
            NSLog(@"设置失败");
        }
    }];
    
    
    
}
-(void)dealloc{
    [CoreJPush removeJPushListener:self];
}




-(void)didReceiveRemoteNotification:(NSDictionary *)userInfo{
    
    NSLog(@"ViewController: %@",userInfo);
    
}





@end
