//
//  LoadWaitView.h
//  自定义加载等待图
//
//  Created by 席亚坤 on 17/1/18.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadWaitView : UIView
///宽
@property (nonatomic, assign) NSInteger  bottomViewW ;
///长
@property (nonatomic, assign) NSInteger  bottomViewH ;
///底图
@property (nonatomic, strong) UIView * bottomView;
///imageView
@property (nonatomic, strong) UIImageView * imageView;



- (instancetype)initWithimage:(NSString*)image;
@end
