//
//  SearchHistoryView.h
//  搜索
//
//  Created by 席亚坤 on 16/12/23.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SearechTFValue)(NSString *SearchStr);

typedef void(^SearchBack) ();
typedef void(^SearchSearch) (NSString *SearchStr);
typedef void(^SearchCancel) (NSString *SearchStr);
@interface SearchHistoryView : UIView<UITextFieldDelegate>
@property(nonatomic,copy) SearchBack searchBack;
@property(nonatomic,copy) SearchSearch searchSearch;
@property(nonatomic,copy) SearchCancel searchCancel;
@property(nonatomic,copy) SearechTFValue searechTFValue;


///返回
@property (weak, nonatomic) IBOutlet UIButton *BackBtnAction;

///底层视图
@property (weak, nonatomic) IBOutlet UIView *bottomView;
///输入框
@property (weak, nonatomic) IBOutlet UITextField *searchHisToryTF;
///清除输入框
@property (weak, nonatomic) IBOutlet UIButton *ClearBtn;
- (IBAction)ClearTFAction:(UIButton *)sender;

///取消按钮
@property (weak, nonatomic) IBOutlet UIButton *CancelBtn;
///取消按钮的宽度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *CancelConstrainWidth;
//返回按钮的宽度

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BackConstrainWidth;

///返回事件
-(void)backAction:(SearchBack)searchBack;
///搜索事件
-(void)searchAction:(SearchSearch)searchSearch;
///取消事件
-(void)CancelAction:(SearchCancel)searchCancel;
///键盘return
-(void)SearchTFReturn:(SearechTFValue)searechTFValue;



@end
