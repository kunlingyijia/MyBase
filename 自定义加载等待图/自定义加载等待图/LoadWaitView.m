//
//  LoadWaitView.m
//  自定义加载等待图
//
//  Created by 席亚坤 on 17/1/18.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "LoadWaitView.h"
#import "UIImage+GIF.h"
@interface LoadWaitView (){
    NSString * _image;
   
}

@end


@implementation LoadWaitView
- (instancetype)initWithimage:(NSString*)image
{  CGRect frame  = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2);
    self = [super initWithFrame:frame];
    if (self) {
        _image = image;
        self.backgroundColor = [UIColor blueColor];
        [self addSubViews];
    }
    return self;
}

-(void)addSubViews{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100    , 100)];
    _bottomView.center = self.center;
    _bottomView.layer.masksToBounds = YES;
    _bottomView.layer.cornerRadius = 5;
    _bottomView.backgroundColor = [UIColor redColor];
    
    [self addSubview:_bottomView];
    self.imageView = [[UIImageView alloc]initWithFrame:_bottomView.bounds];
    _imageView.backgroundColor = [UIColor yellowColor];
   _imageView.image =[UIImage  sd_animatedGIFNamed:_image ];

    //_imageView.image = _image;
    [_bottomView addSubview:_imageView];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
