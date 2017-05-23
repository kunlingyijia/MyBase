//
//  LoadWaitSingle.m
//  自定义加载等待图
//
//  Created by 席亚坤 on 17/1/18.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "LoadWaitSingle.h"
#import "LoadWaitView.h"
#import "AppDelegate.h"
@interface LoadWaitSingle ()
@property (nonatomic, strong) LoadWaitView* LWView;
    

@end
@implementation LoadWaitSingle
+(LoadWaitSingle*)shareManager{
    static LoadWaitSingle *_LoadWaitSingle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _LoadWaitSingle = [[LoadWaitSingle alloc]init];
    });
    return _LoadWaitSingle;
}


- (void) showLoadWaitViewImage:(NSString*)image{
    if (self.LWView != nil) {
        //[self hideMenu];
    }
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    self.LWView =
    [[LoadWaitView alloc]initWithimage:image];
     [delegate.window addSubview:_LWView];

}
- (void) hideMenu {
    
    if (_LWView != nil) {
//         [_LWView.imageView removeFromSuperview];
//        [_LWView.bottomView removeFromSuperview];
        [_LWView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

//        [_LWView removeFromSuperview];
//        _LWView = nil;
//        _LWView.bottomView = nil;
//        _LWView.imageView = nil;
    }
}

@end
