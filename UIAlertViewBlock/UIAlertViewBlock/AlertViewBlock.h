//
//  AlertViewBlock.h
//  UIAlertViewBlock
//
//  Created by 席亚坤 on 16/12/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^AVBlock) (NSInteger index);
@interface AlertViewBlock : UIAlertView

///AVBlock
@property (nonatomic, copy) AVBlock block   ;


-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles Block:(AVBlock)block;
@end
