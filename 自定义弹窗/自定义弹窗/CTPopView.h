//
//  PopView.h
//  Carriage
//
//  Created by Fylian on 16/11/16.
//  Copyright © 2016年 Fylian. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface CTPopView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) CGFloat menuWidth;
@property (nonatomic, copy) void(^action)(NSInteger index);
@property (nonatomic, copy) NSArray * menuItem;
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIView * triangleView;


- (instancetype) initWithFrame:(CGRect)frame
                     menuWidth:(CGFloat)menuWidth
                         items:(NSArray *)items
                        action:(void(^)(NSInteger index))action;



@end
