//
//  PublicSize.m
//  字体大小比例适配
//
//  Created by 席亚坤 on 17/3/1.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "PublicSize.h"

@implementation PublicSize

@end

/////               标签***************************************************************************************************************************************************************************************************////
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

//-(void)layoutSubviews{
//    [self  SetUpSize];
//}
//-(void)layoutIfNeeded{
//    [self  SetUpSize];
//}
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



/////             按钮***************************************************************************************************************************************************************************************************////


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


/////               输入框***************************************************************************************************************************************************************************************************////

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

/////               输入栏***************************************************************************************************************************************************************************************************////
@implementation OneTV
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

@implementation TwoTV
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
@implementation ThreeTV
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

@implementation FourTV
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
