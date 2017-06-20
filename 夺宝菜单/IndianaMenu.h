//
//  IndianaMenu.h
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndianaMenu : UITableView<UITableViewDelegate,UITableViewDataSource>
- (instancetype)initWithFrame:(CGRect)frame IsClass:(BOOL)iSClass ClassArr:(NSMutableArray*)arr;
@property (nonatomic, copy) void(^IndianaMenuBlock)(NSInteger tag,NSString * IsUp) ;
@property (nonatomic, copy) void(^IndianaClassMenuBlock)(NSInteger tag) ;
@end
