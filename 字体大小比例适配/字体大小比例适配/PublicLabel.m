//
//  PublicbLabel.m
//  字体大小比例适配
//
//  Created by 席亚坤 on 17/2/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "PublicLabel.h"

@implementation OneLabel
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
   self.font = [UIFont systemFontOfSize:SizeOne];
    
    
}

@end

@implementation TwoLabel
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
@implementation ThreeLabel
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

@implementation FourLabel
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

