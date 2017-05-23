//
//  HeaderCarView.m
//  京东购物车
//
//  Created by 席亚坤 on 16/11/22.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "HeaderCarView.h"
#import "PublicBtn.h"
@implementation HeaderCarView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
   self=  [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
        self.backgroundView.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        
    }
    return self;
}
-(void)addSubviews{
    self.oneBtn = [PublicBtn buttonWithType:(UIButtonTypeCustom)];
    //_oneBtn.backgroundColor = [UIColor yellowColor];
    _oneBtn.frame = CGRectMake(10, 15, 20, 20);
    [_oneBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    [_oneBtn setTitle:@"11" forState:(UIControlStateNormal)];
    [self.contentView addSubview:_oneBtn];
    self.twoBtn = [PublicBtn buttonWithType:(UIButtonTypeSystem)];
    _twoBtn.backgroundColor = [UIColor yellowColor];
    _twoBtn.frame = CGRectMake(CGRectGetMaxX(_oneBtn.frame)+20, 15, 200, 20);
    //[_twoBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    [_twoBtn setTitle:@"京东商家-哈哈" forState:(UIControlStateNormal)];
    [self.contentView addSubview:_twoBtn];

    
    
}
@end
