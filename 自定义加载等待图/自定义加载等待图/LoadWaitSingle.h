//
//  LoadWaitSingle.h
//  自定义加载等待图
//
//  Created by 席亚坤 on 17/1/18.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LoadWaitSingle : NSObject
+(LoadWaitSingle*)shareManager;

- (void) showLoadWaitViewImage:(NSString*)image;
- (void) hideMenu;
@end
