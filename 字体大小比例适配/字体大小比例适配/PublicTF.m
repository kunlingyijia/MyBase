//
//  PublicTF.m
//  字体大小比例适配
//
//  Created by 席亚坤 on 17/3/1.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "PublicTF.h"

@implementation OneTF
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
    self. font = [UIFont systemFontOfSize:SizeOne];
    
    
}

@end

@implementation TwoTF
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
    self.font = [UIFont systemFontOfSize:SizeTwo];
    
    
}

@end
@implementation ThreeTF
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
    self.font = [UIFont systemFontOfSize:SizeThree];
    
    
}

@end

@implementation FourTF
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
    self.font = [UIFont systemFontOfSize:SizeFour];
    
}

@end
