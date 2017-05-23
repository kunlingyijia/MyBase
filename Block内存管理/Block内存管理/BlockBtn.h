//
//  BlockBtn.h
//  Block内存管理
//
//  Created by 席亚坤 on 16/12/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlockBtn;
typedef void(^BlockBtnAction)(BlockBtn*);
@interface BlockBtn : UIButton
///BlockBtnAction
@property (nonatomic, copy) BlockBtnAction  blockBtnAction ;


@end
