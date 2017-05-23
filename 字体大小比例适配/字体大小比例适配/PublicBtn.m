//
//  PublicBtn.titleLabel.m
//  字体大小比例适配
//
//  Created by 席亚坤 on 17/2/28.titleLabel.
//  Copyright © 2017年 席亚坤.titleLabel. All rights reserved.titleLabel.
//

#import "PublicBtn.h"

@implementation OneBtn
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self SetUpSize];
        
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self SetUpSize];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
-(void)SetUpSize {
    self.titleLabel. font = [UIFont systemFontOfSize:SizeOne];
    
    
}

@end

@implementation TwoBtn
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
-(void)SetUpSize {
    self.titleLabel.font = [UIFont systemFontOfSize:SizeTwo];
    
    
}

@end
@implementation ThreeBtn
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
-(void)SetUpSize {
    self.titleLabel.font = [UIFont systemFontOfSize:SizeThree];
    
    
}

@end

@implementation FourBtn
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self SetUpSize];
    }
    return self;
}
-(void)SetUpSize {
    
    self.titleLabel.font = [UIFont systemFontOfSize:SizeFour];
    
}

@end

