//
//  HeaderModel.h
//  京东购物车
//
//  Created by 席亚坤 on 16/12/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarModel.h"
@interface HeaderModel : NSObject
///店名
@property (nonatomic, strong) NSString  *dianming ;
///页眉选择状态
@property (nonatomic, strong) NSString  *Dimage ;
///商品model数组
@property (nonatomic, strong) NSArray <CarModel *> *array ;






@end
