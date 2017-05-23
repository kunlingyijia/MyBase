//
//  HeaderModel.m
//  京东购物车
//
//  Created by 席亚坤 on 16/12/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "HeaderModel.h"
#import "CarModel.h"
@implementation HeaderModel
//#把数组里面带有对象的类型专门按照这个方法，这个格式写出来
-(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"array" : CarModel.class,
                         };
}
@end
