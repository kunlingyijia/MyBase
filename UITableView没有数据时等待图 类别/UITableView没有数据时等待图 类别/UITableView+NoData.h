//
//  UITableView+NoData.h
//  UITableView没有数据时等待图 类别
//
//  Created by 席亚坤 on 16/11/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (NoData)
- (void)tableViewDisplayWitimage:(NSString *)image ifNecessaryForRowCount:(NSUInteger) rowCount;

@end
