//
//  BlockBtn.m
//  Block内存管理
//
//  Created by 席亚坤 on 16/12/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "BlockBtn.h"

@implementation BlockBtn
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(TouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)TouchUpInside:(BlockBtn*)sender{
    
    _blockBtnAction(sender);
    
    
}
@end
