//
//  IndianaMenuModel.h
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndianaMenuModel : NSObject

///title
@property (nonatomic, strong) NSString  *title ;
///image
@property (nonatomic, strong) NSString  *image ;
///是否选中
@property (nonatomic, assign) NSInteger IsChoose;
///是否展开
@property (nonatomic, assign) BOOL IsOpen;
///是否双图
@property (nonatomic, assign) BOOL IsDoubleImage;










@end
