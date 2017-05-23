//
//  MeNuTableView.h
//  京东下拉菜单
//
//  Created by 席亚坤 on 16/10/31.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MeNuTableViewDelegate <NSObject>
///从左到右
-(void)oneBtnAction;
-(void)twoBtnAction;
///点击BtnTwo 箭头向下箭头遵从代理
-(void)threeBtnActionDown;
///点击BtnTwo 箭头向上箭头遵从代理
-(void)threeBtnActionUp;
-(void)fourBtnAction;

@end
@interface MeNuTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
///代理
@property (nonatomic, assign) id<MeNuTableViewDelegate> Menudelegate;
- (instancetype)initWithFrame:(CGRect)frame1 dataArray:(NSMutableArray*)data;
@end
