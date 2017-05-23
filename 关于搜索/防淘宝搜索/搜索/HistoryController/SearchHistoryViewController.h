//
//  SearchHistoryViewController.h
//  搜索
//
//  Created by 席亚坤 on 16/12/23.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchHistoryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UITextField *searchHisToryTF;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
///返回
- (IBAction)CancelAction:(UIButton *)sender;
///清除输入框
- (IBAction)ClearTFAction:(UIButton *)sender;

@end
