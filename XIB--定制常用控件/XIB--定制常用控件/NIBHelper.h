//
//  NIBHelper.h
//  UIView-XIB
//
//  Created by 席亚坤 on 16/9/26.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NIBHelper : NSObject
+ (id)instanceFromNib:(NSString*)nibName;
@end
