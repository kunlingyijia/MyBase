//
//  CityModel.h
//  城市三级联动
//
//  Created by 席亚坤 on 16/11/20.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject
@property (nonatomic, copy) NSString *regionCd;
@property (nonatomic, assign) NSInteger regionId;
@property (nonatomic, copy) NSString *regionName;
@property (nonatomic, assign) NSInteger regionType;
@property (nonatomic, assign) NSInteger superId;
@property (nonatomic, assign) NSInteger treeLevel;

@end
