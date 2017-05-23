//
//  AlertViewBlock.m
//  UIAlertViewBlock
//
//  Created by 席亚坤 on 16/12/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "AlertViewBlock.h"

@implementation AlertViewBlock
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles Block:(AVBlock)block{
    if ([super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil]) {
        _block= block;
        
    }return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0){
    _block(buttonIndex);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
