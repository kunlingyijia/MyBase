//
//  CTPopViewSingle.m
//  Carriage
//
//  Created by Fylian on 16/11/16.
//  Copyright © 2016年 Fylian. All rights reserved.
//

#import "CTPopViewSingle.h"
#import "CTPopView.h"
#import "AppDelegate.h"
@interface CTPopViewSingle ()
@property (nonatomic, strong) CTPopView * popMenuView;

@end
@implementation CTPopViewSingle

+ (CTPopViewSingle *) shareManager {
    static CTPopViewSingle *_PopMenuSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _PopMenuSingleton = [[CTPopViewSingle alloc]init];
    });
    return _PopMenuSingleton;
}

- (void) showPopMenuSelecteWithFrame:(CGFloat)width
                                item:(NSArray *)item
                              action:(void (^)(NSInteger))action {
    __weak __typeof(&*self)weakSelf = self;
    if (self.popMenuView != nil) {
        [weakSelf hideMenu];
    }
   
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    self.popMenuView = [[CTPopView alloc] initWithFrame:delegate.window.bounds
                                                 menuWidth:width
                                                     items:item
                                                    action:^(NSInteger index) {
                                                        action(index);
                                                        [weakSelf hideMenu];
                                                        
                                                    }];
    self.popMenuView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [delegate.window addSubview:self.popMenuView];
    
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
    self.popMenuView.tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
self.popMenuView.tableView.layer.   anchorPoint = CGPointMake(0, 0);
        
    }];
    
    
}

- (void) hideMenu {
    [UIView animateWithDuration:0.2 animations:^{
         self.popMenuView.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self.popMenuView.tableView removeFromSuperview];
        
        [self.popMenuView removeFromSuperview];
        self.popMenuView.tableView = nil;
        self.popMenuView = nil;
       
    }];
}




@end
